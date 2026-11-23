# Diamond Rush - version web (modo GUI)

Copia del modo GUI del proyecto, preparada para el navegador (raylib + Emscripten).
El codigo de consola y el Launcher NO estan aqui; el proyecto original no se toco.

## Carpetas
- src/       codigo (DiamondRushGUI.cpp y los .h que usa). Lo web va dentro de #ifdef __EMSCRIPTEN__.
- niveles/   nivel1.txt, nivel2.txt, nivel3.txt (se empaquetan dentro del juego al compilar).
- web/       shell.html: la pagina que envuelve el juego.
- .github/workflows/pages.yml: el robot de GitHub que compila y publica solo.
- build.sh   compilacion manual (solo si algun dia instalas Emscripten).

## Publicar (paso 6)
1. Crea un repositorio nuevo en GitHub (publico).
2. Sube TODO el contenido de esta carpeta (incluida la carpeta oculta .github).
3. En el repositorio: Settings > Pages > Build and deployment > Source: "GitHub Actions".
4. Pestana Actions: espera que termine "Compilar y publicar en GitHub Pages" (unos minutos).
5. El enlace aparece en el paso "deploy" y en Settings > Pages: https://TU-USUARIO.github.io/NOMBRE-DEL-REPO/

Si el robot falla, abre el log del paso que fallo y pegalo para corregirlo.

## Probar controles tactiles en computadora
Agrega ?tactil al final del enlace.

## Notas
- Los puntajes se guardan en el navegador (localStorage): no se comparten entre jugadores.
- El audio suena despues del primer toque (regla de los navegadores).
- Nunca se ha compilado con el Emscripten real: el primer build es el de GitHub.
