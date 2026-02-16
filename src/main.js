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
        manifest.forEach(unit => {
            const unitDiv = document.createElement('div');
            unitDiv.className = 'unit-item';

            const title = document.createElement('h3');
            title.className = 'unit-title';
            title.textContent = unit.title;
            unitDiv.appendChild(title);

            unit.lessons.forEach(lesson => {
                const link = document.createElement('a');
                link.className = 'lesson-link';
                link.textContent = lesson.title;
                link.dataset.path = lesson.path;
                link.dataset.unit = unit.title;
                link.onclick = (e) => {
                    e.preventDefault();
                    loadLesson(lesson);
                };
                unitDiv.appendChild(link);
            });

            menuEl.appendChild(unitDiv);
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

        // UI Updates
        document.querySelectorAll('.lesson-link').forEach(l => l.classList.remove('active'));
        document.querySelector(`[data-path="${lesson.path}"]`)?.classList.add('active');
        unitNameEl.textContent = lesson.title;

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
