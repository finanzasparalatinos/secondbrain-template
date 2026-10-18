#!/usr/bin/env bash
# Al iniciar cada sesion revisa si en ramas de trabajo antiguas (claude/...)
# hay trabajo que nunca llego a la rama principal (main). La salida entra
# en el contexto de la sesion. Nunca termina con error.
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
command -v git >/dev/null 2>&1 || exit 0
# Traer todas las ramas de trabajo, aunque la sesion solo haya clonado main.
profundidad=""
[ "$(git rev-parse --is-shallow-repository 2>/dev/null)" = "true" ] && profundidad="--unshallow"
timeout 40 git fetch -q $profundidad origin '+refs/heads/main:refs/remotes/origin/main' '+refs/heads/claude/*:refs/remotes/origin/claude/*' 2>/dev/null || exit 0
git rev-parse -q --verify origin/main >/dev/null 2>&1 || exit 0
actual="$(git branch --show-current 2>/dev/null)"
lista=""
for rama in $(git for-each-ref --format='%(refname:short)' 'refs/remotes/origin/claude/' 2>/dev/null); do
  [ "$rama" = "origin/$actual" ] && continue
  pendientes="$(git rev-list --count "origin/main..$rama" 2>/dev/null || echo 0)"
  [ "${pendientes:-0}" -gt 0 ] || continue
  fecha="$(git log -1 --format='%cd' --date=format:'%d.%m.%Y' "$rama" 2>/dev/null)"
  titulo="$(git log -1 --format='%s' "$rama" 2>/dev/null | cut -c1-80)"
  lista="${lista}- ${rama#origin/} (${pendientes} guardados, el ultimo ${fecha}: ${titulo})
"
done
[ -z "$lista" ] && exit 0
cat <<TEXTO
AVISO INICIO DE SESION: En estas ramas de trabajo hay trabajo que no esta en la rama principal (main). El equipo y las sesiones nuevas no lo ven:
${lista}
Mencionalo al principio, breve y en palabras sencillas, y propone pasar ese trabajo a la rama principal (ver CLAUDE.md, "Guardar resultados en la rama principal"). Solo despues de un si.
TEXTO
exit 0
