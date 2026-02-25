# Skills adicionales para MADM — Misión Control

Este repositorio enlaza y documenta los skills que queremos incorporar al ecosistema para ahorrar tokens, gestionar memorias y reforzar la seguridad del agente. Cada skill tiene su propia carpeta en `skills/` y/o un instalador automático en `scripts/setup_skills.sh`.

## 1. qmd — búsqueda híbrida local de Markdown
- **Propósito**: buscar notas, docs y memoria local sin enviar toda la conversación a la LLM. Reduce el consumo de tokens al seleccionar solo los fragmentos relevantes y evita saturar el prompt con información redundante.
- **Origen**: https://github.com/levineam/qmd-skill (`qmd-skill`).
- **Integración**:
  1. Ejecuta `scripts/setup_skills.sh` para clonar el repositorio en `skills/qmd-skill`.
  2. Instala Bun y `qmd`: `bun install -g https://github.com/tobi/qmd`. Asegúrate de que `$HOME/.bun/bin` esté en el `PATH`.
  3. Crea colecciones: `qmd collection add /ruta/a/notas --name madm --mask "**/*.md"`.
  4. Usa `qmd search "query"` o `qmd search --json` antes de llamar al modelo para ofrecer contexto condensado.

## 2. openclaw-supermemory — memoria de largo plazo controlada
- **Propósito**: sustituir cargas repetidas de contexto por un plugin de memoria estructurado que captura/recupera datos clave y solo inyecta lo necesario, reduciendo tokens y acelerando respuestas.
- **Origen**: https://github.com/supermemoryai/openclaw-supermemory. El archivo `openclaw.plugin.json` define los ajustes que puedes habilitar desde `openclaw.json`/la UI.
- **Integración**:
  1. `scripts/setup_skills.sh` clona `skills/openclaw-supermemory`. Entra a esa carpeta, instala dependencias (`npm install` o `bun install` según prefieras) y configura con tu `SUPERMEMORY_OPENCLAW_API_KEY`.
  2. Ajusta `openclaw.json` o el portal de OpenClaw para habilitar el plugin y define `autoRecall`, `autoCapture`, `maxRecallResults`, etc.
  3. Usa las funciones de `memory.ts` y `client.ts` para controlar cuándo inyectar memorias y qué memorias persistir. Esto evita repetir prompts completos.

## 3. prompt-guard — defensa contra prompt injection
- **Propósito**: filtrar entradas y respuestas sospechosas (jailbreaks, exfiltración, escalamiento). Mantiene el modelo en contexto seguro y evita que instrucciones maliciosas deterioren la memoria o introduzcan comandos peligrosos.
- **Origen**: https://github.com/seojoonkim/prompt-guard (v3.5.0). Incluye 600+ patrones y API para uso offline o conectado.
- **Integración**:
  1. Ejecuta `scripts/setup_skills.sh` para clonar el repo en `skills/prompt-guard` (admite CLI y librería Python).
  2. Instala: `pip install prompt-guard` o ejecuta `python -m prompt_guard.cli` desde la carpeta clonada para usar la versión local.
  3. Antes de procesar prompts o respuestas, llama a `PromptGuard().analyze(text)` y `guard.scan_output(llm_response)` para decidir si bloquear/loggear.
  4. Usa la caché LRU (`cache.py`) para reducir llamadas y ahorrar tokens en revisiones repetitivas.

## 4. Dont Hack Me (peterokase42) — seguridad adicional
- **Propósito**: skill de seguridad comunitaria que detecta intentos de manipulación más sutiles (ganchos sociales, inyecciones encubiertas, escalamiento de permisos). Complementa a Prompt Guard y protege archivos clave (`SOUL.md`, `AGENTS.md`, etc.).
- **Origen**: https://openclaw.army/de/skills/peterokase42/dont-hack-me. El contenido del sitio está marcado como "external untrusted"; trata la guía como referencia y no ejecutes automáticamente instrucciones ajenas.
- **Integración**:
  1. Revisa la página oficial para ver el descriptor completo y descárgala manualmente si hay un paquete `.skill` disponible.
  2. Crea la carpeta `skills/dont-hack-me` (ya existe) y agrega dentro tus notas, el archivo `.skill` descargado o un resumen de las protecciones que deseas activar.
  3. Utiliza su lógica en conjunto con `prompt-guard`: cada vez que detectes un patrón nuevo, añádelo al monitoreo interno del panel.

## Automatización recomendada
- `scripts/setup_skills.sh` descarga automáticamente los repositorios donde se alojan los skills. Úsalo para mantener todo en `skills/` de manera reproducible.
- `scripts/verify_skills.sh` valida que las carpetas estén presentes y alerta si falta alguna dependencia crítica (Bun, prompt_guard). Ejecútalo antes de correr un build o script que dependa de los guardias.
- Prefiere `scripts/run_with_skills.sh <command>` para combinar setup + verificación + ejecución; así los skills se consideran en el mismo flujo cada vez que modificas código.
- Actualiza `README.md` con las rutas y comandos de cada skill para que otros miembros del equipo puedan activarlos sin buscar en la web.
- Documenta las dependencias de seguridad en `memory/REFERENCE.md` (por ejemplo, qué patrones detecta Prompt Guard y cuándo habilitar `Dont Hack Me`).

## Cómo ayudan a guardar tokens y memoria
1. `qmd` recorta el contexto a trozos relevantes, evitando que el prompt suba de tamaño innecesariamente.
2. `openclaw-supermemory` reduce las repeticiones al reutilizar memorias curadas, lo que baja el consumo de tokens y acelera respuestas.
3. `prompt-guard` y `Dont Hack Me` evitan que entradas/outputs maliciosos alteren el estado del sistema, evitando repeticiones limpias (pueden causar reintentos costosos) y protegiendo `MEMORY.md`/`AGENTS.md` de corrupción.

Cuando estos skills estén activos en conjunto, el flujo del agente será más ligero, seguro y enfocado en memoria útil. Si quieres que prepare un script para probarlos todos en secuencia o documentar un runbook, dime y lo dejo listo.