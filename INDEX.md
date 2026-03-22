# Index - Spec Generator 📋

Ferramenta portável de geração de especificações para qualquer projeto. Use em bugs, features e melhorias.

---

## 📚 Documentação Completa

### 1. **[SPEC-GENERATOR.md](./SPEC-GENERATOR.md)** - Guia Completo
   - O que é e como funciona
   - Instalação em 3 passos
   - Dois modos: Bug vs Feature
   - FAQ e troubleshooting
   - **Leia primeiro!**

### 2. **[EXAMPLES.md](./EXAMPLES.md)** - Exemplos Prácticos
   - 4 exemplos reais de uso
   - Outputs esperados
   - Dicas de melhor prática
   - Setup em novo projeto
   - **Veja outputs reais!**

---

## 🔧 Arquivos de Setup

### Para Desenvolvedores

| Arquivo | Propósito | Usar Quando |
|---------|-----------|------------|
| [spec-generator.instructions.md](./spec-generator.instructions.md) | Agente Copilot | Quer usar Spec Generator |
| [templates/spec-template.md](./templates/spec-template.md) | Template de Feature | Criando feature spec |
| [templates/bug-template.md](./templates/bug-template.md) | Template de Bug | Criando bug spec |

### Scripts de Setup

```powershell
# PowerShell (Windows)
./scripts/powershell/setup-spec-generator.ps1

# Bash (Linux/Mac) - próximo a ser criado
./scripts/bash/setup-spec-generator.sh
```

---

## 🚀 Quick Start (30 segundos)

### Opção 1: Copiar Arquivo Único (Recomendado)

```bash
# Seu projeto
cd seu-projeto-legado

# Copie este arquivo
cp spec-generator.instructions.md .instructions.md

# Crie diretório para specs
mkdir -p .specs/templates

# Copie templates (opcional mas recomendado)
cp templates/spec-template.md .specs/templates/
cp templates/bug-template.md .specs/templates/

# Pronto!
code .
```

### Opção 2: Usar Script Automático

```bash
./scripts/powershell/setup-spec-generator.ps1 -ProjectPath C:\meu-projeto
```

### Opção 3: Via GitHub (Qualquer Repo)

```bash
# Adicione como subtree
git subtree add --prefix .specs https://github.com/seu-usuario/spec-generator.git main

# Ou clone e copie
```

---

## 💡 Como Usar

### 1️⃣ **Bug/Problema**

```
@copilot "O sistema está falhando ao fazer login com email inválido"
```

→ **Resultado**: `.specs/bug-login-email-validation.md`

### 2️⃣ **Feature/Melhoria**

```
@copilot "Quero adicionar notificações em tempo real"
```

→ **Copilot faz 4 perguntas** → **Resultado**: `.specs/feature-notifications.md`

### 3️⃣ **Implemente**

Leia a spec e implemente com confiança!

---

## 📂 Estrutura no Seu Projeto

```
seu-projeto/
├── .instructions.md                   ← Arquivo principal (coloque aqui!)
├── .specs/                            ← Saída das specs geradas
│   ├── README.md                      ← Criado automaticamente
│   ├── templates/                     ← Templates de referência
│   │   ├── spec-template.md
│   │   └── bug-template.md
│   ├── feature-*.md                   ← Geradas pelo Copilot
│   └── bug-*.md                       ← Geradas pelo Copilot
├── src/                               ← Seu código (não alterado!)
├── tests/
└── README.md
```

---

## ✅ Funcionalidades

| Feature | Descrição | Status |
|---------|-----------|--------|
| 🐛 Bug Analysis | Analisa código, valida problema, testa | ✅ |
| ✨ Feature Wizard | 4 perguntas → Spec automática | ✅ |
| 📋 Template-Based | Usa campos estruturados | ✅ |
| 🔍 Codebase Aware | Lê seu código para context | ✅ |
| 🧪 Test Integration | Executa testes se disponível | ✅ |
| 💾 No Code Changes | Apenas gera `.md` | ✅ |
| 📱 Portable | Funciona em qualquer projeto | ✅ |
| 🌐 GitHub Ready | Use em repo público/privado | ✅ |

---

## 🎯 Casos de Uso

### Cenário 1: Legacy Project (Sem Specs)
```
"Estou pegando um projeto antigo sem documentação"
↓
Setup Spec Generator
↓
Gero specs para understand o que cada feature faz
↓
Documento bugs que encontro
```

### Cenário 2: Novo Feature
```
"Quero implementar notificações"
↓
@copilot "Quero adicionar notificações"
↓
Respondo 4 perguntas
↓
Recebo spec completa
↓
Implemento
```

### Cenário 3: Bug Report do Suporte
```
"Cliente reportou problema no dashboard"
↓
@copilot "Dashboard com 100+ reservas trava"
↓
Copilot valida e gera bug spec
↓
Time entende o problema
↓
Implementa correção
```

### Cenário 4: Code Review
```
"Revisor pediu para documentar a feature"
↓
Gero spec retroativamente
↓
Outro dev consegue entender rápido
```

---

## 📊 Comparação: Com vs Sem Spec

### ❌ Sem Spec
```
"Implementar notificações em tempo real"
↓
Dev começa direto (perde dias em design)
↓
Implementa sem critério claro
↓
Volta pra redesenhar
↓
Desperdício de tempo
```

### ✅ Com Spec Generator
```
"Implementar notificações em tempo real"
↓
@copilot + 5 minutos = Spec detalhada
↓
Dev implementa com clareza
↓
Menos rework, mais velocidade
```

---

## 🛠️ Para Diferentes Frameworks

### Python/FastAPI
```bash
# Setup padrão
.instructions.md

# Validação de testes:
pytest  # automático
```

### JavaScript/Next.js
```bash
# Setup padrão
.instructions.md

# Validação de testes:
Playwright/Jest  # automático
```

### Node.js Backend
```bash
# Setup padrão
.instructions.md

# Validação:
Mocha/Jest  # automático
```

### Polyrepo (Monorepo)
```
project/
├── backend/
│   └── .instructions.md
├── frontend/
│   └── .instructions.md
└── shared/
```

---

## 🔐 Segurança & Privacy

- ❌ **Nunca** modifica seu código
- ❌ **Nunca** executa migrations ou scripts destrutivos
- ✅ Análise **local** via Copilot
- ✅ Saída em **`.md` apenas**
- ✅ Seguro em **repositórios privados**

---

## ⚙️ Customizações Avançadas

### Mudar Directory de Output

Edit `.instructions.md`:
```markdown
## Requisito Customização  
Se quiser `.design/specs/` ao invés de `.specs/`:
1. Crie pasta `.design/specs/`
2. Copilot detecta automaticamente
```

### Estender Templates

Copie `spec-template.md` e adicione campos:
```markdown
## Campos Customizados
- **Estimate**: [story points]
- **Owner**: [nome do dev]
```

### Integrar com CI/CD

```bash
# Validar que specs existem para PRs
if [[ commits include src/ ]]; then
  require .specs/feature-*.md or bug-*.md
fi
```

---

## 📖 Full Documentation

- **[SPEC-GENERATOR.md](./SPEC-GENERATOR.md)** - Setup e workflow completo
- **[EXAMPLES.md](./EXAMPLES.md)** - Exemplos reais com outputs
- **[spec-generator.instructions.md](./spec-generator.instructions.md)** - Instruções do agente
- **[templates/spec-template.md](./templates/spec-template.md)** - Template vazio para features
- **[templates/bug-template.md](./templates/bug-template.md)** - Template vazio para bugs

---

## 🚀 Próximos Passos

### 1. **Setup Agora** (5 min)
```bash
cp spec-generator.instructions.md seu-projeto/.instructions.md
mkdir -p .specs/templates
cp templates/*.md .specs/templates/
code seu-projeto
```

### 2. **Tente Primeiro Bug** (10 min)
```
@copilot "O sistema está falhando em [descrição]"
```

### 3. **Tente Feature** (10 min)
```
@copilot "Quero adicionar [melhoria]"
# Responda 4 perguntas
```

### 4. **Implemente** (baseado em spec)

### 5. **Compartilhe** (mostre para o time)

---

## ❓ FAQ Rápido

**P: Preciso de internet?**  
R: Sim, Copilot precisa de conexão (como sempre)

**P: Funciona em repo privado?**  
R: Sim! Arquivo fica local no seu projeto

**P: Meu código será modificado?**  
R: Nunca! Apenas `.md` em `.specs/`

**P: Qual versão do Copilot preciso?**  
R: VS Code Copilot Chat (versão nova)

**P: Em quantos projetos posso usar?**  
R: Ilimitado! É portável

---

## 🎓 Resources

- 📺 **[EXAMPLES.md](./EXAMPLES.md)** - Ver exemplos reais
- 📖 **[SPEC-GENERATOR.md](./SPEC-GENERATOR.md)** - Documentação completa
- 🛠️ **[spec-generator.instructions.md](./spec-generator.instructions.md)** - Instruções técnicas

---

## 📝 Versão & Histórico

| Versão | Data | Changes |
|--------|------|---------|
| 1.0 | Mar 2026 | Initial release |

---

## 🤝 Contribuindo

Se encontrar bugs ou tiver sugestões:
1. Teste a spec gerada
2. Documente o problema
3. Mande feedback

---

## 📄 Licença

MIT - Use em qualquer projeto!

---

**Última Actualização**: Março 2026  
**Compatível com**: VS Code Copilot, GitHub Copilot Chat  
**Suporte**: Abrir issue com `[spec-generator]` no título
