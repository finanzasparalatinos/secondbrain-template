# Second Brain de FPL Business — guía de instalación desde cero

Cómo montar en tu empresa, con tu cuenta y en cualquier computadora el
Second Brain de FPL Business: la memoria de tu empresa para Claude, con
reglas, controles de seguridad y comandos probados en la práctica. Sin
datos de ninguna otra empresa: solo la estructura.

**Lo corto:** creas tres cuentas, copias la plantilla con un clic en GitHub, conectas
dos cosas, eliges el entorno de la nube y escribes una frase. Claude hace el resto y te pregunta lo
que necesita. Tiempo: 30–45 minutos de instalación + la entrevista
(2–3 bloques por sesión, unas 4–6 sesiones en total).

---

## 1. Qué es y cómo funciona

El segundo cerebro tiene tres partes:

| Parte | Qué es | Dónde vive |
|---|---|---|
| **Memoria** | todo el conocimiento de la empresa en archivos de texto: oferta, cliente ideal, tono, ventas, equipo, procesos, decisiones | un repositorio privado en GitHub |
| **Reglas y comandos** | la «constitución» (`CLAUDE.md`), controles de seguridad automáticos y los comandos `/entrevista-segundo-cerebro`, `/traspaso`, `/crear-agente` | dentro del mismo repositorio (`.claude/`) |
| **Conexiones** | acceso a Gmail, Drive, Calendar, CRM, cada persona con su propio login | en tu cuenta de Claude (conectores) |
| **Entorno de la nube** | la «computadora en la nube» donde Claude trabaja con el repositorio | en tu cuenta de Claude (claude.ai/code) |

Cada vez que alguien abre una sesión de Claude Code con ese repositorio,
Claude lee las reglas, conoce la empresa y trabaja con el mismo estado
que todo el equipo.

**Lo que trae el kit** (carpeta `plantilla/`):

```
CLAUDE.md          constitución con marcadores {{…}} (los llena la instalación)
INSTALAR.md        guion que Claude sigue para instalar todo
INDICE.md          mapa de la memoria
PENDIENTES.md      preguntas abiertas
DECISIONES.md      decisiones con motivo
ESTADO.md          hecho / pendiente
traspasos/         traspasos entre sesiones
mcp-ejemplo.json   ejemplo de conexión al CRM GoHighLevel (opcional)
_claude/           se convierte en .claude/ al instalar:
  settings.json      bloqueo de comandos peligrosos + aviso al iniciar sesión
  hooks/             los dos controles automáticos
  skills/            entrevista-segundo-cerebro, traspaso, crear-agente
```

Más `GUIA.md` (esta guía) y `plantilla-direccion/CLAUDE.md` para el
espacio privado de la dirección (opcional).

---

## 2. Lo que necesitas

| Qué | Para qué | Costo | Obligatorio |
|---|---|---|---|
| **Cuenta de Claude** con Claude Code (Pro, Max, Team o Enterprise; para un equipo, Team) | el asistente | según plan — ver https://claude.com/pricing | sí |
| **Cuenta de GitHub** + una **organización** de la empresa | guardar la memoria | gratis | sí |
| **Google Workspace** (Gmail, Drive, Calendar) | leer documentos y correos existentes, rutinas | el que ya tengan | recomendado |
| **CRM** (p. ej. GoHighLevel, HubSpot) | clientes y oportunidades | el que ya tengan | opcional |
| **Navegador** (Chrome, Edge, Safari) | todo se hace en la web | — | sí |
| **App de Claude** (escritorio o móvil) | trabajar desde el teléfono o la compu, dictar por micrófono | gratis | opcional |

No hace falta instalar nada en la computadora: Claude Code trabaja en la
nube (claude.ai/code). Tampoco hace falta saber programar.

---

## 3. Paso a paso

### Paso 1 — Cuenta de Claude

1. Entra a https://claude.ai y crea la cuenta con el correo de la
   empresa.
2. Elige un plan que incluya Claude Code. Si va a trabajar un equipo,
   el plan Team: así cada persona tiene su propio login y sus propias
   conexiones.
3. Comprueba que se abre https://claude.ai/code.

### Paso 2 y 3 — Opción rápida: un clic con la plantilla (recomendada)

1. Crea una cuenta en https://github.com y una organización de la
   empresa (tu foto → **Your organizations** → **New organization** →
   plan **Free**).
2. Abre la plantilla: https://github.com/finanzasparalatinos/secondbrain-template
3. Botón verde **Use this template → Create a new repository**.
4. Owner: tu organización · nombre: p. ej. `empresa-memoria` ·
   **Private** (¡importante!) → **Create repository**.

Listo: el repositorio ya trae todo (también la carpeta `.claude`). Sigue
con el **paso 4**. Si no ves el botón «Use this template», usa la
opción manual de abajo con el ZIP.

### Paso 2 (opción manual) — GitHub: organización y repositorio

1. Crea una cuenta en https://github.com (si no existe).
2. Arriba a la derecha: tu foto → **Your organizations** → **New
   organization** → plan **Free**. Nombre: el de la empresa.
3. En la organización: **New repository**.
   - Nombre: p. ej. `empresa-memoria`
   - **Private** (¡importante!)
   - Marca **Add a README file** (así el repositorio no queda vacío)
   - **Create repository**

### Paso 3 (opción manual) — Subir la plantilla

1. Descarga `segundo-cerebro-plantilla.zip` (te lo entrega FPL Business) y descomprímelo.
2. En tu repositorio de GitHub: **Add file → Upload files**.
3. Abre la carpeta descomprimida `plantilla`, selecciona **todo lo que
   hay dentro** (no la carpeta misma) y arrástralo a la página.
4. Abajo: **Commit directly to the main branch** → **Commit changes**.
5. Comprueba que en GitHub aparecen `CLAUDE.md`, `INSTALAR.md` y la
   carpeta `_claude`.

> ¿Por qué `_claude` con guion bajo? Las carpetas que empiezan con
> punto a veces se pierden al subir por la web. La instalación la
> renombra a `.claude` sola.

### Paso 4 — Conectar GitHub con Claude

1. Abre https://claude.ai/connect-github e inicia sesión con GitHub.
2. Instala la **Claude GitHub App** en tu organización.
3. En **Repository access** elige **Only select repositories** → tu
   repositorio `empresa-memoria`. (Solo ese: Claude no necesita ver más.)
4. Si no eres dueño de la organización, pídele a quien lo sea que
   instale la app.

### Paso 5 — Conectores (Gmail, Drive, Calendar, CRM)

1. Abre https://claude.ai/customize/connectors.
2. Conecta **Google Drive**, **Gmail** y **Google Calendar** — cada uno
   con **tu propio** login de Google.
3. CRM:
   - **HubSpot, Salesforce, Pipedrive u otro con conector:** conéctalo
     en la misma página.
   - **GoHighLevel:** se conecta con variables en el entorno (paso 6).
4. Opcionales útiles: **Canva** (diseños), **Slack** o **Notion**
   si los usan.
5. Cada persona del equipo conecta **sus propias** cuentas. Nunca se
   comparten contraseñas.

> Los conectores se leen al **iniciar** una sesión. Si conectas algo
> nuevo, abre una sesión nueva.

### Paso 6 — Entorno de la nube (obligatorio, una sola vez)

El entorno es la «computadora en la nube» donde Claude trabaja con tu
repositorio. Sin entorno no puede empezar ninguna sesión.

1. Abre https://claude.ai/code.
2. **Primera vez en Claude Code:**
   - Plan **Pro o Max**: el entorno **Default** se crea solo. Sigue con
     el punto 3.
   - Plan **Team o Enterprise**: aparece el formulario **Create your
     first cloud environment**. Deja todo como viene (acceso a la red
     **Trusted**, sin variables, sin script) y pulsa **Create &
     finish**.
3. En la pantalla de sesión nueva, debajo del cuadro de mensaje, hay una
   fila de selectores:
   - **Repositorio:** elige tu repositorio de la memoria
     (p. ej. `empresa-memoria`). Si no aparece, vuelve al paso 4.
   - **Entorno** (el primer selector de la fila): comprueba que está
     **Default**. Si no hay ninguno: **New environment** → nombre
     `Default` · acceso a la red **Trusted** → **Add environment**.
4. Listo. No hace falta nada más: el Second Brain no necesita variables
   ni script de instalación.

> El selector de entorno solo aparece **antes** de enviar el primer
> mensaje. Para cambiar el entorno de una sesión ya abierta: flecha
> junto al título de la sesión → **Edit cloud environment**.

**Solo si usas GoHighLevel:** abre el entorno para editarlo (en el
selector, pasa el mouse sobre **Default** → icono de ajustes, o en una
sesión abierta: flecha junto al título → **Edit cloud environment**) y en
**Environment variables** agrega:

- `GHL_PIT` = el *Private Integration Token* de GoHighLevel
  (GoHighLevel → Settings → Private Integrations → crear token solo con
  los permisos necesarios; en lo posible, solo lectura)
- `GHL_LOCATION_ID` = el ID de tu subcuenta (Settings → Business
  Profile)

Guardar y abrir una sesión nueva.

> **Nunca** pegues un token o contraseña en el chat. Solo en el
> entorno. Detalles oficiales:
> https://code.claude.com/docs/en/cloud-environments

### Paso 7 — La instalación (Claude trabaja)

1. En https://claude.ai/code: **sesión nueva** con tu repositorio y el
   entorno **Default** (paso 6).
2. Escribe exactamente:

   ```
   Lee INSTALAR.md y sigue las instrucciones.
   ```

3. Claude revisa las conexiones, te hace **6 preguntas** (ver sección
   5) y llena la constitución.
4. Cuando pregunte «¿La guardo en la rama principal?» → responde **sí**.

### Paso 8 — La entrevista (construir la memoria)

1. **Sesión nueva** (para que se carguen los comandos y los controles).
2. Escribe:

   ```
   /entrevista-segundo-cerebro
   ```

3. Claude te pregunta bloque por bloque (13 bloques, ver sección 5). Una
   pregunta por mensaje. Puedes responder escribiendo o dictando.
4. Consejo: **material antes que preguntas.** Sube tu web, lista de
   precios, PDFs de oferta, 2–3 correos típicos, reseñas. Claude los
   lee y solo pregunta lo que falta.
5. Después de cada bloque responde **sí** a «¿Guardo el avance en la
   rama principal?».
6. Para seguir otro día: sesión nueva → `/entrevista-segundo-cerebro`
   (Claude retoma donde quedaron).

### Paso 9 — El día a día

- Al terminar una sesión: `/traspaso` (deja qué se hizo, qué falta y
  qué sigue).
- Siempre que Claude proponga guardar en la rama principal: sí, si el
  resultado está bien. Lo que queda solo en la rama de trabajo nadie
  más lo ve.
- Si al iniciar Claude avisa de «trabajo en ramas antiguas»: decide si
  se pasa a la rama principal.

### Paso 10 — Equipo

1. Invita a cada persona a tu plan de Claude (Team) y a la organización
   de GitHub (con acceso al repositorio de la memoria).
2. Cada persona hace los pasos 4, 5 y 6 con **sus propias** cuentas.
3. Comparte con el equipo: «Abre claude.ai/code con el repositorio
   `empresa-memoria` y el entorno Default. Al terminar, `/traspaso`.»

### Paso 11 — Espacio de dirección (opcional, recomendado)

Para cifras, sueldos, personal y estrategia: un **segundo repositorio
privado** solo para la dirección.

1. GitHub → **New repository** → `empresa-direccion`, **Private**.
2. Sube `plantilla-direccion/CLAUDE.md` (está en tu repositorio de la
   memoria) y reemplaza los `{{…}}` (o
   pídeselo a Claude en una sesión con ese repositorio).
3. En la Claude GitHub App agrega este repositorio **solo** en las
   cuentas de la dirección; en GitHub da acceso solo a la dirección.
4. Para el bloque 0b de la entrevista, abre la sesión con **los dos**
   repositorios.

### Paso 12 — Agentes y rutinas (cuando la memoria está lista)

- **Agente:** `/crear-agente` — Claude entrevista, arma la ficha, lo
  prueba con 3 casos reales y te pide el sí antes de ponerlo en marcha.
- **Rutina** (algo que corre solo, p. ej. un resumen cada mañana): pídele
  a Claude en una sesión con el repositorio (ver prompts, sección 4).

---

## 4. Todos los prompts (copiar y pegar)

| Momento | Prompt |
|---|---|
| Instalar | `Lee INSTALAR.md y sigue las instrucciones.` |
| Empezar / seguir la entrevista | `/entrevista-segundo-cerebro` |
| Dar material de una vez | `Te subo nuestro material (web, precios, ofertas, correos). Léelo todo, dime qué entendiste por bloque de la entrevista y pregúntame solo lo que falta.` |
| Saltar un bloque | `Este bloque no lo sé ahora. Anótalo en PENDIENTES.md y sigamos con el siguiente.` |
| Cerrar la sesión | `/traspaso` |
| Guardar en la rama principal | `Guarda todo lo de esta sesión en la rama principal y comprueba que llegó.` |
| Revisar conexiones | `Revisa qué conexiones tiene de verdad esta sesión (GitHub, Gmail, Drive, Calendar, CRM) y muéstramelas en una tabla. No supongas: compruébalo.` |
| Pasar ramas antiguas | `Muéstrame qué trabajo hay en ramas antiguas que no está en main, con una línea por rama, y propón cuál pasar.` |
| Primer agente | `/crear-agente` |
| Rutina diaria | `Crea una rutina que cada día hábil a las 7:00 (zona horaria Europe/Berlin) lea ESTADO.md, PENDIENTES.md y los traspasos de ayer y me prepare un resumen de 5 líneas: qué está pendiente, qué vence, qué decidir. Solo lectura, sin enviar nada.` |
| Rutina con correo (nivel A) | `Igual que la rutina diaria, pero mándame el resumen por Gmail a <tu correo>. Antes de crearla, dime qué hará, qué podría salir mal y cómo lo compruebo.` |
| Agregar una regla tras un error | `Esto salió mal: <qué pasó>. Corrígelo, explícame la causa y deja una regla para que no vuelva a pasar, en el archivo que corresponda.` |
| Anotar una decisión | `Decidimos <qué> porque <motivo>. Anótalo en DECISIONES.md.` |

---

## 5. Todas las preguntas (para preparar las respuestas antes)

### Instalación (6 preguntas, `INSTALAR.md`)

1. Nombre de la empresa.
2. ¿Quién aprueba lo que sale hacia afuera? ¿Quién la suple?
3. Idioma de los documentos y trato (tú / usted).
4. Sector y reglas legales (qué no se puede prometer, regulador,
   menciones obligatorias).
5. ¿Espacio de dirección? ¿Cómo se llama?
6. ¿Qué CRM usan?

### Entrevista (`/entrevista-segundo-cerebro`)

**Bloque 0 — Objetivo y cuello de botella** → `empresa/objetivos-y-cuello-de-botella.md`
- ¿Dónde está la empresa hoy? (facturación aproximada, clientes, equipo)
- ¿A dónde quiere llegar — qué cifra, para cuándo?
- ¿Qué se rompe primero si mañana llegan diez clientes más?
- ¿Qué depende de ti personalmente, que nadie más sabe hacer?
- ¿Qué han probado que no funcionó?
- ¿Qué debería estar resuelto en los primeros 14 días?
- ¿Puede tu equipo ver este objetivo?

**Bloque 0b — Tu perfil** (espacio de dirección) → `perfil-direccion.md`
- ¿Corto y directo o explicado en detalle?
- ¿Qué te molesta de las respuestas de una IA?
- ¿Dónde quieres que te lleve la contraria?
- ¿Qué vas postergando?
- ¿Qué te da energía y qué te la quita?

**Bloque 1 — Empresa** → `empresa/perfil.md` (Claude lee antes tu web,
aviso legal y reseñas)
- La historia de la empresa en cinco frases.
- ¿Qué hacen mejor que otros, y cómo lo sabes?
- ¿De qué están orgullosos, qué harían hoy distinto?

**Bloque 2 — Cliente ideal** → `cliente-ideal/cliente-ideal.md`
- Una persona real con la que funciona muy bien: quién es, qué problema
  tiene, por qué compra.
- ¿Qué cliente no aceptarías nunca más — por qué?
- ¿En qué notas en la primera conversación si alguien encaja?

**Bloque 3 — Oferta** → `oferta/oferta.md` (material: precios, PDFs)
- ¿Qué compra el cliente, qué recibe, cuánto cuesta?
- ¿Entrada más común y paquete más grande?
- ¿Qué piden a menudo que ustedes NO hacen?
- ¿Ventas adicionales a clientes actuales?

**Bloque 4 — Lenguaje** → `lenguaje/tono.md` (material: 2–3 correos)
- ¿Tú o usted con los clientes?
- ¿Cómo firman? (exacto)
- ¿Qué palabras o frases no quieres ver nunca?

**Bloque 5 — Reglas del sector** → `empresa/reglas-del-sector.md`
- ¿Qué no pueden decir o prometer por ley?
- ¿Regulador, menciones obligatorias, formulaciones prescritas?
- ¿Qué va debajo de cada correo / en cada factura?

**Bloque 6 — Marketing** → `marketing/canales-y-experiencias.md`
- ¿Por qué vías llegan las consultas, cuántas al mes?
- ¿Qué probaron, qué funcionó, qué fracasó y por qué?
- ¿En qué gastan y saben qué resulta?
- ¿Qué canal está sin usar aunque encajaría?

**Bloque 7 — Ventas** → `ventas/proceso-y-objeciones.md`
- Paso a paso de «llega una consulta» a «tenemos el encargo».
- ¿Qué dices primero en la primera conversación?
- Las tres objeciones más comunes y tu respuesta.
- ¿Por qué fallan los cierres?

**Bloque 8 — Servicio** → `servicio/proceso.md`
- Después de la firma: ¿qué pasa, en qué orden, hasta la entrega?
- ¿Dónde se traba?
- ¿Citas recurrentes con clientes?

**Bloque 9 — Equipo** → `equipo/equipo.md`
- ¿Quién trabaja aquí y qué hace?
- ¿Quién decide qué sin preguntarte?
- ¿Quién aprueba lo que sale hacia afuera y quién suple?

**Bloque 10 — Programas y datos** → `programas/sistemas.md`
- ¿Qué programas usan a diario?
- ¿Dónde está la verdad si dos programas se contradicen?
- ¿Qué se mantiene por duplicado o se copia a mano?

**Bloque 11 — Rutinas** → `rutinas/resumen.md`
- ¿Qué se repite cada día, semana, mes?
- ¿Qué consume más tiempo?
- ¿Qué haces tú aunque otro podría hacerlo?

**Bloque K — Opiniones de clientes** → `opiniones-clientes/`
- Subir todo: reseñas, correos de agradecimiento, casos de éxito.

**Cierre:** Claude escribe el plan de juego (`empresa/plan-de-juego.md`:
3 palancas, orden, 3 victorias rápidas) y lee los pendientes.

### Crear un agente (`/crear-agente`)

1. ¿Qué agente, qué problema resuelve?
2. ¿Para quién trabaja y quién es responsable?
3. ¿En qué notas que es bueno (señal medible)?
4. Un ejemplo real de la semana pasada y el resultado perfecto.

Después solo los huecos: permisos, formato del resultado, subagentes,
ritmo, casos límite, tres casos de prueba.

---

## 6. Las reglas que trae (y por qué)

Todas nacieron de errores reales en la práctica:

| Regla | Por qué |
|---|---|
| Niveles A/B/C: lo que sale hacia afuera siempre con aprobación | un correo equivocado cuesta un cliente |
| Guardar en la rama principal, siempre preguntando | una entrevista terminada estuvo 8 días invisible en una rama de trabajo |
| Primero traer el estado más nuevo (`git fetch origin main`) | una sesión ve el repositorio como estaba al iniciar |
| Primero comprobar, luego decir («no tengo acceso» incluido) | un «no se puede» sin comprobar frena trabajo que sí era posible |
| Ninguna cifra sin fuente | evitar inventos creíbles |
| Nada de contraseñas ni contactos de clientes en el repositorio | una exportación traía correos de clientes |
| Bloqueo automático de comandos peligrosos | ningún borrado ni sobrescritura sin vuelta atrás |
| Aviso automático de trabajo en ramas antiguas | que nada quede olvidado |

---

## 7. Lista final

- [ ] Claude con Claude Code funciona (claude.ai/code).
- [ ] Repositorio privado en GitHub con la plantilla subida.
- [ ] Claude GitHub App instalada, solo en ese repositorio.
- [ ] Gmail, Drive, Calendar (y CRM) conectados con login propio.
- [ ] Entorno de la nube **Default** creado (acceso **Trusted**).
- [ ] `Lee INSTALAR.md…` ejecutado, guardado en la rama principal.
- [ ] En GitHub: `CLAUDE.md` sin `{{`, carpeta `.claude` existe.
- [ ] Sesión nueva: `/entrevista-segundo-cerebro` aparece y arranca.
- [ ] Equipo invitado; cada uno conectó sus cuentas.

## 8. Problemas frecuentes

| Problema | Solución |
|---|---|
| `/entrevista-segundo-cerebro` no aparece | abrir una **sesión nueva** (los comandos se cargan al iniciar); comprobar en GitHub que existe `.claude/skills/` en `main` |
| No aparece el botón «Use this template» | la plantilla no es visible para tu cuenta: usa la opción manual con el ZIP o pide acceso a FPL Business |
| Falta la carpeta `.claude` / `_claude` en GitHub | volver a subir la carpeta `_claude` (paso 3) y repetir el paso 7 |
| No puedo enviar el primer mensaje / no hay entorno | crear el entorno (paso 6): selector bajo el cuadro de mensaje → **New environment** → **Trusted** → **Add environment** |
| Claude no puede guardar («push» rechazado) | revisar en https://claude.ai/connect-github que la app tenga acceso al repositorio |
| Claude no ve Gmail / Drive / CRM | conectar en https://claude.ai/customize/connectors y abrir sesión nueva; para GoHighLevel revisar las variables del entorno |
| Una sesión no ve lo que hizo otra | lo de la otra quedó en su rama de trabajo: pedir «pasa el trabajo de la rama X a main» |
| Se escribió algo sensible en el repositorio | pedir a Claude que lo quite y deje una regla; si fue una contraseña, cámbiala en el programa |

---

*Second Brain de FPL Business · versión del 18.10.2026. Contiene solo
estructura y reglas, ningún dato de clientes ni de otras empresas.*
