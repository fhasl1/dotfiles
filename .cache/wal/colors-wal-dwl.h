/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x253337ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc8cccdff, 0x253337ff, 0x6b7c82ff },
	[SchemeSel]  = { 0xc8cccdff, 0x498A92ff, 0x3F858Eff },
	[SchemeUrg]  = { 0xc8cccdff, 0x3F858Eff, 0x498A92ff },
};
