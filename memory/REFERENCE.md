# Memoria de referencia — MADM Misión Control

## Visión compartida
El panel "MADM — Misión Control" es la vista de mando de Más Allá del Miedo. Aquí convergen las tareas humanas, los modelos autónomos y los flujos de ejecución. La meta es que cualquier miembro del equipo pueda responder: ¿qué estamos haciendo, quién lo lidera y cómo sé que está listo?

## Roles y agentes autónomos
1. **madm_research (Centinela de Insights)**
   - Rol: investigación y curaduría de ideas.
   - Expectativa: responde a prompts de investigación rápida y sintetiza hallazgos en resúmenes de máximo 3 viñetas.
   - Estado operativo: activo → check-in cada 12 h. Si pasa más de 24 h sin actividad, se mueve a `blocked` y se lanza una revisión humana.

2. **madm_ops (Guardia de Infra)**
   - Rol: runbooks, scripts y despliegues.
   - Expectativa: antes de cualquier deploy, corre `python scripts/export_board.py` y validaciones locales. Reporta fallos con logs y pasos claros.
   - Estado operativo: revisión continua del pipeline; necesita token de Cloudflare para continuar.

3. **madm_content (Narrador en residencia)**
   - Rol: storytelling, guiones y copy.
   - Expectativa: produce mínimo 3 variantes de copy por sprint y las etiqueta según tono (motivacional, empático, directo).
   - Estado operativo: en revisión cuando requiere aprobación de tono; su bandera se mueve a `activo` una vez validado el contenido.

## Protocolos de actualización
- Cada cambio en `TASK_BOARD.md` se debe reflejar en `site/data/board.json` con el script `scripts/export_board.py`.
- El calendario (archivo `site/data/calendar.json`) solo se actualiza tras una ejecución confirmada; debe incluir evidencia y checklist completo para considerar la tarea exitosa.
- Los sub-agentes se describen en `site/data/subagents.json`: nombre, alias, rol, estado actual, dependencia y próximo paso. Si cambia un estado, se deja un comentario en el board y se actualiza el JSON.

## Entrenamiento de nuevos bots
Para crear un nuevo sub-agente autónomo:
1. Definir su mandato (objetivo claro) y limitaciones (qué no debe hacer).
2. Crear la entrada correspondiente en `site/data/subagents.json` (nombre, alias, rol, estado inicial, dependencia, próximo paso).
3. Añadir un flujo de preguntas/respuestas en `memory/REFERENCE.md` con ejemplos de prompts, contra preguntas y reglas de escalamiento.
4. Documentar sus checkpoints en `TASK_BOARD.md` bajo una tarea específica (p.ej. "Entrenar madm_social").

## Prompts base sugeridos
- **Briefing de investigación**: "Resumen en 3 puntos de [tema], incluye riesgos éticos y oportunidades de acción inmediata.".
- **Check-in operativo**: "¿Cuál fue tu último paso, qué dependencias necesitas y qué bloqueos tienes?".
- **Actualización de tareas**: "Lista la tarea con estado, responsable y evidencia adjunta.".

## Referencias técnicas
- Script de exportación: `python scripts/export_board.py`.
- Build del sitio: `cd site && npm run build`.
- Despliegue: GitHub Actions `.github/workflows/deploy.yml` → Cloudflare Pages.
