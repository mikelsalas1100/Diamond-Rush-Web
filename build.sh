#!/usr/bin/env bash
# Compila Diamond Rush (modo GUI) a web con Emscripten.
# Uso:  ./build.sh /ruta/a/raylib/src      (carpeta src de raylib YA compilada con PLATFORM_WEB)
# Resultado: carpeta public/ lista para publicar (index.html, index.js, index.wasm, index.data)
set -euo pipefail
RAYLIB_SRC="${1:?Falta la ruta a raylib/src}"
LIB="$(find "$RAYLIB_SRC" -maxdepth 1 -name 'libraylib*.a' | head -n 1)"
[ -n "$LIB" ] || { echo "No encuentro libraylib*.a en $RAYLIB_SRC (compila raylib con: make PLATFORM=PLATFORM_WEB)"; exit 1; }

mkdir -p public
emcc src/DiamondRushGUI.cpp "$LIB" \
  -o public/index.html \
  -std=c++17 -Os -Wall \
  -I"$RAYLIB_SRC" -Isrc \
  -DPLATFORM_WEB \
  --shell-file web/shell.html \
  --preload-file niveles/nivel1.txt@/nivel1.txt \
  --preload-file niveles/nivel2.txt@/nivel2.txt \
  --preload-file niveles/nivel3.txt@/nivel3.txt \
  -sUSE_GLFW=3 \
  -sALLOW_MEMORY_GROWTH=1 \
  -sFORCE_FILESYSTEM=1 \
  -sEXPORTED_RUNTIME_METHODS=UTF8ToString
echo "Listo: public/index.html"
