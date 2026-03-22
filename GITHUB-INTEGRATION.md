# GitHub Integration - Como Usar em Qualquer Repo

Guia de como integrar o Spec Generator em projetos via GitHub.

---

## 📦 Opção 1: Clone e Customize (Mais Simples)

### Passo 1: Seu Projeto Precisa Apenas de 1 Arquivo

```bash
# Seu projeto legado/novo
cd seu-projeto

# Copie apenas:
curl -o .instructions.md https://raw.githubusercontent.com/seu-usuario/spec-generator/main/spec-generator.instructions.md
```

### Pronto! ✅

Não precisa clonar todo um repo. Apenas 1 arquivo de 5KB.

---

## 📦 Opção 2: GitHub Template Repository

### Setup (Faça Uma Vez)

1. **Crie um repo vazio**:
   ```
   Repository name: spec-generator
   Description: Portable spec generation tool for VS Code Copilot
   Public / Private: Public (para poder compartilhar)
   ```

2. **Coloque os arquivos**:
   ```
   spec-generator/
   ├── README.md (aponta para dokumentação)
   ├── .instructions.md
   ├── SPEC-GENERATOR.md
   ├── EXAMPLES.md
   ├── INDEX.md
   ├── templates/
   │   ├── spec-template.md
   │   └── bug-template.md
   ├── scripts/
   │   └── powershell/
   │       └── setup-spec-generator.ps1
   └── LICENSE (MIT)
   ```

3. **Configure como Template**:
   - Vá para Settings → General
   - Check: "Template repository"
   - Save

### Usando em Novo Projeto

```
GitHub → Use this template → Create
↓
Project criado com tudo pronto
↓
code seu-novo-projeto
```

---

## 📦 Opção 3: Git Subtree (Para Projetos Existentes)

### Setup Inicial

```bash
cd seu-projeto-legado

# Adicione como subtree
git subtree add --prefix .specs https://github.com/seu-usuario/spec-generator.git main --squash

# Copie .instructions.md para raiz
cp .specs/spec-generator.instructions.md .instructions.md

# Commit
git add .instructions.md .specs/
git commit -m "feat: setup spec generator for feature specs"
```

### Próximas Vezes (Atualizar)

```bash
# Se quiser nova versão
git subtree pull --prefix .specs https://github.com/seu-usuario/spec-generator.git main --squash
```

---

## 📦 Opção 4: GitHub Package / npm (Avançado)

Se quiser, pode publicar como npm package:

```bash
# package.json
{
  "name": "@seu-usuario/spec-generator",
  "description": "Portable spec generation tool",
  "files": [
    ".instructions.md",
    "templates/",
    "scripts/"
  ]
}

npm publish
```

Então usar em qualquer projeto:
```bash
npm install --save-dev @seu-usuario/spec-generator
```

---

## 🔄 Workflow Recomendado

### Para Seu Time

```
1. Setup Spec Generator em seu-projeto
   ↓
2. Um dev reporta bug/feature
   ↓
3. @copilot "Descreva problema"
   ↓
4. Spec gerada em .specs/
   ↓
5. Discuss com team
   ↓
6. Implement
   ↓
7. Commit junto com spec
   ↓
8. Próximo...
```

### Arquivo no Git

```bash
# Sempre commitar specs!
git add .specs/feature-*.md .specs/bug-*.md
git commit -m "docs: add spec for XXX feature"
```

---

## 🚀 Setup em 10 Segundos

### Copiar para Novo Projeto

```powershell
# PowerShell (Windows)
$ProjectName = "meu-projeto"
$SpecGenUrl = "https://raw.githubusercontent.com/seu-usuario/spec-generator/main"

cd $ProjectName
Invoke-WebRequest -Uri "$SpecGenUrl/spec-generator.instructions.md" -OutFile .instructions.md
mkdir -p .specs/templates | Out-Null

Write-Host "✅ Setup concluído!"
code .
```

```bash
# Bash (Linux/Mac)
cd meu-projeto
curl -o .instructions.md https://raw.githubusercontent.com/seu-usuario/spec-generator/main/spec-generator.instructions.md
mkdir -p .specs/templates
code .
```

---

## 📋 Diferentes Formas de Usar

### Forma 1: Arquivo Único (Mais Simples ⭐)

```
Use em qualquer projeto, coloque `.instructions.md` e pronto
Vantagem: Minimalista, sem dependências
Desvantagem: Sem templates locais
```

### Forma 2: Com Diretório

```
Clone este repo inteiro ou parte dele
Vantagem: Completo, com templates e scripts
Desvantagem: Mais arquivos para gerenciar
```

### Forma 3: Template GitHub

```
Use "Use this template" quando criar novo repo
Vantagem: Setup automático
Desvantagem: Apenas para novos projetos
```

### Forma 4: NPM Package

```
npm install spec-generator
Vantagem: Versionado via npm
Desvantagem: Overhead desnecessário
```

---

## 🛠️ Estrutura de Repo Recomendada

```
spec-generator (seu repo)
├── LICENSE (MIT)
├── README.md
├── INDEX.md
├── SPEC-GENERATOR.md (documentação completa)
├── EXAMPLES.md (exemplos reais)
├── spec-generator.instructions.md (arquivo principal)
├── templates/
│   ├── spec-template.md
│   └── bug-template.md
├── scripts/
│   ├── powershell/
│   │   └── setup-spec-generator.ps1
│   └── bash/
│       └── setup-spec-generator.sh
├── .github/
│   └── ISSUE_TEMPLATE/
│       ├── bug.md
│       └── feature.md
└── github-assets/
    └── screenshot.png
```

---

## 📝 README.md para Seu Repo

```markdown
# Spec Generator 📋

Ferramenta portável para gerar especificações estruturadas de bugs e features.

## Quick Start

### Opção 1: Copiar arquivo (recomendado)
\`\`\`bash
cp spec-generator.instructions.md seu-projeto/.instructions.md
\`\`\`

### Opção 2: Template no GitHub
Click "Use this template" → Create

### Opção 3: Subtree
\`\`\`bash
git subtree add --prefix .specs https://github.com/seu-usuario/spec-generator.git main
\`\`\`

## Usar

\`\`\`
@copilot "O sistema está falhando em..."
\`\`\`

## Docs
- [Documentação Completa](./SPEC-GENERATOR.md)
- [Exemplos Reais](./EXAMPLES.md)
- [Index](./INDEX.md)

**MIT License** - Use em qualquer projeto!
```

---

## 🌐 Publicar com Badges

README com badges:

```markdown
# Spec Generator 📋

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](./LICENSE)
[![Version](https://img.shields.io/badge/version-1.0-green.svg)](./spec-generator.instructions.md)
[![VS Code](https://img.shields.io/badge/VS%20Code-Copilot-blue.svg)](https://github.com/features/copilot)
![Works with any project](https://img.shields.io/badge/Funciona%20com-qualquer%20projeto-success.svg)
```

---

## 🔐 Segurança & Compliance

### Usar em Repo Privado?

SIM! O arquivo `.instructions.md` fica **local** no seu repo:

```bash
# Seu repo privado
meu-banco-code/
├── .instructions.md  ← Fica aqui (não é compartilhado)
├── src/
└── ...

# Copilot processa localmente
# Nada sai do seu ambiente
```

### GitHub Actions Validation

```yaml
# .github/workflows/validate-specs.yml
name: Validate Specs

on: [pull_request]

jobs:
  specs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Check spec exists
        run: |
          if [[ $BRANCH == feature-* ]]; then
            [ -f ".specs/${BRANCH}.md" ] || exit 1
          fi
```

---

## 🎯 Distribution Channels

### Canal 1: Direct (Simples)
```
Copie .instructions.md para seu projeto
Compartilhe o file ou link no GitHub
```

### Canal 2: GitHub Repo
```
https://github.com/seu-usuario/spec-generator
Clone ou use "Use template"
```

### Canal 3: NPM
```
npm install @seu-usuario/spec-generator
Referência em package.json
```

### Canal 4: Documentação Interna
```
Wiki do seu repo
Copie instruções para equipe
```

---

## 📊 Rastreamento de Specs

### GitHub Issues Template

```markdown
# Issue Template para Features

---
name: Feature Request
about: Propor uma nova feature
---

## Descrição
[Descrição breve]

## Problema
[Qual problema resolve?]

## Impacto
[Como impacta no dia a dia?]

## Medição
[Como medir sucesso?]

---
**Próximo Passo**: Copilot vai gerar spec em `.specs/`
```

### GitHub Discussions (Alternativa)

```
Discussions → Categories → Feature Requests
Usuário descreve idéia
Copilot gera spec
Equipe discute antes de implementar
```

---

## ✨ Workflows Avançados

### Workflow 1: Issue → Spec → PR

```
1. Usuário abre Issue
2. @copilot comanda gera spec
3. Spec commitada em branch
4. Dev implementa
5. PR refencia Issue e Spec
6. Merge
```

### Workflow 2: Continuous Specs

```
Cada PR deve ter spec correspondente
CI valida:
- Se toca src/ → precisa .specs/feature-*.md
- Se toca tests/ → precisa .specs/bug-*.md
```

### Workflow 3: Documentation Driven

```
1. Gere spec ANTES de implementar
2. Code review revisa spec
3. Se OK → dev implementa
4. Tests validam
```

---

## 🚀 Próximos Passos

### Para Você (Agora)

1. ✅ Organize arquivos em um repo (veja exemplo acima)
2. ✅ Faça repo público/privado (sua escolha)
3. ✅ Escreva README copiar-cola
4. ✅ Compartilhe link com seu time

### Para Seu Team

```
"Copiem este arquivo em seus projetos:"
https://raw.githubusercontent.com/seu-usuario/spec-generator/main/spec-generator.instructions.md

"Depois usem no Copilot:"
@copilot "Descreva seu problema/feature"

"Specs geradas em .specs/"
```

---

## 🔗 Template Completo em GitHub

Se quiser um exemplo completo pronto para usar:

```
https://github.com/seu-usuario/spec-generator

Clone:
git clone https://github.com/seu-usuario/spec-generator.git
cd spec-generator

Ou use template:
GitHub → Use this template
```

---

## 📞 Suporte & Feedback

Se seu time tiver dúvidas:

1. Aponte para [SPEC-GENERATOR.md](./SPEC-GENERATOR.md)
2. Mostre [EXAMPLES.md](./EXAMPLES.md)
3. Eles vão entender em 5 minutos

---

## 📝 Licença

MIT - Use, modifique, distribua livremente!

```
MIT License
Copyright (c) 2026
Permission is hereby granted, free of charge... [standard MIT]
```

---

**Próxima atualização**: Adicionar script bash para Linux/Mac  
**Roadmap**: Suporte para Jira integration, templates específicos por linguagem
