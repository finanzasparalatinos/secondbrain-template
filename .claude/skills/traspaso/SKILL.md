---
name: traspaso
description: Traspaso al final de una sesión. Deja por escrito qué se hizo, qué se decidió, qué queda pendiente y qué sigue, para que la próxima sesión continúe sin cortes. Se activa con "/traspaso", "traspaso", "cerrar sesión", "por hoy terminamos", "guardar el estado", "seguimos mañana".
---

# Traspaso

Una sesión no sabe nada de la anterior, salvo lo que está en el
repositorio. Este traspaso asegura que la próxima sesión (o un colega)
siga exactamente donde esta terminó.

## Pasos

1. **Crear el archivo:** `traspasos/AAAA-MM-DD-<tema>.md` (tema en dos
   o tres palabras, minúsculas, con guiones). Si hoy ya hay un traspaso
   del mismo tema, completarlo en vez de crear otro.
2. **Contenido, corto y comprensible para cualquiera:**
   - **De qué se trató:** una o dos frases.
   - **Qué se hizo:** viñetas, con los archivos creados o cambiados.
   - **Qué se decidió:** cada decisión con su motivo. Cada una además
     como fila en `DECISIONES.md`.
   - **Qué queda pendiente:** viñetas. Las preguntas que solo una
     persona puede aclarar, además en `PENDIENTES.md`.
   - **Siguiente paso:** el único paso con el que empieza la próxima
     sesión.
3. **`ESTADO.md`:** bloque de hoy con **Hecho** y **Pendiente**.
4. **`INDICE.md`:** agregar cada archivo nuevo.
5. **Guardar en la rama principal:** proponerlo y explicar por qué,
   como dice `CLAUDE.md` («Guardar resultados en la rama principal»).
   Solo tras un sí guardar y comprobar que llegó.
6. **Confirmar en el chat:** en dos frases, dónde está el traspaso y
   cuál es el siguiente paso.

## Al iniciar una sesión nueva

Quien retome un tema lee primero el archivo más reciente de
`traspasos/` sobre ese tema.
