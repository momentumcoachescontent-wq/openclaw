# MADM — Misión Control

Este repositorio contiene la base del panel **MADM — Misión Control** que se desplegará en Cloudflare Pages. El objetivo es mostrar en un solo lugar: el mapa de tareas (task board), el calendario de ejecuciones y la estructura/estado de los sub-agentes autónomos del ecosistema Más Allá del Miedo.

## Estructura principal

- `TASK_BOARD.md`: fuente principal del tablero (Workload + estados). Cada cambio aquí se sincroniza con la UI mediante el script de exportación.
- `site/`: sitio Astro que se desplegará en Cloudflare Pages.
  - `src/pages/index.astro`: página principal del panel.
  - `src/styles/global.css`: estilos globales oscuros y contextuales.
  - `data/`: JSON que alimenta el tablero, calendario y sub-agentes.
- `scripts/export_board.py`: convierte la tabla Markdown del task board en `site/data/board.json`.
- `memory/REFERENCE.md`: memoria de referencia para futuros agentes.
- `.github/workflows/deploy.yml`: flujo CI/CD que ejecuta el script, construye el sitio y despliega a Cloudflare.

## Flujo de actualización

1. Modifica `TASK_BOARD.md` (u otra fuente de verdad) y guarda.
2. Ejecuta `python scripts/export_board.py` para regenerar `site/data/board.json`.
3. Desde `site/` corre `npm install` y `npm run build` para validar el sitio localmente.
4. Cuando el repo se actualice (push), la GitHub Action ejecutará el script, construirá y enviará el resultado a Cloudflare Pages (requiere `CF_API_TOKEN`, `CF_ACCOUNT_ID` y `CF_PROJECT_NAME` en secrets).

## Desarrollo local

```bash
cd site
npm install
npm run dev
```

Luego abre `http://localhost:3000` para ver la interfaz: el board, el calendario y los sub-agentes se cargan desde los JSON.

## Memoria y entrenamiento

La carpeta `memory/` contiene decisiones, protocolos y prompts base para los agentes que entrenaremos. Actualiza `REFERENCE.md` a medida que definamos nuevos roles, límites o procedimientos.

## Contribuir

- Agrega tareas al task board y asegúrate de que el script las exporte correctamente.
- Actualiza `data/calendar.json` y `data/subagents.json` con la información oficial de las ejecuciones y modelos.
- Si necesitas nuevos componentes visuales, la carpeta `site/src` contiene lo básico para extender la UI.

## Configurar despliegue

1. Crea el proyecto en Cloudflare Pages (puedes usar el nombre `madm-mision-control`).
2. Apunta la fuente al repo y carpeta `site/`.
3. Define los secrets en GitHub:
   - `CLOUDFLARE_API_TOKEN` (scope `pages:read`, `pages:write`, `account:read`).
   - `CLOUDFLARE_ACCOUNT_ID` (ID de cuenta de Cloudflare).
   - `CLOUDFLARE_PROJECT_NAME` (igual al nombre del proyecto, p. ej. `madm-mision-control`).
4. Cada push ejecutará el workflow y desplegará el panel actualizado.

## Skills adicionales

- `skills/README.md` describe los skills qmd (búsqueda local), openclaw-supermemory (memoria selectiva), prompt-guard (defensa contra inyecciones) y Dont Hack Me. Léelo para conocer cómo instalar cada herramienta y cómo ayudan a ahorrar tokens, memoria y seguridad.
- `scripts/setup_skills.sh` clona los repositorios oficiales y deja los skills dentro de `skills/` para que los puedas activar desde la interfaz (usa `./scripts/setup_skills.sh`).
- `scripts/verify_skills.sh` valida que los skills esperados estén presentes y detecta si faltan dependencias como Bun o prompt_guard; ejecútalo antes de correr cualquier otro comando.
- Usa `scripts/run_with_skills.sh <command>` para combinar setup + verificación y luego ejecutar tu script o build. Esto garantiza que los guardias de seguridad y los motores de memoria estén disponibles cada vez que modificas código.
- Una vez que tengas los repositorios, documenta sus patrones/ajustes en `memory/REFERENCE.md` para que el panel `MADM — Misión Control` refleje qué guardias están activos.
