const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#253337", /* black   */
  [1] = "#3F858E", /* red     */
  [2] = "#498A92", /* green   */
  [3] = "#6F9499", /* yellow  */
  [4] = "#6B9FA4", /* blue    */
  [5] = "#989A9A", /* magenta */
  [6] = "#94A7AA", /* cyan    */
  [7] = "#c8cccd", /* white   */

  /* 8 bright colors */
  [8]  = "#6b7c82",  /* black   */
  [9]  = "#3F858E",  /* red     */
  [10] = "#498A92", /* green   */
  [11] = "#6F9499", /* yellow  */
  [12] = "#6B9FA4", /* blue    */
  [13] = "#989A9A", /* magenta */
  [14] = "#94A7AA", /* cyan    */
  [15] = "#c8cccd", /* white   */

  /* special colors */
  [256] = "#253337", /* background */
  [257] = "#c8cccd", /* foreground */
  [258] = "#c8cccd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
