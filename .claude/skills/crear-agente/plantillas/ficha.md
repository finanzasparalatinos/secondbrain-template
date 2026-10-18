# Ficha: <nombre del agente>

Estado: <DD.MM.AAAA> · Versión <1.0> · Situación: <borrador / probado / en uso>
Responsable (mantiene, evalúa la calidad): <persona>
Aprobación de acciones de nivel A: <persona> · Suplente: <persona>
Se llama con: `/agente-<nombre>`

## 1. Encargo en una frase

<El agente hace X para Y, para que Z.>

## 2. Problema y beneficio

- **Hoy sin agente:** <qué queda sin hacer, tiempo, errores típicos>
- **Señal de éxito (medible):** <p. ej. respuesta a consultas en
  < 5 min; 3 h por semana ahorradas; 0 plazos olvidados>
- **Cómo se mide, cada cuánto:** <fuente, ritmo>

## 3. Límites — no es su tarea

- <…> → responsable: <otro agente / persona>

## 4. Disparador y entradas

- **Cuándo:** <a pedido / diario 8 h / con cada cliente nuevo / …>
- **Necesita como entrada:** <qué hay que darle>
- **Si falta una entrada:** <pregunta / sigue con supuesto marcado>

## 5. Proceso y subagentes

1. <paso>
2. <paso>

| Subagente | Encargo | Recibe | Entrega | ¿Skill propio? |
|---|---|---|---|---|
| <nombre> | <una frase> | <entrada> | <salida> | sí / no |

## 6. Conocimiento de la memoria de la empresa

- **Leer siempre:** <rutas, p. ej. `lenguaje/tono.md`,
  `empresa/reglas-del-sector.md`>
- **Si hace falta:** <rutas + cuándo>
- **Nunca aquí, solo en el espacio de dirección:** <sueldos,
  comisiones, contabilidad, personal>
- **Conocimiento más nuevo:** antes de trabajar, `git fetch origin main`.

## 7. Herramientas y accesos

| Programa | Para qué | Leer / escribir | Estado |
|---|---|---|---|
| <CRM> | <…> | <leer> | <conectado, comprobado el … / falta / sin comprobar> |

Accesos solo con conectores y login propio. Nunca datos de acceso aquí.

## 8. Permisos

| Acción | Nivel | ¿Solo? | Aprueba |
|---|---|---|---|
| <escribir un borrador de respuesta> | B | sí, luego informa | — |
| <enviar correo a un cliente> | A | no, solo preparar | <persona> |
| <consultar el CRM> | C | sí | — |

Antes de cada acción de nivel A el agente dice: qué · qué programas ·
qué datos · qué podría salir mal · cómo lo comprueba después.

## 9. Resultado

- **Formato:** <tabla / borrador de correo / informe / registro en CRM>
- **Lugar / destinatario:** <ruta o persona>
- **Idioma y tono:** <según `lenguaje/tono.md`>
- **Extensión:** <…>
- **Ejemplo:** <ejemplo corto de un resultado perfecto o ruta>

**Listo cuando …**
- [ ] <punto comprobable>
- [ ] Cada cifra tiene fuente.
- [ ] Reglas del sector cumplidas.

## 10. Control de calidad y puntos de parada

- **Autorrevisión antes de entregar:** <marcar la lista de la sección 9,
  revisar fuentes, leer el resultado contra el encargo>
- **Parar y preguntar si:** <los datos se contradicen · un campo del
  programa no encaja · un cliente pregunta algo legal/fiscal · monto
  sobre <…> · nivel poco claro>
- **Errores:** corregir, entender la causa, agregar la regla aquí
  (`CLAUDE.md` punto 3).
- **Actitud según los valores de la empresa:** <una frase por valor>

## 11. Casos de prueba

| # | Tipo | Entrada (caso real) | Resultado esperado | Resultado del … |
|---|---|---|---|---|
| 1 | Caso normal | <…> | <…> | |
| 2 | Caso límite (faltan datos / se contradicen) | <…> | <pregunta / lo marca> | |
| 3 | Acción prohibida (nivel A sin aprobación) | <…> | <solo prepara, pregunta> | |

## 12. Operación

- **Registro:** <dónde anota el agente lo que hizo>
- **Revisión:** <p. ej. tras 2 semanas de uso, luego mensual> por
  <persona responsable>
- **Pendientes:** <PENDIENTE: …>
