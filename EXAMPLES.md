# Exemplos de Uso - Spec Generator

Este arquivo contém **exemplos reais** de como usar o Spec Generator em diferentes cenários.

---

## Exemplo 1: Bug Report - Dashboard Vazio

### 📝 Você Digite no Chat Copilot:

```
@copilot O dashboard está carregando vazio quando tenho mais de 100 reservas.
Vejo a página branca e o console tem timeout errors.
```

### 🔄 Copilot (Modo Bug - Análise):

```
Analisando seu projeto...

✅ Encontrado: dashboard.tsx lê reservas sem paginação
✅ Validado: api.ts query no banco sem LIMIT
✅ Testado: Playwright conseguiu reproduzir com 150 registros
⚠️ Root cause: N+1 query na busca de reservas

Gerando especificação...
```

### 📄 Resultado: `.specs/bug-dashboard-timeout-100-reservations.md`

```markdown
# Bug Report: Dashboard Timeout com 100+ Reservas

**Type**: Bug Fix  
**Severity**: P2-High  
**Status**: Draft

## Problema Identificado

Dashboard retorna página em branco quando usuário tem mais de 100 reservas.
Console mostra: `Timeout waiting for response after 30s`

### Passos para Reproduzir
1. Login como usuário com 100+ reservas
2. Navegar para /dashboard
3. Observar página branca ou timeout

### Comportamento Esperado
Dashboard deve carregar em menos de 5 segundos com dados visíveis

## Validação Realizada

| Método | Resultado | Detalhes |
|--------|-----------|----------|
| Code Analysis | ✅ | api.ts:234 - query sem LIMIT |
| Test (Playwright) | ✅ | Reproduzido com 150 registros |
| Error Log | ✅ | `QueryTimeout: 30000ms exceeded` |

## Análise de Causa Raiz

**Arquivo**: `backend/app/api/routes/reservations.py:45`
**Problema**: Query busca TODAS as reservas sem paginação

```python
# ❌ PROBLEMA:
reservations = await db.query(Reservation).filter(
    Reservation.owner_id == user_id
).all()  # <- Sem límite!
```

**Impacto**: 
- Todos os usuários com 100+ reservas afetados
- Impede acesso ao dashboard
- Timeout afeta segurança (sem timeouts = DoS)

## Requisitos para Corrigir

### FR-001: Implementar Paginação
Sistema MUST retornar máximo 25 reservas por página

### FR-002: Estimativa Correta
Sistema DEVE retornar contagem total estimada de registros

### FR-003: Cache de Dados
Sistema DEVE cachear dados de dashboard por 5 minutos

## Critérios de Aceitação

**Cenário 1: Happy Path**
- **Given** usuário com 150 reservas faz login
- **When** navega para /dashboard
- **Then** página carrega em menos de 2 segundos
- **And** exibe primeiras 25 reservas + paginação

**Cenário 2: Performance**
- **Given** qualquer número de reservas (até 10k)
- **When** dashboard é acessado
- **Then** response time sempre < 3 segundos

**Cenário 3: Sem Regressão**
- **Given** usuário com menos de 25 reservas
- **When** dashboard carrega
- **Then** todos os dados são exibidos (não foi truncado)

## Critérios de Sucesso

- **SC-001**: Teste com 1000+ reservas = sucesso
- **SC-002**: Response time < 3s em staging
- **SC-003**: Sem erro de timeout nos logs
- **SC-004**: Todos os testes passam
- **SC-005**: Sem regressão em outras funcionalidades

---

**Próximos Passos**: Review esta especificação e implemente com confiança!
```

---

## Exemplo 2: Feature Request - Notificações em Tempo Real

### 📝 Você Digite no Chat Copilot:

```
@copilot quero adicionar notificações em tempo real quando uma reserva é confirmada
```

### ❓ Copilot (Modo Feature - Perguntas):

```
Perfeito! Vou gerar uma especificação completa. 
Responda estas 4 perguntas:

1️⃣ Qual problema deve ser resolvido?
   (Exemplo: "Clientes não sabem imediatamente quando reserva foi aceita")
   
Sua resposta: [usuário digita]

2️⃣ Quais pontos do processo esse problema impacta negativamente?
   (Exemplo: "Email demora, cliente liga para confirmar gasto com suporte")
   
Sua resposta: [usuário digita]

3️⃣ Se solucionado, de que forma agregará positivamente?
   (Exemplo: "Confirmação imediata = cliente tranquilo + menos ligações")
   
Sua resposta: [usuário digita]

4️⃣ Como medir o benefício futuro?
   (Exemplo: "% redução em chamadas de suporte sobre 'onde está minha reserva'")
   
Sua resposta: [usuário digita]
```

### 👉 Você Responde:

```
1️⃣ Clientes não recebem feedback imediato quando fazem/confirmam uma reserva.
   Esperam confirmação por email que demora 2-5 minutos.

2️⃣ Afeta: 
   - Fluxo de compra (cliente fica inseguro)
   - Suporte (350+ ligações/mês perguntando "recebi?"
   - Confiança na plataforma

3️⃣ Com notificações imediatas:
   - Cliente confirma sucesso na hora
   - Reduz ansiedade
   - Cria urgência (consegui a melhor van!)
   - Impulsa mais reservas

4️⃣ Métricas:
   - % redução em ligações de suporte
   - % aumento em taxa de confirmação
   - Tempo médio entre decisão e confirmação
```

### 🔄 Copilot (Análise do Codebase):

```
Analisando seu arquitetura...

✅ Backend: FastAPI com WebSockets possível
✅ Frontend: Next.js pode receber notificações
✅ Database: PostgreSQL com trigger disponível
✅ Padrão: Você usa Redis em production

Gerando especificação multi-story...
```

### 📄 Resultado: `.specs/feature-real-time-reservations-notifications.md`

```markdown
# Feature Specification: Notificações em Tempo Real de Reservas

**Status**: Draft  
**Prioridades**: P1, P2, P3  
**Baseado em**: Respostas do usuário + Análise de codebase

## Contexto Problema

**Problema**: Clientes não recebem feedback imediato quando confirmam reserva.
Esperam confirmação por email que demora 2-5 minutos.

**Impacto**: 
- 350+ ligações mensais de suporte apenas perguntando se foi confirmado
- Clientes ansiosos durante transação
- Oportunidade de "vender" urgência do veículo perdida

**Benefício Esperado**: Confirmação imediata aumentará taxa de conversão e reduzirá suporte.

**Métrica de Sucesso**: 40% redução em ligações de "onde está minha reserva?"

---

## User Stories (Priorizado)

### Story 1: Notificação in-app ao confirmar reserva (Priority: P1)

**Por quê P1**: Resolve imediatamente o problema core - feedback instant

**Independência**: Pode ser desenvolvido/testado sem Stories 2-3

**Descrição**: Quando cliente clica em "Confirmar Reserva", ele vê notificação visual
na tela imediatamente (toast/banner) confirmando sucesso.

**Acceptance Scenarios**:
1. **Given** cliente completou dados da reserva **When** clica "Confirmar" 
   **Then** vê notificação verde "Reserva Confirmada! ID: #12345" por 5 segundos
   
2. **Given** erro ao confirmar **When** submissão falha 
   **Then** notificação vermelha com motivo do erro aparece

3. **Given** requisição lenta (>2s) **When** cliente aguarda 
   **Then** loading indicator aparece, sem bloquear UI

---

### Story 2: Notificações por Email (Priority: P2)

**Por quê P2**: Segue com P1, complementa feedback. Email é fallback importante.

**Descrição**: Enviar email de confirmação em < 10 segundos após confirmação.

**Acceptance Scenarios**:
1. **Given** reserva confirmada **When** < 2 minutos 
   **Then** cliente recebe email com detalhes

---

### Story 3: Push Notification (Celular) (Priority: P3)

**Por quê P3**: Agregador premium, requer instalação de app mobile

**Descrição**: Se app está instalado, enviar push notification.

---

## Requisitos Funcionais

- **FR-001**: Sistema DEVE exibir notificação visual within 500ms da confirmação
- **FR-002**: Sistema DEVE enviar email within 60s
- **FR-003**: Sistema NÃO deve perder notificações (queue com retry)
- **FR-004**: Notificação DEVE conter ID da reserva e próximos passos

## Requisitos Técnicos

- **RT-001**: Usar WebSocket para notificações em tempo real
- **RT-002**: Queue de notificações (Redis ou RabbitMQ)
- **RT-003**: Fallback para polling se WebSocket falha
- **RT-004**: Email async, não bloquear requisição

## Success Criteria

- **SC-001**: Notificação in-app aparece em < 500ms
- **SC-002**: Email enviado em < 60s
- **SC-003**: Zero notificações perdidas (100% delivery)
- **SC-004**: 40% redução em suporte calls relacionadas
- **SC-005**: Performance: Request time não aumenta > 10ms

---

**Próximos Passos**: Review, esclareça dúvidas, depois implemente por priority!
```

---

## Exemplo 3: Análise Rápida - Melhorias Simples

### 📝 Você Digite:

```
Sistema está muito lento ao listar veículos com filtros
```

### 🤖 Copilot:

```
Detectei que é uma melhoria de performance.
Análise rápida antes de perguntar:

❌ Problema claro: "muito lento" 
⚠️ Preciso de mais dados...

Faço as 4 perguntas?
[Responde SIM]
```

---

## Exemplo 4: Setup em Novo Projeto

### 📝 Terminal PowerShell:

```powershell
# 1. Navegue ao seu projeto
cd meu-projeto-legado

# 2. Copie o setup script
cp C:\projetos\spec-generator\scripts\powershell\setup-spec-generator.ps1 .

# 3. Execute
.\setup-spec-generator.ps1

# Output:
# 🚀 Setup Spec Generator
# ========================
# 📂 Criando diretórios...
# ✅ .specs/templates criado
# ✅ .instructions.md copiado
# ✅ spec-template.md copiado
# ✅ bug-template.md copiado
# 
# ✨ Tudo pronto! Boa codificação! 🚀
```

### 4. Use imediatamente:

```powershell
# Abrir VS Code com Copilot
code .

# No chat do Copilot:
# @copilot O sistema está falhando ao...
```

---

## Dicas pelos Exemplos

### ✅ Para Bug Reports - Seja Preciso:

```
✅ BOM:
"Ao fazer login com email 'test@', vejo erro 500. 
 Tentei 'user@domain.com' e funciona. 
 Logs mostram 'regex validation error'."

❌ VAGO:
"Login não funciona"
```

### ✅ Para Features - Dê Contexto:

```
✅ BOM (Questão 1):
"Clientes não conseguem saber se um veículo está disponível 
 nas suas datas desejadas ANTES de fazer a reserva e ter que cancelar depois.
 Impede decisão rápida e causa múltiplas tentativas."

❌ VAGO:
"Quer uma feature de disponibilidade"
```

### ✅ Métricas Mensuráveis:

```
✅ BOM:
"Redução de 50% em tempo de load de dashboard"
"40% redução em tickets de suporte sobre status"
"Aumento de 25% na taxa de conversão"

❌ VAGO:
"Melhorar performance"
"Menos problemas"
```

---

## Workflow Recomendado

```
1. Digite problema/feature no Copilot Chat
   ↓
2. Copilot faz perguntas (se needed) ou valida
   ↓
3. Você responde com clareza e contexto
   ↓
4. Arquivo .md é gerado em .specs/
   ↓
5. Você revisa a especificação
   ↓
6. Tira dúvidas com Copilot se necessário
   ↓
7. Implementa com base na spec
   ↓
8. Próxima spec, próxima feature!
```

---

## Estrutura Final de Um Projeto Com Specs

```
seu-projeto/
├── .instructions.md                 ← Ativa Spec Generator
├── .specs/
│   ├── README.md
│   ├── templates/
│   │   ├── spec-template.md
│   │   └── bug-template.md
│   ├── feature-notifications.md      ← Geradas
│   ├── feature-availability-check.md
│   ├── bug-dashboard-timeout.md
│   └── bug-email-validation.md
├── src/                             ← Código real
├── tests/
└── README.md
```

---

## ⚡ Quick Start

```bash
# 1. Copie .instructions.md do spec-generator para seu projeto
cp spec-generator.instructions.md seu-projeto/.instructions.md

# 2. Abra em VS Code
cd seu-projeto
code .

# 3. No VS Code Chat:
@copilot "Descreva um problema ou melhoria"

# 4. ✨ Spec gerada automaticamente em .specs/
```

---

**Pro Tip**: Commit as especificações no git! Elas fazem parte do projeto.

```bash
git add .specs/
git commit -m "docs: feature notifications spec"
```

---

**Versão**: 1.0  
**Data**: Março 2026  
**Próximas Features**: Templates mais específicos (API spec, Data migration, etc)
