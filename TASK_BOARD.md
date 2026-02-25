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
| Definir estructura del task-board y protocolo de actualizaciones | In progress | Faro (yo) | Este archivo se creó para registrar las tareas; aún falta acordar columnas del board dinámico y el formato de notificación. | Validar contigo si esta estructura cumple y ajustar según tu feedback. | 2026-02-25 |
| Recopilar requerimientos para los modelos autónomos que ejecutarán tareas | Backlog | Neto | Necesitamos tu lista priorizada de capacidades y criterios de éxito antes de escribir especificaciones. | Comparte los criterios (responsables, entregables, plazos) para convertirlos en tareas concretas. | 2026-02-25 |
| Documentar flujo de actualizaciones automáticas (alertas / diffs) | Backlog | Equipo (Futuro modelo de automatización) | Pendiente definir si el modelo debe hacer commits, notificar por chat o integrar otra herramienta. | Diseñar el trigger y el destino de las notificaciones (ej. canal de Discord, archivo en workspace). | 2026-02-25 |
| Mantener lista de tareas asignadas a Neto | In progress | Neto | Sección dedicada al final de este documento; por ahora solo tu requerimiento del board. | Actualizar con todas tus tareas activas a medida que surjan. | 2026-02-25 |
| Crear la página "MADM - Misión Control" para Cloudflare Pages enlazado al repo y el tablero visual | Backlog | Faro + Equipo | Clonamos el repo vacío y estamos listos para crear assets estáticos y el flujo de deployment hacia Cloudflare Pages. | Definir carpeta `site/` con HTML/CSS/JS, generar layout para el mapa de tareas y conectar el build con GitHub Actions/Cloudflare. | 2026-02-25 |
| Desarrollar el calendario de tareas con indicadores de estado y evidencia de ejecución | Backlog | Equipo + Faro | Determinamos que el calendario debe leer los datos del board y mostrar fechas, responsables y estado de ejecución. | Decidir estructura de datos (JSON/CSV) y construir componente en la página que actualice con cada commit. | 2026-02-25 |
| Mapear la estructura de sub-agentes, funciones y estado operativo | Backlog | Faro + Neto | Queremos que en el panel aparezca quiénes son los modelos autónomos, qué hacen y si están activos/bloqueados. | Diseñar el esquema de metadatos para cada sub-agente (nombre, rol, estado, dependencias) y texto explicativo. | 2026-02-25 |
| Integrar QMD, Supermemory, Prompt Guard y Dont Hack Me | Backlog | Faro + Equipo | Documentamos los cuatro skills en `skills/README.md` y preparamos el script `scripts/setup_skills.sh` para descargarlos. | Validar el script, ejecutarlo para traer los repositorios y registrar manualmente `Dont Hack Me` desde OpenClaw; luego capturar sus patrones en `memory/REFERENCE.md`. | 2026-02-25 |
| Automatizar la verificación de skills antes de ejecutar código | In progress | Faro + Equipo | Creamos `scripts/verify_skills.sh` y `scripts/run_with_skills.sh` para asegurar que los guardias estén cargados antes de cualquier build. | Ejecutar `./scripts/run_with_skills.sh <comando>` antes de tareas críticas y documentar el estado de los skills en el tablero o en `memory/REFERENCE.md`. | 2026-02-25 |

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

## Siguiente paso inmediato
Confírmame si quieres más columnas (por ejemplo, tipo, priorización, dependencia). También dime qué tareas específicas quieres que registre por ahora (proyectos, modelos, contenido, etc.) y yo las convierto en entradas con estado y responsable.
