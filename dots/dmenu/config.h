/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                    /* -b option; if 0, dmenu appears at bottom */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
    "FiraCode Nerd Font:size=10"
};
static const char *prompt = NULL;      /* -p option; prompt to the left of input field */

/* Patches: https://tools.suckless.org/dmenu/patches/border/ */
static const unsigned int border_width = 2; /* Size of the window border */

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 5;

static const char *colors[SchemeLast][2] = {
    /* fg           bg         */
    [SchemeNorm] = { "#CBC9CC", "#0C0012" }, // Normal: Texto cinza, fundo roxo escuro
    [SchemeSel]  = { "#0C0012", "#BE95FF" }, // Selecionado: Texto escuro, fundo roxo vibrante
    [SchemeOut]  = { "#000000", "#00ffff" }, // (Não usado no dmenu padrão)
};


/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
