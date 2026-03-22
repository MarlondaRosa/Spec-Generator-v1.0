# Spec Generator 📋 - Agente de Geração de Especificações

Uma ferramenta portável que funciona com **VS Code Copilot / GitHub Copilot** para gerar especificações estruturadas de bugs e features sem modificar seu código.

## 🎯 O que faz

Transforma descrições vagas em especificações **profissionais e estruturadas** usando análise do codebase e questionários estruturados.

### Dois modos de operação:

#### 🐛 **Modo Bug/Problema**
- Você: "O sistema está falhando ao fazer login com email inválido"
- IA: 
  - ✅ Analisa o código relevante
  - ✅ Valida se o problema é real
  - ✅ Testa com testes automatizados (se disponível)
  - ✅ Gera especificação estruturada de correção

#### ✨ **Modo Feature/Melhoria**
- Você: "Quero adicionar notificações em tempo real"
- IA:
  - ❓ Faz 4 perguntas estratégicas
  - 📊 Analisa seu sistema
  - 🎨 Cria user stories prorizadas
  - 📋 Gera card completo de feature

**Resultado em ambos os casos**: Arquivo `.md` em `.specs/` - pronto para implementação!

---

## 🚀 Como Usar

### Instalação Rápida (3 passos)

#### 1️⃣ Copie os arquivos necessários

```bash
# Crie a pasta de templates
mkdir -p .specs/templates

# Copie os arquivos (de um projeto que já tem, ou do GitHub)
curl -o .instructions.md https://raw.githubusercontent.com/seu-usuario/spec-generator/main/.instructions.md
curl -o .specs/templates/spec-template.md https://raw.githubusercontent.com/seu-usuario/spec-generator/main/templates/spec-template.md
curl -o .specs/templates/bug-template.md https://raw.githubusercontent.com/seu-usuario/spec-generator/main/templates/bug-template.md
```

#### 2️⃣ Abra no VS Code com Copilot

```bash
code seu-projeto/
```

#### 3️⃣ Use natural (em chat, comentário ou prompt)

```
@copilot O sistema está retornando "undefined" na página de dashboard quando não há reservas
```

---

## 📋 Exemplos de Uso

### Exemplo 1: Reportar um Bug

**Você:**
```
O sistema falha ao buscar veículos quando o filtro de preço é maior que 50mil.
Clico em buscar, vejo um erro genérico 500, mas nos logs não tem nada.
```

**Copilot (Modo Bug):**
```
Analisando seu código...

✅ Validação: Confirmo que há limite de número não tratado em vehicles.ts:124
✅ Teste: Reproduzi com Playwright - erro 500 confirmado
✅ Root cause: Query não sanitiza valor máximo > 999999

Gerando especificação...
```

**Resultado:** `📄 .specs/bug-vehicle-price-filter.md`

---

### Exemplo 2: Solicitar uma Feature

**Você:**
```
@copilot quero implementar um sistema de notificações push para reservas
```

**Copilot (Modo Feature - Questões):**
```
Entendi! Antes de criar a especificação, responda estas 4 perguntas:

1️⃣ Qual problema deve ser resolvido?
   (Exemplo: "Clientes não sabem quando sua reserva foi confirmada")

2️⃣ Quais pontos do processo esse problema impacta?
   (Exemplo: "Email demora, cliente liga para confirmar, gera suporte extra")

3️⃣ Se solucionado, como agregará positivamente no dia a dia?
   (Exemplo: "Confirmação imediata reduz ligações de suporte")

4️⃣ Como medir o benefício futuro?
   (Exemplo: "% de redução em ligações de suporte sobre status de reserva")
```

**Você responde** → **Resultado:** `📄 .specs/feature-push-notifications.md` (completo!)

---

## 📂 Estrutura de Diretórios

```
seu-projeto/
├── .instructions.md              ← Arquivo do agente (coloque aqui!)
├── .specs/                       ← Saída das especificações
│   ├── feature-xyz.md
│   ├── bug-abc.md
│   └── templates/
│       ├── spec-template.md
│       └── bug-template.md       ← Templates de referência
├── src/
├── tests/
└── ...
```

### Opções de localização

O agente procura em ordem:
1. `.specs/` (recomendado)
2. `.specification/`
3. `specs/`
4. Raiz do projeto

---

## ✅ O que o Agente Faz

### Modo Bug 🐛

1. **Lê seu código** - Identifica arquivos pertinentes
2. **Analisa a lógica** - Valida se o problemaé possível
3. **Executa testes** - Se houver (pytest, Playwright, etc)
4. **Gera especificação** com:
   - Descrição do problema
   - Passos de reprodução
   - Root cause
   - Requisitos de correção
   - Critérios de sucesso
   - Testes necessários

### Modo Feature ✨

1. **Faz perguntas** - 4 questões estratégicas
2. **Estuda seu codebase** - Entende arquitetura e padrões
3. **Cria user stories** - Priorizadas (P1, P2, P3)
4. **Gera especificação** com:
   - Histórias de usuário
   - Acceptance criteria (Given/When/Then)
   - Requisitos funcionais
   - Dados/Entidades envolvidas
   - Critérios de sucesso
   - Edge cases

---

## ⚠️ Restrições (Muito Importante!)

### ✅ Posso fazer:
- Ler e analisar seus arquivos
- Executar testes automatizados
- Fazer perguntas para clareza
- Gerar documentação em `.md`

### ❌ **NUNCA faço:**
- **Modificar código** do sistema
- Alterar configurações
- Executar migrations
- Deletar ou mover arquivos
- Modificar banco de dados

As especificações são **read-only** - você as implementa!

---

## 🔧 Configuração Avançada

### Para projetos específicos

**Python/FastAPI:**
```bash
# Coloque no seu project root
cp spec-generator.instructions.md .

# Certifique que paths do pytest estão corretos
```

**JavaScript/Node:**
```bash
# Se tiver Playwright configurado, templates validam automaticamente
# Certifique que playwright.config.ts exists
```

**Polyrepo:**
```bash
# Se tiver múltiplos services, crie .instructions.md em cada um
monorepo/
├── backend/
│   └── .instructions.md
├── frontend/
│   └── .instructions.md
```

---

## 💡 Dicas de Uso

### Para melhor experiência:

1. **Seja específico no bug report**
   ```
   ✅ BOM: "Ao tentar login com email 'test@', recebo erro 500"
   ❌ VAGO: "Login não funciona"
   ```

2. **No modo Feature, dê contexto**
   ```
   ✅ BOM: "Clientes precisam confirmar disponibilidade do veículo antes de reservar"
   ❌ VAGO: "Adiciona confirmação"
   ```

3. **Revise a especificação gerada**
   - Leia todo o `.md` antes de implementar
   - Faça perguntas se algo não estiver claro
   - Especificações são "living documents"

4. **Use múltiplas especificações**
   ```
   feature-A.md → implementa
   feature-B.md → implementa
   bug-fix-1.md → implementa
   ```

---

## 🌐 Repository Template (Opcional)

Se quiser centralizar e compartilhar especificações:

### Crie um repo no GitHub

```bash
# Exemplo structure
spec-generator/
├── README.md
├── .instructions.md
├── LICENSE (MIT recomendado)
└── templates/
    ├── spec-template.md
    └── bug-template.md
```

### Use em outros projetos:

```bash
# Adicionar como subtree
git subtree add --prefix .specs https://github.com/seu-usuario/spec-generator.git main

# Ou simplesmente copie o .instructions.md
```

---

## 🤝 Integração com CI/CD

### Sugestão: Validar especificações em PR

```bash
# scripts/validate-specs.sh
#!/bin/bash

# Verifica se tem spec para cada feature branch
if [[ $BRANCH == feature-* ]]; then
  SPEC_FILE=".specs/${BRANCH}.md"
  if [ ! -f "$SPEC_FILE" ]; then
    echo "❌ Falta especificação para feature: $SPEC_FILE"
    exit 1
  fi
fi
```

---

## 📖 Referência Rápida

| Comando | Modo | Resultado |
|---------|------|-----------|
| "O sistema falha em..." | 🐛 Bug | `bug-[descrição].md` |
| "Quero melhorar..." | ✨ Feature | Pergunta → `feature-[nome].md` |
| "Escrever spec para..." | 🎯 Flexível | Detecta automaticamente |
| "Gerar card..." | 📋 Feature | `feature-[nome].md` |

---

## ❓ FAQ

**P: Meu código será modificado?**  
R: Nunca! Apenas leitura de arquivos. Saída é `.md` em `.specs/`

**P: Funciona com meu framework?**  
R: Sim! Funciona com qualquer código-fonte que Copilot possa ler (Python, TS, JS, etc)

**P: E se meu projeto não tiver testes?**  
R: Tudo bem! A IA faz análise de código. Testes são bônus quando disponíveis.

**P: Posso usar em projeto privado no GitHub?**  
R: Sim! O arquivo `.instructions.md` fica apenas no seu projeto.

**P: Precisa de internet?**  
R: Apenas VS Code Copilot conectado a internet (como de costume).

---

## 🎓 Exemplos Reais

### Exemplo Completo: Novo Bug Report

```
# Input (Você):
"O dashboard carrega mas dados de veículos ficam em branco 
quando tenho mais de 100 reservas"

# Output (`.specs/bug-dashboard-load-100-reservations.md`):
# Bug Report Specification: Dashboard Blank with 100+ Reservations
- **Severity**: P2-High
- **Root Cause**: Timeout na query sem paginação
- **Files Affected**: dashboard.ts:45, api.ts:123
- **Test**: Pode ser reproduzido com seed default
- [Scenarios, Requirements, etc...]
```

### Exemplo Completo: Feature Request

```
# Input (Você):
@copilot quero notificações por email quando reserva é confirmada

# Questions (Copilot):
1. O que você está tentando resolver com isso?
2. Onde isso impacta?
[... responde 4 perguntas ...]

# Output (`.specs/feature-reservation-confirmation-email.md`):
# Feature: Notificações de Confirmação de Reserva

## User Stories
- Story 1: Enviar email imediatamente após confirmação (P1)
- Story 2: Template customizável de email (P2)
- Story 3: Histórico de notificações enviadas (P3)

[Acceptance Criteria, Requirements, etc...]
```

---

## 📝 Licença

MIT - Use livremente em qualquer projeto!

---

## 🎯 Próximos Passos

1. **Coloque o `.instructions.md` no seu projeto**
2. **Abra VS Code com Copilot ativado**
3. **Descreva um problema ou feature** naturalmente
4. **Revise a especificação gerada**
5. **Implemente com confiança! 🚀**

---

**Versão**: 1.0  
**Suporte**: Funciona com VS Code Copilot e GitHub Copilot Chat  
**Atualizado**: Março 2026
