document.addEventListener('DOMContentLoaded', async () => {
    const menuEl = document.getElementById('course-menu');
    const contentEl = document.getElementById('lesson-container');
    const unitNameEl = document.getElementById('current-unit-name');

    let currentManifest = [];

    // Load Manifest
    try {
        const response = await fetch('content/manifest.json');
        currentManifest = await response.json();
        renderMenu(currentManifest);
    } catch (err) {
        console.error('Falha ao carregar o curso:', err);
        menuEl.innerHTML = '<p class="error">Erro ao carregar menu.</p>';
    }

    function renderMenu(manifest) {
        menuEl.innerHTML = '';

        const folderIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon-folder"><path d="M4 20h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.93a2 2 0 0 1-1.66-.9l-.82-1.2A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2Z"/></svg>`;
        const fileIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon-file"><path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/><polyline points="14 2 14 8 20 8"/></svg>`;
        const chevronIcon = `<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon-chevron"><path d="m6 9 6 6 6-6"/></svg>`;

        manifest.forEach(unit => {
            const unitContainer = document.createElement('div');
            unitContainer.className = 'unit-container open';

            const unitHeader = document.createElement('div');
            unitHeader.className = 'unit-header';
            unitHeader.innerHTML = `
                ${chevronIcon}
                ${folderIcon}
                <span class="unit-title-text">${unit.title}</span>
            `;

            unitHeader.onclick = () => {
                unitContainer.classList.toggle('open');
            };

            const lessonList = document.createElement('div');
            lessonList.className = 'lesson-list';

            unit.lessons.forEach(lesson => {
                const link = document.createElement('a');
                link.className = 'lesson-link';
                link.innerHTML = `${fileIcon} <span>${lesson.title}</span>`;
                link.dataset.path = lesson.path;
                link.dataset.id = lesson.id;

                link.onclick = (e) => {
                    e.preventDefault();
                    e.stopPropagation();
                    loadLesson(lesson);
                };
                lessonList.appendChild(link);
            });

            unitContainer.appendChild(unitHeader);
            unitContainer.appendChild(lessonList);
            menuEl.appendChild(unitContainer);
        });
    }

    let currentLesson = null;

    const getFlatLessons = () => currentManifest.flatMap(u => u.lessons);

    function updateNavigation() {
        const flat = getFlatLessons();
        const currentIndex = flat.findIndex(l => l.id === currentLesson?.id);

        const prev = flat[currentIndex - 1];
        const next = flat[currentIndex + 1];

        const prevBtns = [document.getElementById('prev-lesson'), document.getElementById('prev-lesson-footer')];
        const nextBtns = [document.getElementById('next-lesson'), document.getElementById('next-lesson-footer')];

        prevBtns.forEach(btn => {
            if (btn) {
                btn.disabled = !prev;
                btn.style.opacity = prev ? '1' : '0.4';
                btn.onclick = () => prev && loadLesson(prev);
            }
        });

        nextBtns.forEach(btn => {
            if (btn) {
                btn.disabled = !next;
                btn.style.opacity = next ? '1' : '0.4';
                btn.onclick = () => next && loadLesson(next);
            }
        });
    }

    async function loadLesson(lesson) {
        currentLesson = lesson;

        // Find Unit for breadcrumbs
        const unit = currentManifest.find(u => u.lessons.some(l => l.id === lesson.id));

        // UI Updates
        document.querySelectorAll('.lesson-link').forEach(l => l.classList.remove('active'));
        document.querySelector(`[data-path="${lesson.path}"]`)?.classList.add('active');

        if (unitNameEl) {
            unitNameEl.innerHTML = `<span>${unit ? unit.title : ''}</span> / <span class="active-breadcrumb">${lesson.title}</span>`;
        }

        // Loading State
        contentEl.innerHTML = '<div class="loader">Carregando conteúdo...</div>';

        try {
            const response = await fetch(lesson.path);
            let content = await response.text();

            // Parse Markdown if file is .md
            if (lesson.path.endsWith('.md') && window.marked) {
                // Custom renderer for beautiful code blocks
                const renderer = new marked.Renderer();

                renderer.code = function ({ text, lang }) {
                    const language = lang || 'text';
                    return `
                        <div class="code-block-wrapper">
                            <div class="code-header">
                                <span class="code-lang">${language.toUpperCase()}</span>
                                <span class="code-copy" onclick="navigator.clipboard.writeText(\`${text.replace(/`/g, '\\`').replace(/\$/g, '\\$')}\`)">Copiar</span>
                            </div>
                            <pre><code class="language-${language}">${text}</code></pre>
                        </div>
                    `;
                };

                content = marked.parse(content, { renderer });
            }

            contentEl.innerHTML = content;

            // Re-run Prism for code highlighting
            if (window.Prism) {
                window.Prism.highlightAllUnder(contentEl);
            }

            // Render Mermaid diagrams
            if (window.mermaid) {
                const mermaidBlocks = contentEl.querySelectorAll('.language-mermaid');
                mermaidBlocks.forEach((block) => {
                    const pre = block.parentElement;
                    const code = block.textContent;
                    const div = document.createElement('div');
                    div.className = 'mermaid';
                    div.textContent = code;
                    pre.parentElement.replaceChild(div, pre);
                });

                window.mermaid.run({
                    nodes: contentEl.querySelectorAll('.mermaid')
                });
            }

            updateNavigation();

            // Scroll to top
            document.getElementById('main-content').scrollTop = 0;

            // Update Routing (Basic)
            window.history.pushState(null, '', `?lesson=${lesson.id}`);

        } catch (err) {
            console.error(err);
            contentEl.innerHTML = `<h2>Erro</h2><p>Não foi possível carregar a aula: ${lesson.path}</p>`;
        }
    }

    // Handle Initial Load from URL
    const urlParams = new URLSearchParams(window.location.search);
    const lessonId = urlParams.get('lesson');
    if (lessonId) {
        const interval = setInterval(() => {
            if (currentManifest.length > 0) {
                const initialLesson = getFlatLessons().find(l => l.id === lessonId);
                if (initialLesson) loadLesson(initialLesson);
                clearInterval(interval);
            }
        }, 100);
    }
});
