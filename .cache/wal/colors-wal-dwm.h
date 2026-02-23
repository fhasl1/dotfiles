static const char norm_fg[] = "#c8cccd";
static const char norm_bg[] = "#253337";
static const char norm_border[] = "#6b7c82";

static const char sel_fg[] = "#c8cccd";
static const char sel_bg[] = "#3F858E";
static const char sel_border[] = "#c8cccd";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
