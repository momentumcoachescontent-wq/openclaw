# Proyecto "MADM - Misión Control"

## Objetivo
Construir una página pública estática (Cloudflare Pages) conectada al repositorio `momentumcoachescontent-wq/openclaw` que exhiba el "mapa de tareas", el calendario de ejecuciones y la estructura/estado de los sub-agentes autónomos en tiempo real.

## Componentes clave
1. **Board visual (HTML + CSS + JS)**
   - Mostrar las filas del task board con estado, responsable, actualizaciones y siguiente paso.
   - Agregar filtros por responsable/estado y destacar las tareas de Neto.
2. **Calendario de tareas**
   - Usar un dataset JSON dentro del repo (`data/calendar.json`) que describe tareas con fecha de inicio, fin, estado y evidencia (enlaces o notas).
   - Representarlo como vista de calendario (puede ser tabla semanal/mensual) y marcar tareas con colores según estado.
3. **Módulo de sub-agentes**
   - Definir un archivo (`data/subagents.json`) con cada agente: nombre, rol, estado (activo/blocked/review), dependencia y nota.
   - Mostrar tarjetas que expliquen qué hace cada agente y su estado.
4. **Automatización y sincronización**
   - Configurar GitHub Actions para regenerar/actualizar los archivos `task_board.md`, `task_board.html` y los JSON de datos según cambios (puede ser un script Node/Python que convierta tablas Markdown en JSON para la UI).
   - Deploy automático en Cloudflare Pages usando el repositorio como fuente.
5. **Memoria de referencia y entrenamiento**
   - Crear carpeta `memory/` con `reference.md` y plantillas para describir decisiones, normas y prompts para futuros bots.
   - Documentar los roles, flujos y criterios para entrenar nuevos agentes autónomos (atributos, indicadores, reglas de escalamiento).

## Pasos inmediatos
1. Estructurar el sitio en `/openclaw/site/` con los siguientes archivos base: `index.html`, `styles.css`, `app.js`, `data/board.json`, `data/calendar.json`, `data/subagents.json`.
2. Implementar un script `scripts/export_board.py` (o Node) que lea `TASK_BOARD.md` y actualice los JSON de datos, para mantener sincronía entre Markdown y UI.
3. Definir GitHub Actions (`.github/workflows/deploy.yml`) que:
   - Ejecuten el script de exportación tras cada push.
   - Desplieguen el sitio a Cloudflare Pages (usando `pages-deploy@v1` y la URL del proyecto de Cloudflare).
4. Armar la memoria: `memory/REFERENCE.md` con secciones "Visión", "Modelos autónomos", "Protocolos de actualización" y ejemplos de prompts para cada sub-agente.
5. Documentar en `README.md` del repo cómo contribuir al tablero, cómo actualizar el calendario y cómo entrenar nuevos agentes (incluye cómo ejecutar localmente el site y cómo desplegar).

## Siguientes pasos (cuando tengamos acceso a Cloudflare)
- Configurar el proyecto en Cloudflare Pages apuntando a la carpeta `site/` del repo.
- Establecer un webhook o GitHub Token con permisos para activar despliegues automáticos.
- Crear un panel de control (página adicional o sección del board) donde se pueda ver qué auto-agente está ejecutando qué tarea y cómo reporta estado (logs, check-ins).

## Validaciones y métricas de éxito
- La página debe reflejar los datos del board con cada push (estado actualizado < 5 min).
- El calendario debe mostrar al menos 6 tareas con fechas, responsable y estado por semana.
- La sección de sub-agentes debe listar cada modelo con su estado y notas sobre bloqueos.
- La memoria debe contener instrucciones para crear y entrenar al menos 2 agentes nuevos.
