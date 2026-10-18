# INSTALAR — Second Brain de FPL Business (instrucciones para Claude)

> Para la persona: abre una sesión de Claude Code con este repositorio y
> escribe solo: **`Lee INSTALAR.md y sigue las instrucciones.`**
> Claude hace el resto y te pregunta lo que necesita.

Claude: este archivo es tu guion de instalación. Síguelo paso a paso.
Habla en el idioma en que te escribe la persona, en palabras sencillas,
sin jerga técnica. No envíes nada hacia afuera y no cambies nada en
ningún programa: la instalación solo lee y escribe en este repositorio.

## Paso 0 — ¿Ya está instalado?

1. `git fetch origin main` (si la rama `main` todavía no existe en
   GitHub, sigue: la crearás en el paso 7).
2. Si `CLAUDE.md` ya no contiene ningún `{{`: la instalación ya se hizo.
   Dilo, y di que el siguiente paso es `/entrevista-segundo-cerebro` en
   una sesión nueva. Fin.
3. Si existe la carpeta `_claude/` y no existe `.claude/`: renómbrala
   con `git mv _claude .claude`. (Viene con guion bajo porque al subir
   archivos por la web de GitHub las carpetas que empiezan con punto a
   veces se pierden.) Si existen ambas: no toques nada y pregunta.
4. `chmod +x .claude/hooks/*.sh`.

## Paso 1 — Saludo (texto fijo, adáptalo al idioma)

> ¡Hola! Soy el asistente del **Second Brain de FPL Business**. Voy a
> instalar tu segundo cerebro: la memoria de tu empresa con
> la que tu asistente de IA trabajará a partir de ahora. Primero reviso
> qué conexiones tiene esta sesión, luego te hago seis preguntas cortas
> y dejo todo listo. Después empezamos la entrevista, bloque por bloque.

## Paso 2 — Revisar conexiones (sin preguntar)

Comprueba de verdad (lista de herramientas y ToolSearch con palabras
como `gmail`, `drive`, `calendar`, `crm`, `github`), no supongas:

| Conexión | Para qué | Estado |
|---|---|---|
| GitHub (este repositorio) | la memoria misma | `git remote -v`, ¿se puede hacer push? |
| Google Drive | leer documentos existentes | conectado / falta |
| Gmail | leer ejemplos de correos, borradores | conectado / falta |
| Google Calendar | rutinas, reuniones | conectado / falta |
| CRM | clientes, oportunidades | conectado / falta / ¿cuál? |

Muestra la tabla. Lo que falta no bloquea la instalación: anótalo en
`PENDIENTES.md` con la instrucción «conectar en
https://claude.ai/customize/connectors y abrir una sesión nueva».
Nunca pidas contraseñas, tokens ni claves en el chat.

## Paso 3 — Seis preguntas (en un solo mensaje, con ejemplos)

1. **Nombre de la empresa** (como debe aparecer en los documentos).
2. **¿Quién aprueba** lo que sale hacia afuera (correos, publicaciones,
   cambios en programas)? **¿Y quién la suple** cuando no está?
3. **Idioma y trato:** ¿en qué idioma se escriben los documentos y se
   habla con el equipo? ¿Tú o usted? (Ejemplo: «Español, tú».)
4. **Sector y reglas:** ¿a qué se dedica la empresa? ¿Hay cosas que por
   ley no pueden decir o prometer, un regulador, menciones obligatorias?
   («No lo sé» es una respuesta válida.)
5. **Espacio de dirección:** ¿quieres un segundo repositorio privado
   solo para la dirección (cifras, personal, estrategia)? Si ya existe,
   ¿cómo se llama? Si no: «todavía no».
6. **CRM:** ¿qué CRM usan (GoHighLevel, HubSpot, Pipedrive, ninguno…)?

Si una respuesta es vaga, repregunta una vez. Si la persona no sabe:
anótalo en `PENDIENTES.md` y sigue.

## Paso 4 — Completar la constitución

Reemplaza en `CLAUDE.md`:

- `{{EMPRESA}}` → nombre de la empresa
- `{{APROBADOR}}` → nombre y rol de quien aprueba
- `{{SUPLENTE}}` → nombre del suplente (si no hay: «sin suplente — la
  tarea espera»)
- `{{IDIOMA}}` → p. ej. «Español, tú, con tildes y ñ.»
- `{{REPO_DIRECCION}}` → nombre del repositorio de dirección, o
  «todavía no existe; hasta entonces, cifras, personal y estrategia no
  se guardan en ningún lado del sistema»
- `{{REGLAS_SECTOR_RESUMEN}}` → dos líneas con las reglas más
  importantes (p. ej. «No prometer resultados garantizados. No hablar
  mal de otros proveedores.»). Si aún no se sabe: «Aún sin definir —
  se completa en la entrevista (bloque 5).»

Si el idioma elegido no es el español: traduce `CLAUDE.md`,
`INDICE.md`, `PENDIENTES.md`, `DECISIONES.md`, `ESTADO.md`,
`traspasos/README.md` y los tres skills de `.claude/skills/` a ese
idioma, sin cambiar las reglas ni los nombres de los comandos.

Comprueba con `grep -rn "{{" CLAUDE.md` que no quedó ningún marcador.

## Paso 5 — Archivos de partida

1. `empresa/reglas-del-sector.md` con lo que se sabe de la pregunta 4
   (título, «Estado: fecha — fuente: instalación», reglas como lista,
   «sin verificar» donde corresponda).
2. **CRM:** si es GoHighLevel, renombra `mcp-ejemplo.json` a
   `.mcp.json` y anota en `PENDIENTES.md`: «En el entorno de la nube
   (menú del entorno en la barra de título de la sesión → Editar →
   variables de entorno) agregar `GHL_PIT` (Private Integration Token,
   solo los permisos necesarios) y `GHL_LOCATION_ID`. Luego sesión
   nueva.» Si es otro CRM: borra `mcp-ejemplo.json` y anota «conectar
   el CRM como conector en https://claude.ai/customize/connectors». Si
   no hay CRM: borra el ejemplo.
3. Si la persona quiere un espacio de dirección y aún no existe: anota
   en `PENDIENTES.md` los pasos de la sección «Espacio de dirección» de
   la guía (repositorio privado nuevo, solo dirección, con un
   `CLAUDE.md` corto).
4. `INDICE.md`: agrega `empresa/reglas-del-sector.md` y, si existe,
   `.mcp.json`.
5. `DECISIONES.md`: primera fila — fecha de hoy, «Segundo cerebro
   instalado: aprueba X, suplente Y, idioma Z, CRM W», quién respondió,
   «Instalación inicial».
6. `ESTADO.md`: bloque de hoy con **Hecho** (instalación) y
   **Pendiente** (lo que falta conectar, la entrevista).

## Paso 6 — Revisión antes de guardar

- [ ] `.claude/settings.json`, `.claude/hooks/` y los tres skills existen.
- [ ] `CLAUDE.md` sin `{{`.
- [ ] Ningún dato de acceso, token o contraseña en ningún archivo
      (`grep -rniE "token|password|contraseña|api[_-]?key" .` y revisar
      cada coincidencia: los nombres de variables están bien, los
      valores no).
- [ ] Cada archivo nuevo está en `INDICE.md`.

## Paso 7 — Guardar en la rama principal

Haz commit con el mensaje «Segundo cerebro instalado». Luego pregunta:

> La instalación está lista. ¿La guardo en la rama principal? Solo así
> la ven tu equipo y cada sesión nueva.

Solo con un sí: `git push origin HEAD:main` y comprueba con
`git fetch origin main` y `git log origin/main -1` que llegó. Si falla,
dilo enseguida y anótalo en `PENDIENTES.md`.

## Paso 8 — Despedida (texto fijo, adáptalo)

> Listo: la base de tu segundo cerebro está instalada. Las reglas, los
> controles de seguridad y los comandos se cargan al iniciar una sesión,
> así que **abre una sesión nueva** y escribe
> **`/entrevista-segundo-cerebro`**. Ahí construimos juntos la memoria
> de tu empresa, bloque por bloque (2–3 bloques por sesión es lo
> normal). Lo que falta conectar está en `PENDIENTES.md`.
