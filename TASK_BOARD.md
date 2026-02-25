# Más Allá del Miedo — Task Board

Este tablero registra el estado de cada iniciativa que estamos abordando (nuevos modelos autónomos, contenidos, infraestructura, etc.), quién la ejecuta y qué toca hacer después. Cada vez que surge una tarea nueva o se mueve una existente, actualizo este archivo y te aviso para que tengas visibilidad en tiempo real.

## Estados definidos
1. **Backlog**: idea capturada pero todavía en espera.
2. **In progress**: alguien está trabajando activamente.
3. **Review/Blocked**: necesita revisión externa o está detenido por dependencias.
4. **Done**: cerrada, con evidencia o entregable.

## Board actual
| Task | Estado | Responsable | Actualizaciones recientes | Siguiente paso | Fecha actualización |
| --- | --- | --- | --- | --- | --- |
| Definir estructura del task-board y protocolo de actualizaciones | Done | Faro (yo) | Convertimos el tablero en una página desplegada con procesos claros de exportación (ya no se requiere más diseño). | Revisa y ajusta solo si cambiamos el formato del board o agregamos nuevas columnas. | 2026-02-25 |
| Recopilar requerimientos para los modelos autónomos que ejecutarán tareas | Done | Neto | Recibimos las prioridades, las documentamos y las usamos para alimentar los datos del sitio y el calendario. | Mantén actualizadas las prioridades y comparte ítems nuevos en el panel. | 2026-02-25 |
| Documentar flujo de actualizaciones automáticas (alertas / diffs) | Done | Equipo (Futuro modelo de automatización) | El workflow de GitHub Actions ejecuta `scripts/export_board.py` y despliega el sitio en Cloudflare Pages. | Monitorea alertas o nuevas formas de notificación cuando abramos más canales. | 2026-02-25 |
| Mantener lista de tareas asignadas a Neto | Done | Neto | La sección dedicada en el tablero/memoria permanece visible y sincronizada. | Sigue alimentando tareas tuyas; el panel se actualiza cada vez que se exporta. | 2026-02-25 |
| Crear la página "MADM - Misión Control" para Cloudflare Pages enlazado al repo y el tablero visual | Done | Faro + Equipo | Astro + JSON + CI/CD publican la página con el badge de skills verificados, el board, el calendario y los sub-agentes. | La página es estable; planifica nuevas secciones en futuras iteraciones. | 2026-02-25 |
| Desarrollar el calendario de tareas con indicadores de estado y evidencia de ejecución | Done | Equipo + Faro | El timeline y checklist ya muestran estados, evidencias y validaciones de ejecución. | Actualiza `site/data/calendar.json` con cada nueva ejecución confirmada. | 2026-02-25 |
| Mapear la estructura de sub-agentes, funciones y estado operativo | Done | Faro + Neto | Las tarjetas despliegan roles, dependencias y check-ins; la memoria documenta los prompts y reglas. | Registra nuevos sub-agentes o cambios de estado en el JSON y en `memory/REFERENCE.md`. | 2026-02-25 |
| Integrar QMD, Supermemory, Prompt Guard y Dont Hack Me | Done | Faro + Equipo | Documentamos y automatizamos la preparación (setup + verificación) de los skills en `scripts/*.sh`. | Mantén los repositorios actualizados y registra el `.skill` oficial de Dont Hack Me. | 2026-02-25 |
| Automatizar la verificación de skills antes de ejecutar código | Done | Faro + Equipo | Toda ejecución pasa por `scripts/run_with_skills.sh`, y el badge en el board lo refleja. | Continúa usando ese flujo y agrega nuevas validaciones si sumamos más skills. | 2026-02-25 |

## Tus tareas (Neto)
| Task | Estado | Nota rápida |
| --- | --- | --- |
| Proveer criterios de asignación y prioridades para nuevos modelos autónomos | Backlog | Necesitamos saber qué sujetos, deadlines y dependencias consideras críticos, así ya puedo convertirlo en tareas concretas y asignarlas automáticamente. |
| Validar los objetivos y la experiencia deseada para la página "MADM - Misión Control" (mapas de tareas, calendario, sub-agentes) | Backlog | Da tus prioridades de contenido, qué información es crítica en el panel y qué métricas de éxito debe mostrar la página. |

## Cómo mantendremos el tablero
1. Cada vez que acordemos una nueva tarea o cambie su estado, la agrego o edito en este archivo y te aviso ("bordado en tiempo real").
2. Si hay múltiples responsables (p.ej. humanos + agentes autónomos), los listamos en "Responsable" y se documenta quién debe tomar el siguiente paso.
3. Para tareas gigantes, creamos sublistas y referenciamos IDs (p.ej. `T-01`).
4. Cuando completes una tarea, comparte evidencia o resultado para moverla a "Done" y cerrar el ciclo.

## Próximas actualizaciones
- Documentar las métricas de despliegue y guardias de seguridad dentro del panel cuando lancemos la siguiente iteración.
- Agregar nuevos modelos/experimentos al tablero con sus correspondientes evidencias una vez que definamos la siguiente ola de trabajo.

## Siguiente paso inmediato
Confírmame si quieres más columnas (por ejemplo, tipo, priorización, dependencia). También dime qué tareas específicas quieres que registre por ahora (proyectos, modelos, contenido, etc.) y yo las convierto en entradas con estado y responsable.
