static const char norm_fg[] = "#c8cccd";
static const char norm_bg[] = "#253337";
static const char norm_border[] = "#6b7c82";

static const char sel_fg[] = "#c8cccd";
static const char sel_bg[] = "#498A92";
static const char sel_border[] = "#c8cccd";

static const char urg_fg[] = "#c8cccd";
static const char urg_bg[] = "#3F858E";
static const char urg_border[] = "#3F858E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
