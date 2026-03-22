# 📋 Spec Generator v1.0

**Ferramenta para gerar especificações estruturadas de bugs e features usando VS Code Copilot**

```
✅ Pronto para usar | 📦 Portável | 🚀 Sem modificar código
```

---

## 🎯 O Que É?

Agente inteligente que:

### 🐛 **Para Bugs**: Analisa → Valida → Testa → Gera Spec
```
Você: "O sistema falha ao fazer login com email inválido"
Copilot: [Lê código] [Testa] [Gera especificação]
Resultado: .specs/bug-login-validation.md
```

### ✨ **Para Features**: Faz 4 perguntas → Gera Spec Completa
```
Você: "Quero adicionar notificações em tempo real"
Copilot: [Faz 4 perguntas estratégicas]
Você: [Responde]
Resultado: .specs/feature-notifications.md
```

---

## 🚀 Quick Start (1 minuto)

### Passo 1: Copie o Arquivo Principal

```powershell
# Windows PowerShell
Copy-Item ".specify\spec-generator.instructions.md" -Destination ".\.instructions.md"

# Linux/Mac Bash
cp .specify/spec-generator.instructions.md ./.instructions.md
```

### Passo 2: Abra VS Code

```bash
code .
```

### Passo 3: Abra Copilot Chat (Ctrl+L)

```
@copilot "O sistema está falhando em [descreva aqui]"
ou
@copilot "Quero adicionar [melhoria aqui]"
```

### Passo 4: Spec Gerada!

```
.specs/
├── bug-*.md (se reportou bug)
└── feature-*.md (se pediu feature)
```

---

## 📚 Documentação

| Arquivo | Para Quem | Tempo |
|---------|-----------|-------|
| **QUICK-REFERENCE.md** | Comece aqui! | 3 min |
| **SPEC-GENERATOR.md** | Guia completo | 10 min |
| **EXAMPLES.md** | Ver exemplos reais | 15 min |
| **GITHUB-INTEGRATION.md** | Publicar no GitHub | 20 min |
| **INDEX.md** | Índice de tudo | 5 min |

---

## 📦 Arquivos Criados

```
.specify/
├── spec-generator.instructions.md     ← COPIE ESTE!
├── SPEC-GENERATOR.md                  
├── EXAMPLES.md                        
├── QUICK-REFERENCE.md                 
├── GITHUB-INTEGRATION.md              
├── INDEX.md                           
├── SETUP-COMPLETE.md                  
├── templates/
│   ├── spec-template.md
│   └── bug-template.md
└── scripts/
    └── powershell/
        └── setup-spec-generator.ps1
```

---

## ✨ Dois Modos

### 🐛 Modo Bug (Análise Automática)

**Quando**: Encontrou um problema no sistema  
**Como**: `@copilot "Sistema faz X mas deveria fazer Y"`

Copilot vai:
1. Ler seu código relevante
2. Validar se o problema é real
3. Testar com Playwright/pytest se houver
4. Gerar especificação com:
   - Descrição clara
   - Passos de reprodução
   - Root cause
   - Requisitos de correção
   - Acceptance criteria

---

### ✨ Modo Feature (Questionário)

**Quando**: Quer implementar uma melhoria  
**Como**: `@copilot "Quero adicionar isto"`

Copilot vai fazer 4 perguntas:

1. **Qual problema deve ser resolvido?**
2. **Quais pontos do processo esse problema impacta negativamente?**
3. **Se o problema for sanado, como agregará positivamente no dia a dia?**
4. **De que forma podemos medir futuramente o benefício?**

Você responde → Copilot gera especificação com:
- User stories priorizadas (P1, P2, P3)
- Acceptance scenarios
- Requisitos funcionais
- Critérios de sucesso
- Edge cases

---

## 🎯 Casos de Uso

### Caso 1: Legasy Project Sem Documentação
```
1. Setup Spec Generator
2. Comece a documentar features existentes
3. Documente bugs que encontra
4. Equipe entende sistema melhor
```

### Caso 2: Novo Feature Complexo
```
1. "Quero notificações push"
2. Responde 4 perguntas
3. Recebe spec estruturada
4. Implementa com clareza
```

### Caso 3: Bug Report do Suporte
```
1. "Sistema falha ao fazer X"
2. Copilot analisa e valida
3. Gera spec de bug
4. Equipe entende e conserta
```

---

## 💡 Dicas

### ✓ Seja Específico

```
❌ "Login não funciona"
✅ "Email 'test@' causa erro 500 no login"

❌ "Lento"  
✅ "Dashboard demora 8s ao carregar com 150 reservas"
```

### ✓ Contexto de Negócio

```
❌ "Adiciona notificações"
✅ "Clientes não sabem quando reserva é confirmada.
    Isso causa 350 ligações/mês de suporte.
    Queremos reduzir para <100 chamadas."
```

### ✓ Commit as Specs

```bash
git add .specs/
git commit -m "docs: add feature-xyz-spec"
```

### ✓ Reutilize em Múltiplos Projetos

Copie `.instructions.md` para quantos projetos quiser!

---

## ✅ O Que Funciona

- ✅ Ler arquivos do projeto
- ✅ Analisar código
- ✅ Executar testes (Playwright, pytest, etc)
- ✅ Gerar `.md` estruturado
- ✅ Fazer perguntas para clareza

---

## ❌ O Que NÃO Faz

- ❌ Modificar código-fonte
- ❌ Alterar banco de dados
- ❌ Executar migrations
- ❌ Deletar ou mover arquivos
- ❌ Alterar configurações críticas

**Especificações são read-only!** Você as implementa.

---

## 📊 Estrutura no Seu Projeto

```
seu-projeto/
├── .instructions.md                   ← Coloque aqui
├── .specs/                            ← Saída gerada
│   ├── README.md
│   ├── templates/
│   ├── feature-*.md
│   └── bug-*.md
├── src/                               ← Código (protegido)
└── tests/
```

---

## 🌐 Publicar no GitHub

Se quiser compartilhar com seu team:

### Opção 1: Arquivo Único
```
Copie: https://raw.github...spec-generator.instructions.md
```

### Opção 2: Repo Completo
```
git clone https://github.com/seu-usuario/spec-generator
```

Veja `GITHUB-INTEGRATION.md` para detalhes.

---

## 🚀 Workflow Recomendado

```
PLANEJAMENTO
  ↓ Problema/Feature
  ↓ @copilot descreve
  ↓ Spec gerada em .specs/

CODE REVIEW
  ↓ Dev revisa spec
  ↓ Clarifica se needed
  ↓ Aprova impl.

IMPLEMENTAÇÃO
  ↓ Dev segue spec
  ↓ Testa contra spec
  ↓ Commit com referência

PRÓXIMA
  ↓ Volta ao planejamento
```

---

## 📞 FAQ Rápido

**P: Preciso de internet?**  
R: Sim, Copilot precisa (como sempre)

**P: Meu código será modificado?**  
R: Nunca! Apenas `.md` em `.specs/`

**P: Funciona com meu stack?**  
R: Sim! Python, JS, TS, etc

**P: Posso usar em múltiplos projetos?**  
R: Sim! Ilimitados

**P: Como publico?**  
R: Veja `GITHUB-INTEGRATION.md`

---

## 🎓 Setup Automático (Opcional)

```powershell
# Windows - Setup automático
cd seu-projeto
.specify/scripts/powershell/setup-spec-generator.ps1
```

Script criará:
- `.instructions.md`
- `.specs/templates/`
- `.specs/README.md`
- Atualiza `.gitignore`

---

## ✨ Próximos Passos AGORA

1. **Copie** `.instructions.md` para seu projeto
2. **Abra** VS Code
3. **Chat**: `@copilot "descreva seu problema"`
4. **Revise** arquivo gerado em `.specs/`
5. **Implemente**! 🚀

---

## 📚 Mais Informações

- **Guia Completo**: [SPEC-GENERATOR.md](./SPEC-GENERATOR.md)
- **Exemplos Reais**: [EXAMPLES.md](./EXAMPLES.md)
- **Quick Ref**: [QUICK-REFERENCE.md](./QUICK-REFERENCE.md)
- **GitHub**: [GITHUB-INTEGRATION.md](./GITHUB-INTEGRATION.md)

---

**Versão**: 1.0 ✅  
**Status**: Pronto para Produção  
**Data**: Março 2026  

**Happy Speccing! 🎯**
