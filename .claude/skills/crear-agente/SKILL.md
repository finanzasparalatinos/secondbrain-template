---
name: crear-agente
description: Construye un agente de IA nuevo para la empresa en conversación — desde el encargo, pasando por el conocimiento de la memoria de la empresa, permisos y control de calidad, hasta la prueba con ejemplos reales. Genera ficha, skill del agente y casos de prueba. Se activa con "/crear-agente", "crear agente", "nuevo agente", "armar agente", "construir agente", "seguir con el agente".
---

# Crear agente

Un agente es tan bueno como su descripción. Este skill guía una
entrevista corta e inteligente y construye un agente que sabe qué hacer,
de dónde saca su conocimiento, qué puede hacer, cómo es un buen
resultado y cómo se revisa a sí mismo.

Principio: **proponer en vez de preguntar.** Quien encarga el agente
debe escribir lo menos posible. Lo que está en la memoria de la empresa
lo lees tú y lo propones; solo preguntas lo que solo una persona sabe.

## 0. Preparación (sin preguntar)

1. `git fetch origin main` — trabajar con el estado más nuevo.
2. Leer `INDICE.md`, `agentes/README.md` (si existe) y, si existen, los
   valores de la empresa (busca en `INDICE.md`: valores, cultura,
   manifiesto). Cada agente se mide con ellos como una persona nueva.
3. ¿Ya existe el agente (`agentes/<nombre>/ficha.md`)? Entonces no
   empezar de nuevo: leer la ficha, mostrar las secciones con
   «PENDIENTE» y seguir ahí.
4. Idioma: el de la persona que encarga; los archivos en el idioma de
   `CLAUDE.md` capítulo 9.

## 1. Ronda 1 — la idea (máximo 4 preguntas a la vez)

Pregunta solo estas cuatro, en palabras sencillas, con ejemplos de
respuesta:

1. **¿Qué agente, qué problema?** ¿Qué debe resolver y qué sale mal hoy
   sin él (tiempo perdido, errores, cosas que quedan sin hacer)?
2. **¿Para quién trabaja?** ¿Quién lo llama o recibe sus resultados — y
   quién es responsable de que trabaje bien?
3. **¿En qué notas que es bueno?** Una señal medible (tiempo ahorrado,
   cantidad resuelta, tiempo de respuesta, menos errores).
4. **Un ejemplo real:** un caso de la semana pasada que el agente
   debería haber resuelto — y cómo habría sido el resultado perfecto.
   (Si hay: subir archivo, correo, captura.)

## 2. Investigar tú y armar el borrador

Ahora sin preguntar:

- De `INDICE.md` elegir los archivos que el agente necesita como
  conocimiento y **leerlos** (no solo enlazarlos). Típico:
  `lenguaje/tono.md` para todo lo que sea texto,
  `empresa/reglas-del-sector.md` para todo lo que toque clientes,
  `cliente-ideal/`, `oferta/`, `programas/sistemas.md`, `equipo/`.
- **Comprobar los accesos de verdad** (`CLAUDE.md` punto 5): qué
  conectores tiene realmente esta sesión (lista de herramientas,
  ToolSearch). Cada acceso como «conectado, comprobado el …», «falta» o
  «sin comprobar» — nunca suponer.
- Revisar límites: ¿se cruza con otro agente de `agentes/`? Proponer
  una frontera.
- Llenar la **ficha** según `plantillas/ficha.md` como borrador
  completo. Todo lo que deduzcas, con fuente (ruta del archivo); todo lo
  que no sepas, marcado como «PENDIENTE: <pregunta>».

## 3. Ronda 2 — solo los huecos

Mostrar el borrador **en corto** (una línea por sección) y preguntar
solo lo pendiente, en máximo dos bloques de máximo 4 preguntas. Orden
por importancia:

1. **Permisos:** ¿qué acciones hace solo (nivel B/C), cuáles solo
   prepara (nivel A)? ¿Quién aprueba? Entregar siempre ya una propuesta
   clasificada según `CLAUDE.md` — en la duda, el nivel más prudente.
2. **Resultado:** formato, lugar, extensión, para quién. Mostrar un
   ejemplo y preguntar «¿así?».
3. **Subagentes:** solo si de verdad ayudan — un agente con un proceso
   claro es mejor que cinco a medias.
4. **Disparador y ritmo:** a pedido, diario, semanal, ante un evento.
5. **Casos límite:** ¿qué hace si faltan datos, se contradicen o un
   cliente pregunta algo delicado?
6. **Casos de prueba:** tres casos reales (ver paso 5).

Respuestas vagas («profesional», «bueno», «rápido», «todo») → afinar una
vez: «¿En qué se nota exactamente?». Si no lo sabe: anotar tu propuesta
marcada como supuesto.

## 4. Control de calidad (antes de construir)

La ficha está lista solo cuando todo es «sí»:

- [ ] Encargo en una frase que una persona nueva entiende.
- [ ] Al menos una señal de éxito medible.
- [ ] Claro qué **no** es su tarea.
- [ ] Cada fuente de conocimiento con ruta; nada del espacio de
      dirección en la memoria de la empresa.
- [ ] Cada acción con nivel A/B/C y persona que aprueba.
- [ ] Resultado con formato, lugar, idioma, tono y ejemplo.
- [ ] Lista «Listo cuando …» comprobable.
- [ ] Autorrevisión antes de entregar y puntos de parada claros.
- [ ] Tres casos de prueba con resultado esperado.
- [ ] Ningún dato de acceso ni contacto de clientes en el texto.
- [ ] Si la empresa tiene valores escritos: anclados en la ficha.

## 5. Construir (nivel B — hacerlo y luego informar)

Para el agente `<nombre>` (minúsculas, con guiones, p. ej.
`asistente-ventas`):

1. `agentes/<nombre>/ficha.md` — la ficha terminada (la verdad sobre el
   agente; las personas leen aquí).
2. `.claude/skills/agente-<nombre>/SKILL.md` — el agente ejecutable
   según `plantillas/skill-agente.md`. Remite a la ficha y a los
   archivos de conocimiento en vez de copiarlos.
3. `agentes/<nombre>/pruebas.md` — los casos de prueba con columna
   «Resultado del …».

## 6. Probar (obligatorio, sin excepción)

- Recorrer cada caso una vez **en seco**: acciones de nivel A solo como
  borrador, nunca ejecutarlas (nada de envíos, cambios en el CRM ni
  citas).
- Comparar con el resultado esperado y la lista «Listo cuando …». Si
  hay diferencia → afinar ficha o skill, volver a probar.
- Anotar el resultado en `pruebas.md` (aprobado / no aprobado, fecha,
  qué se cambió).
- Mostrar el resultado del caso más importante y preguntar: «¿Es esta
  la calidad que quieres?»
- **Puesta en marcha es nivel A:** solo después del sí de quien aprueba.

## 7. Anotar y cerrar

- `agentes/README.md`: agregar el agente al resumen (crear el archivo si
  no existe, y anotarlo en `INDICE.md`).
- `INDICE.md`: anotar ficha y skill.
- `DECISIONES.md`: cada decisión con motivo (límites de permisos,
  frontera con otros agentes).
- Preguntas que solo una persona puede aclarar → `PENDIENTES.md`.
- Proponer guardar en la rama principal (`CLAUDE.md` punto 4), con una
  frase de por qué. Solo después del sí.
- Al final, informar en corto: qué está construido, cómo se llama
  (`/agente-<nombre>`), qué está probado, qué queda pendiente.

## Lo que este skill nunca hace

- Construir un agente que ejecute acciones de nivel A sin aprobación.
- Escribir datos del espacio de dirección en la memoria de la empresa.
- Poner accesos, contraseñas o claves en la ficha o el skill.
- Marcar accesos como «disponibles» sin haberlos comprobado.
- Dar por terminado un agente que no está probado.
