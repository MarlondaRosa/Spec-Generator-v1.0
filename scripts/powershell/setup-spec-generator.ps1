# Setup Spec Generator em Novo Projeto
# Este script copia os arquivos necessários e configura o environment

param(
    [string]$ProjectPath = ".",
    [switch]$Force
)

# Cores para output
$Green = @{ ForegroundColor = "Green" }
$Yellow = @{ ForegroundColor = "Yellow" }
$Red = @{ ForegroundColor = "Red" }

Write-Host "🚀 Setup Spec Generator" @Green
Write-Host "========================" @Green

# Validar diretório
if (-not (Test-Path $ProjectPath)) {
    Write-Host "❌ Diretório $ProjectPath não existe" @Red
    exit 1
}

# Mudar para diretório do projeto
Push-Location $ProjectPath
$ProjectPath = Get-Location

Write-Host "`n📍 Projeto: $ProjectPath" @Yellow

# Criar diretórios
Write-Host "`n📁 Criando diretórios..."
New-Item -ItemType Directory -Path ".specs/templates" -Force | Out-Null
Write-Host "✅ .specs/templates criado"

# Copiar arquivos do template
$SourceDir = Split-Path -Parent $PSCommandPath

Write-Host "`n📋 Copiando arquivos..."

# .instructions.md
$InstructionsSource = Join-Path (Split-Path -Parent $SourceDir) ".specify\spec-generator.instructions.md"
if (Test-Path $InstructionsSource) {
    Copy-Item $InstructionsSource -Destination ".\.instructions.md" -Force
    Write-Host "✅ .instructions.md copiado"
} else {
    Write-Host "⚠️  Não consegui encontrar spec-generator.instructions.md" @Yellow
}

# spec-template.md
$SpecTemplateSource = Join-Path (Split-Path -Parent $SourceDir) ".specify\templates\spec-template.md"
if (Test-Path $SpecTemplateSource) {
    Copy-Item $SpecTemplateSource -Destination ".\.specs\templates\spec-template.md" -Force
    Write-Host "✅ spec-template.md copiado"
} else {
    Write-Host "⚠️  Não consegui encontrar spec-template.md" @Yellow
}

# bug-template.md
$BugTemplateSource = Join-Path (Split-Path -Parent $SourceDir) ".specify\templates\bug-template.md"
if (Test-Path $BugTemplateSource) {
    Copy-Item $BugTemplateSource -Destination ".\.specs\templates\bug-template.md" -Force
    Write-Host "✅ bug-template.md copiado"
} else {
    Write-Host "⚠️  Não consegui encontrar bug-template.md" @Yellow
}

# Criar README.md em .specs 
$SpecsReadme = @"
# Especificações do Projeto

Este diretório contém as **especificações estruturadas** de features e bugs.

## 📋 Como Usar

1. **Reportar um bug ou feature**:
   ```
   @copilot O sistema está falhando em...
   ```

2. **A IA vai gerar** um arquivo `.md` aqui com análise completa.

3. **Antes de implementar**, revise e faça perguntas se necessário.

## 📂 Conteúdo

- **feature-*.md** - Especificações de novas features
- **bug-*.md** - Correções e bug fixes
- **templates/** - Templates de referência

## ✅ Importante

Especificações são **read-only** - você as implementa!

---

**Gerado com Spec Generator** | [Documentação](../SPEC-GENERATOR.md)
"@

Set-Content -Path ".specs\README.md" -Value $SpecsReadme
Write-Host "✅ .specs/README.md criado"

# Criar .gitignore para .specs (opcional - não ignorar specs!)
$GpsecGitignore = @"
# Spec Generator
# As especificações DEVEM ser commitadas!
# Este arquivo existe apenas como exemplo

# Mas você pode ignorar:
*.tmp
*.backup
"@

# Já vamos deixar commentado por padrão
Write-Host "`n📝 Adicionando ao .gitignore..."
if (Test-Path ".gitignore") {
    $gitignoreContent = Get-Content ".gitignore" -Raw
    if ($gitignoreContent -notlike "*\.specs*") {
        # Adicionar comentário informativo
        Add-Content ".gitignore" "`n# Specs: Manter no versionamento - não ignorar!"
        Write-Host "✅ .gitignore atualizado"
    }
} else {
    Set-Content ".gitignore" "# Add files to ignore here`n`n# Specs: Manter no versionamento - não ignorar!"
    Write-Host "✅ .gitignore criado"
}

# Resumo final
Write-Host "`n" @Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" @Green
Write-Host "✅ Setup Concluído com Sucesso!" @Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" @Green

Write-Host "`n📂 Estrutura criada:" @Yellow
Write-Host @"
$ProjectPath
├── .instructions.md
├── .specs/
│   ├── README.md
│   ├── templates/
│   │   ├── spec-template.md
│   │   └── bug-template.md
│   └── (features e bugs gerados aqui)
└── ...
"@

Write-Host "`n🎯 Próximos Passos:" @Yellow
Write-Host "  1. Abra VS Code: code ."
Write-Host "  2. Ative GitHub Copilot"
Write-Host "  3. Descreva um problema ou feature:"
Write-Host "     @copilot 'O sistema está falhando em...'"
Write-Host "  4. Revise a especificação gerada em .specs/"

Write-Host "`n📖 Documentação:" @Yellow
Write-Host "  Leia: .specs/README.md"
Write-Host "  Full: SPEC-GENERATOR.md"

Write-Host "`n💡 Dicas:" @Green
Write-Host "  • Seja específico ao descrever problemas"
Write-Host "  • Commit as especificações ao repositório"
Write-Host "  • Use como referência antes de implementar"

Pop-Location
Write-Host "`n✨ Tudo pronto! Boa codificação! 🚀" @Green
