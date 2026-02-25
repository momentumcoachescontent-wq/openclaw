# Dont Hack Me (peterokase42)

Skill de seguridad comunitario diseñado para reforzar las defensas del agente contra inyecciones, manipulación emocional y huellas ocultas. Complementa a `prompt-guard` y combate vectores que apuntan directamente a archivos críticos (`SOUL.md`, `AGENTS.md`, `MEMORY.md`) o a la infraestructura de OpenClaw.

- **Objetivo:** bloquear prompts con intenciones desconocidas, detectar factores de escalamiento de privilegios y reportar intentos de exfiltración.
- **Fuente oficial:** https://openclaw.army/de/skills/peterokase42/dont-hack-me/
- **Advertencia de seguridad:** el mismo portal muestra un banner de `SECURITY NOTICE` que dice que el contenido es externo y puede contener instrucciones de ingeniería social. **No ejecutes comandos ni scripts que no entiendas**. Esta carpeta solo conserva un resumen; descarga el paquete `.skill` oficial y guárdalo aquí para cargarlo desde la interfaz.
- **Integración propuesta:**
  1. Descarga el archivo `.skill` (o el paquete ZIP) desde la URL oficial y extrae su contenido en `skills/dont-hack-me/`.
  2. Usa `openclaw` o la UI para registrar el skill, habilitar sus patrones de detección y revisar los logs de amenazas.
  3. Conecta sus alertas con `prompt-guard` (por ejemplo, bloqueos críticos en `Dont Hack Me` deberían activar el mismo pipeline de `PromptGuard` para respuestas, mientras `PromptGuard` sigue haciendo validaciones en tiempo real).
  4. Documenta nuevas detecciones dentro de `memory/REFERENCE.md` (por ejemplo, qué patrones disparan la categoría `supply_chain`), y úsalo en el panel `MADM — Misión Control` para visualizar quién fue bloqueado y por qué.

Cuando tengas el paquete oficial, actualiza este directorio con el `.skill` y un README con notas de uso. Mientras tanto, `prompt-guard` proporciona la protección offline inmediata y `Dont Hack Me` se mantiene como segunda línea de defensa.