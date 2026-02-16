# ✅ Checklist de Publicação - Prof Dev

Use este checklist antes de publicar o site no GitHub Pages.

## 🔍 Verificação Local

### Arquivos Essenciais
- [x] `index.html` existe e está correto
- [x] `src/main.js` existe e carrega o manifest
- [x] `src/style.css` existe com todos os estilos
- [x] `content/manifest.json` existe e está válido
- [x] `README.md` está completo e informativo
- [x] `GUIA-DE-ESTILO.md` está disponível

### Estrutura de Pastas
- [x] `/content` contém as aulas
- [x] `/projetos` contém os projetos práticos
- [x] `/src` contém JS e CSS

### Caminhos Relativos
- [x] Todos os paths no `manifest.json` são relativos (sem `/` inicial)
- [x] CSS no `index.html` usa caminho relativo
- [x] JS no `index.html` usa caminho relativo
- [x] Fetch do manifest em `main.js` é relativo

## 🎨 Conteúdo Visual

### Aula Modelo (aula-01.md)
- [x] Tem emojis nos títulos
- [x] Tem hero section
- [x] Tem pelo menos 3 callouts diferentes
- [x] Tem diagrama Mermaid
- [x] Tem desafio com solução expansível
- [x] Tem seção "O que vem por aí"

### Componentes CSS
- [x] `.hero-section` funciona
- [x] `.callout` (tip, warning, info) funcionam
- [x] `.grid-2` funciona
- [x] `.card` (red, amber) funcionam
- [x] `.challenge-box` funciona
- [x] `.solution-details` funciona

## 🧪 Testes Locais

### Servidor Local
- [ ] Iniciei um servidor local (`python -m http.server` ou `npx serve`)
- [ ] Abri `http://localhost:8000` no navegador
- [ ] O menu lateral carrega corretamente
- [ ] Consigo navegar entre as aulas
- [ ] A aula em Markdown renderiza corretamente
- [ ] As aulas em HTML renderizam corretamente
- [ ] Os diagramas Mermaid aparecem
- [ ] O código tem syntax highlighting
- [ ] Os callouts estão coloridos
- [ ] Os botões expansíveis funcionam

### Responsividade
- [ ] Testei em tela desktop (1920x1080)
- [ ] Testei em tela tablet (768px)
- [ ] Testei em tela mobile (375px)
- [ ] O menu lateral se comporta bem
- [ ] O conteúdo não quebra

### Navegadores
- [ ] Testei no Chrome
- [ ] Testei no Firefox
- [ ] Testei no Edge
- [ ] Testei no Safari (se disponível)

## 📝 Conteúdo

### Aulas
- [ ] Todas as aulas têm conteúdo relevante
- [ ] Não há textos "Lorem Ipsum" ou placeholders
- [ ] Links externos abrem em nova aba (`target="_blank"`)
- [ ] Imagens têm texto alternativo (`alt=""`)
- [ ] Código tem linguagem especificada (```dart, ```javascript)

### Projetos
- [ ] Pasta `/projetos` existe
- [ ] `projetos/README.md` está completo
- [ ] Pelo menos 1 projeto tem README detalhado
- [ ] READMEs dos projetos seguem o template

## 🚀 Preparação para GitHub

### Git
- [ ] Repositório está inicializado (`git init`)
- [ ] Todos os arquivos estão adicionados (`git add .`)
- [ ] Commit inicial feito (`git commit -m "Initial commit"`)
- [ ] Repositório remoto configurado (`git remote add origin ...`)
- [ ] Push feito para o GitHub (`git push -u origin main`)

### GitHub Pages
- [ ] Fui em Settings > Pages
- [ ] Selecionei "main branch" como source
- [ ] Cliquei em "Save"
- [ ] Aguardei alguns minutos
- [ ] Acessei `https://meu-usuario.github.io/prof-dev`
- [ ] O site carregou corretamente online

## 🎯 Pós-Publicação

### Verificação Online
- [ ] Menu lateral funciona
- [ ] Navegação entre aulas funciona
- [ ] Markdown renderiza corretamente
- [ ] Mermaid renderiza corretamente
- [ ] Prism (syntax highlighting) funciona
- [ ] Callouts estão estilizados
- [ ] Imagens carregam
- [ ] Links funcionam

### Performance
- [ ] Página carrega em menos de 3 segundos
- [ ] Não há erros no console do navegador
- [ ] Não há avisos de recursos não encontrados (404)

### SEO e Compartilhamento
- [ ] Título da página está correto
- [ ] Favicon está configurado (opcional)
- [ ] Meta description está presente (opcional)
- [ ] Open Graph tags para redes sociais (opcional)

## 📢 Divulgação

### Para os Alunos
- [ ] Compartilhei o link do site
- [ ] Expliquei como navegar
- [ ] Mostrei onde estão os projetos
- [ ] Indiquei o GUIA-DE-ESTILO para contribuições

### Documentação
- [ ] README.md está atualizado com o link do site
- [ ] TRANSFORMACAO.md documenta todas as mudanças
- [ ] GUIA-DE-ESTILO.md está acessível

## 🔄 Manutenção Contínua

### Semanalmente
- [ ] Verificar se há issues abertas
- [ ] Revisar pull requests (se houver)
- [ ] Adicionar novas aulas conforme o cronograma
- [ ] Atualizar projetos com feedback dos alunos

### Mensalmente
- [ ] Verificar links quebrados
- [ ] Atualizar dependências (Marked.js, Mermaid.js, Prism.js)
- [ ] Revisar analytics (se configurado)
- [ ] Coletar feedback dos alunos

---

## 🎉 Checklist Completo!

Se você marcou todos os itens acima, seu projeto está **100% pronto** para uso!

**Próximos passos:**
1. Compartilhe o link com os alunos
2. Colete feedback
3. Continue adicionando conteúdo
4. Desenvolva os projetos práticos

---

<div align="center">
    <p><strong>Parabéns! 🎊</strong></p>
    <p>Seu material didático está online e pronto para impactar seus alunos!</p>
</div>
