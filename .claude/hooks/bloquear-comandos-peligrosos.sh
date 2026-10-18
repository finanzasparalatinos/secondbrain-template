#!/usr/bin/env bash
# Bloqueo de comandos peligrosos (corre antes de cada comando Bash).
# Bloquea comandos que borran datos sin vuelta atras o sobrescriben
# guardados ajenos (borrado recursivo, force push, git reset --hard,
# git clean -f, git branch -D, sudo).
# Para todo lo demas: sin salida, rige la consulta normal de permisos.

input="$(cat)"

# Extraer el comando. Preferimos jq; si falta, python3; si falta, el JSON
# completo, para que el control NUNCA falle por falta de un parser.
cmd=""
if command -v jq >/dev/null 2>&1; then
  cmd="$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null)"
fi
if [ -z "$cmd" ] && command -v python3 >/dev/null 2>&1; then
  cmd="$(printf '%s' "$input" | python3 -c 'import sys,json
try:
    print(json.load(sys.stdin).get("tool_input",{}).get("command",""))
except Exception:
    pass' 2>/dev/null)"
fi
# Respaldo: revisar todo el JSON (los patrones no llevan escapes JSON).
if [ -z "$cmd" ]; then
  cmd="$input"
fi

deny() {
  reason="$1"
  printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"%s"}}\n' "$reason"
  exit 0
}

# --- Patrones peligrosos ---------------------------------------------------

# Borrado recursivo: rm -r / -rf / -fr / -R (un rm -f simple sigue permitido)
if printf '%s' "$cmd" | grep -Eiq 'rm[[:space:]]+-[a-zA-Z]*[rR]'; then
  deny "El borrado recursivo (rm -r/-rf) esta bloqueado. Borra archivos sueltos o confirmalo a mano en la terminal."
fi

# sudo
if printf '%s' "$cmd" | grep -Eiq '(^|[[:space:];&|])sudo([[:space:]]|$)'; then
  deny "sudo esta bloqueado. Si hace falta, ejecuta tu mismo el comando con permisos elevados en la terminal."
fi

# git push --force / -f / --force-with-lease
if printf '%s' "$cmd" | grep -Eiq 'git[[:space:]]+push[[:space:]].*(--force|--force-with-lease|(^|[[:space:]])-f([[:space:]]|$))'; then
  deny "El force push esta bloqueado para no sobrescribir guardados ajenos. Si hace falta, a mano en la terminal."
fi

# git reset --hard
if printf '%s' "$cmd" | grep -Eiq 'git[[:space:]]+reset[[:space:]].*--hard'; then
  deny "git reset --hard descarta cambios sin vuelta atras y esta bloqueado. Usa git stash o confirmalo a mano."
fi

# git clean -f / -fd / -fdx
if printf '%s' "$cmd" | grep -Eiq 'git[[:space:]]+clean[[:space:]].*-[a-zA-Z]*f'; then
  deny "git clean -f borra archivos no guardados sin vuelta atras y esta bloqueado."
fi

# git branch -D (borrado forzado)
if printf '%s' "$cmd" | grep -Eq 'git[[:space:]]+branch[[:space:]].*-D([[:space:]]|$)'; then
  deny "git branch -D borra ramas con trabajo sin unir y esta bloqueado. Usa -d o confirmalo a mano."
fi

# Fork-Bomb
if printf '%s' "$cmd" | grep -Fq ':(){ :|:& };:' || printf '%s' "$cmd" | grep -Eq ':[[:space:]]*\([[:space:]]*\)[[:space:]]*\{[[:space:]]*:\|:'; then
  deny "Esto parece una fork bomb y esta bloqueado."
fi

# Sobrescribir discos: dd if=, mkfs, > /dev/sd*
if printf '%s' "$cmd" | grep -Eiq '(^|[[:space:];&|])dd[[:space:]]+if='; then
  deny "dd sobre discos esta bloqueado (riesgo de perder datos)."
fi
if printf '%s' "$cmd" | grep -Eiq '(^|[[:space:];&|])mkfs'; then
  deny "mkfs (formatear un disco) esta bloqueado."
fi
if printf '%s' "$cmd" | grep -Eiq '>[[:space:]]*/dev/(sd|disk|nvme|rdisk)'; then
  deny "Escribir directamente en un disco esta bloqueado."
fi

# chmod -R 777 sobre / o ~
if printf '%s' "$cmd" | grep -Eiq 'chmod[[:space:]]+(-[a-zA-Z]*R[a-zA-Z]*[[:space:]]+)?777[[:space:]]+(/|~|\$HOME)'; then
  deny "chmod 777 sobre / o la carpeta personal esta bloqueado (riesgo de seguridad)."
fi

# Sin coincidencia: rige la logica normal de permisos.
exit 0
