{ config, pkgs, ...}:

let
  # Embed the content of your customized keymap file.
  # The file is registered as 'dvo-mod' in the XKB symbols directory.
  myCustomKeymap = pkgs.writeText "custom-dvorak-symbols" ''
default partial alphanumeric_keys modifier_keys
xkb_symbols "basic" {

    name[Group1]= "English (US)";

    key <TLDE> {	[     grave,	asciitilde	]	};
    key <AE01> {	[	  1,	exclam 		]	};
    key <AE02> {	[	  2,	at		]	};
    key <AE03> {	[	  3,	numbersign	]	};
    key <AE04> {	[	  4,	dollar		]	};
    key <AE05> {	[	  5,	percent		]	};
    key <AE06> {	[	  6,	asciicircum	]	};
    key <AE07> {	[	  7,	ampersand	]	};
    key <AE08> {	[	  8,	asterisk	]	};
    key <AE09> {	[	  9,	parenleft	]	};
    key <AE10> {	[	  0,	parenright	]	};
    key <AE11> {	[     minus,	underscore	]	};
    key <AE12> {	[     equal,	plus		]	};

    key <AD01> {	[	  q,	Q 		]	};
    key <AD02> {	[	  w,	W		]	};
    key <AD03> {	[	  e,	E		]	};
    key <AD04> {	[	  r,	R		]	};
    key <AD05> {	[	  t,	T		]	};
    key <AD06> {	[	  y,	Y		]	};
    key <AD07> {	[	  u,	U		]	};
    key <AD08> {	[	  i,	I		]	};
    key <AD09> {	[	  o,	O		]	};
    key <AD10> {	[	  p,	P		]	};
    key <AD11> {	[ bracketleft,	braceleft	]	};
    key <AD12> {	[ bracketright,	braceright	]	};

    key <AC01> {	[	  a,	A 		]	};
    key <AC02> {	[	  s,	S		]	};
    key <AC03> {	[	  d,	D		]	};
    key <AC04> {	[	  f,	F		]	};
    key <AC05> {	[	  g,	G		]	};
    key <AC06> {	[	  h,	H		]	};
    key <AC07> {	[	  j,	J		]	};
    key <AC08> {	[	  k,	K		]	};
    key <AC09> {	[	  l,	L		]	};
    key <AC10> {	[ semicolon,	colon		]	};
    key <AC11> {	[ apostrophe,	quotedbl	]	};

    key <AB01> {	[	  z,	Z 		]	};
    key <AB02> {	[	  x,	X		]	};
    key <AB03> {	[	  c,	C		]	};
    key <AB04> {	[	  v,	V		]	};
    key <AB05> {	[	  b,	B		]	};
    key <AB06> {	[	  n,	N		]	};
    key <AB07> {	[	  m,	M		]	};
    key <AB08> {	[     comma,	less		]	};
    key <AB09> {	[    period,	greater		]	};
    key <AB10> {	[     slash,	question	]	};

    key <BKSL> {	[ backslash,         bar	]	};
};

partial alphanumeric_keys
xkb_symbols "euro" {

    include "us(basic)"
    name[Group1]= "English (US, euro on 5)";
    include "eurosign(5)"

    include "level3(ralt_switch)"
};


partial alphanumeric_keys
xkb_symbols "ibm238l" {

    include "us(basic)"
    name[Group1]= "English (US, IBM Arabic 238_L)";
    key <AB08> {        [     comma,    comma      ]       };
    key <AB09> {        [    period,    period     ]       };
    key <BKSL> {        [ quoteleft,    asciitilde ]       };
    key <LSGT> {        [ backslash,    bar        ]       };
    key <TLDE> {        [ leftcaret,    rightcaret ]       };
};

partial alphanumeric_keys
xkb_symbols "intl" {

    name[Group1]= "English (US, intl., with dead keys)";
    key <TLDE> { [dead_grave, dead_tilde,         grave,       asciitilde ] };
    key <AE01> { [	   1,     exclam,    exclamdown,      onesuperior ] };
    key <AE02> { [	   2,         at,   twosuperior, dead_doubleacute ] };
    key <AE03> { [	   3, numbersign, threesuperior,      dead_macron ] };
    key <AE04> { [	   4,     dollar,      currency,         sterling ] };
    key <AE05> { [	   5,    percent,      EuroSign,     dead_cedilla ] };
    key <AE06> { [    6, dead_circumflex,    onequarter,      asciicircum ] };
    key <AE07> { [	   7,  ampersand,       onehalf,	dead_horn ] };
    key <AE08> { [	   8,   asterisk, threequarters,      dead_ogonek ] };
    key <AE09> { [	   9,  parenleft, leftsinglequotemark, dead_breve ] };
    key <AE10> { [	   0, parenright, rightsinglequotemark, dead_abovering ] };
    key <AE11> { [     minus, underscore,           yen,    dead_belowdot ] };
    key <AE12> { [     equal,       plus,      multiply,         division ] };
    key <AD01> { [	   q,          Q,    adiaeresis,       Adiaeresis ] };
    key <AD02> { [	   w,          W,         aring,            Aring ] };
    key <AD03> { [	   e,          E,        eacute,           Eacute ] };
    key <AD04> { [	   r,          R,    registered,       registered ] };
    key <AD05> { [	   t,          T,         thorn,            THORN ] };
    key <AD06> { [	   y,          Y,    udiaeresis,       Udiaeresis ] };
    key <AD07> { [	   u,          U,        uacute,           Uacute ] };
    key <AD08> { [	   i,          I,        iacute,           Iacute ] };
    key <AD09> { [	   o,          O,        oacute,           Oacute ] };
    key <AD10> { [	   p,          P,    odiaeresis,       Odiaeresis ] };
    key <AD11> { [ bracketleft,  braceleft,  guillemotleft, leftdoublequotemark ] };
    key <AD12> { [bracketright, braceright, guillemotright, rightdoublequotemark ] };

    key <AC01> { [	   a,          A,        aacute,           Aacute ] };
    key <AC02> { [	   s,          S,        ssharp,          section ] };
    key <AC03> { [	   d,          D,           eth,              ETH ] };
    key <AC04> { [	   f,          F,             f,                F ] };
    key <AC05> { [	   g,          G,             g,                G ] };
    key <AC06> { [	   h,          H,             h,                H ] };
    key <AC07> { [	   j,          J,             j,                J ] };
    key <AC08> { [	   k,          K,            oe,               OE ] };
    key <AC09> { [	   l,          L,        oslash,         Ooblique ] };
    key <AC10> { [ semicolon,      colon,     paragraph,           degree ] };
    key <AC11> { [dead_acute, dead_diaeresis, apostrophe,        quotedbl ] };
    key <AB01> { [	   z,          Z,            ae,               AE ] };
    key <AB02> { [	   x,          X,             x,                X ] };
    key <AB03> { [	   c,          C,     copyright,             cent ] };
    key <AB04> { [	   v,          V,             v,                V ] };
    key <AB05> { [	   b,          B,             b,                B ] };
    key <AB06> { [	   n,          N,        ntilde,           Ntilde ] };
    key <AB07> { [	   m,          M,            mu,               mu ] };
    key <AB08> { [     comma,       less,      ccedilla,         Ccedilla ] };
    key <AB09> { [    period,    greater, dead_abovedot,       dead_caron ] };
    key <AB10> { [     slash,   question,  questiondown,        dead_hook ] };
    key <BKSL> { [ backslash,        bar,       notsign,        brokenbar ] };
    key <LSGT> { [ backslash,   bar,            backslash,      bar ] };
    include "level3(ralt_switch)"
};

// Based on symbols/us_intl keyboard map:
// Dead-keys definition for a very simple US/ASCII layout.
// by Conectiva (http://www.conectiva.com.br)
// modified by Ricardo Y. Igarashi (iga@that.com.br)

// Added the following deadkeys, to make it truly international:
//
// dead_macron: on AltGr-minus
// dead_breve: on AltGr-parenleft
// dead_abovedot: on AltGr-period
// dead_abovering: on AltGr-0
// dead_doubleacute: on AltGr-equal (as quotedbl is already used)
// dead_caron: on AltGr-less (AltGr-shift-comma)
// dead_cedilla: on AltGr-comma
// dead_ogonek: on AltGr-semicolon
// dead_belowdot: on AltGr-underscore (AltGr-shift-minus)
// dead_hook: on AltGr-question
// dead_horn: on AltGr-plus (AltGr-shift-equal)
// dead_diaeresis: on AltGr-colon (Alt-shift-semicolon)
//
// those were already there:
// dead_grave
// dead_acute
// dead_circumflex
// dead_tilde
// dead_diaeresis

partial alphanumeric_keys
xkb_symbols "alt-intl" {

  include "us"
  name[Group1]= "English (US, alt. intl.)";
  key <TLDE> { [ dead_grave, dead_tilde,    grave,	      asciitilde    ] };
  key <AE05> { [          5, percent,	    EuroSign			    ] };
  key <AE06> { [	  6, dead_circumflex, asciicircum,    asciicircum   ] };
  key <AE09> { [	  9, parenleft, leftsinglequotemark,  dead_breve ] };
  key <AE10> { [	  0, parenright, rightsinglequotemark, dead_abovering ] };
  key <AE11> { [      minus, underscore,    dead_macron,      dead_belowdot ] };
  key <AE12> { [      equal, plus,	    dead_doubleacute, dead_horn	    ] };
  key <AD03> { [          e, E,		     EuroSign,         cent	    ] };
  key <AC10> { [  semicolon, colon,	     dead_ogonek,   dead_diaeresis  ] };
  key <AC11> { [ dead_acute, dead_diaeresis, apostrophe,    quotedbl	    ] };
  key <AB08> { [      comma, less,	     dead_cedilla,  dead_caron	    ] };
  key <AB09> { [     period, greater,	     dead_abovedot, dead_circumflex ] };
  key <AB10> { [      slash, question,	     dead_hook,	    dead_hook	    ] };
  key <LSGT> { [ backslash,   bar,            backslash,      bar ] };
  include "level3(ralt_switch)"
};

partial alphanumeric_keys
xkb_symbols "dvorak" {

    name[Group1]= "English (Dvorak)";
    key <TLDE> { [       grave,	asciitilde, dead_grave, dead_tilde	] };
    key <AE01> { [	    1,	exclam 		]	};
    key <AE02> { [	    2,	at		]	};
    key <AE03> { [	    3,	numbersign	]	};
    key <AE04> { [	    4,	dollar		]	};
    key <AE05> { [	    5,	percent		]	};
    key <AE06> { [	    6,	asciicircum, dead_circumflex, dead_circumflex ]	};
    key <AE07> { [	    7,	ampersand	]	};
    key <AE08> { [	    8,	asterisk	]	};
    key <AE09> { [	    9,	parenleft,  dead_grave]	};
    key <AE10> { [	    0,	parenright	]	};
    key <AE11> { [      minus,	underscore	]	};
    key <AE12> { [     equal , 	plus		] };
    key <AD01> { [  apostrophe,	quotedbl, dead_acute, dead_diaeresis	] };
    key <AD02> { [	comma,	less,   dead_cedilla, dead_caron	] };
    key <AD03> { [      period,	greater, dead_abovedot, periodcentered	] };
    key <AD04> { [	    p,	P		]	};
    key <AD05> { [	    y,	Y, yacute, Yacute]	};
    key <AD06> { [	    f,	F		]	};
    key <AD07> { [	    g,	G		]	};
    key <AD08> { [	    c,	C		]	};
    key <AD09> { [	    r,	R		]	};
    key <AD10> { [	    l,	L, odiaeresis, Odiaeresis]	};
    key <AD11> { [bracketleft,	braceleft	]	};
    key <AD12> { [bracketright,	braceright	]	};
    key <AC01> { [	    a,	A, aacute, Aacute ]	};
    key <AC02> { [	    o,	O, oacute, Oacute ]	};
    key <AC03> { [	    e,	E, eacute, Eacute ]	};
    key <AC04> { [	    u,	U, uacute, Uacute ]	};
    key <AC05> { [	    i,	I, iacute, Iacute ]	};
    key <AC06> { [	    d,	D,    eth,  ETH ]	};
    key <AC07> { [	    h,	H		]	};
    key <AC08> { [	    t,	T		]	};
    key <AC09> { [	    n,	N		]	};
    key <AC10> { [	    s,	S, ae, AE	]	};
    key <AC11> { [	slash,	question	]	};

    key <AB01> { [   semicolon,	colon, dead_ogonek, dead_doubleacute ] };
    key <AB02> { [	    q,	Q		]	};
    key <AB03> { [	    j,	J		]	};
    key <AB04> { [	    k,	K		]	};
    key <AB05> { [	    x,	X		]	};
    key <AB06> { [	    b,	B		]	};
    key <AB07> { [	    m,	M		]	};
    key <AB08> { [	    w,	W		]	};
    key <AB09> { [	    v,	V		]	};
    key <AB10> { [	    z,	Z, thorn, THORN	]	};
    key <BKSL> { [  backslash,  bar             ]       };
    include "level3(ralt_switch)"
};

// Dvorak intl., with dead keys
// Olivier Mehani (shtrom-xorg@ssji.net)
// Reproduce the per-key mapping of us(intl) for the dvorak layout
// aka "I just swapped my keys over"
partial alphanumeric_keys
xkb_symbols "dvorak-intl" {

    include "us(dvorak)"
    name[Group1]= "English (Dvorak, intl., with dead keys)";
    key <TLDE> { [dead_grave, dead_tilde,         grave,       asciitilde ] };
    key <AE01> { [	   1,     exclam,    exclamdown,      onesuperior ] };
    key <AE02> { [	   2,         at,   twosuperior, dead_doubleacute ] };
    key <AE03> { [	   3, numbersign, threesuperior,      dead_macron ] };
    key <AE04> { [	   4,     dollar,      currency,         sterling ] };
    key <AE05> { [	   5,    percent,      EuroSign,     dead_cedilla ] };
    key <AE06> { [    6, dead_circumflex,    onequarter,      asciicircum ] };
    key <AE07> { [	   7,  ampersand,       onehalf,	dead_horn ] };
    key <AE08> { [	   8,   asterisk, threequarters,      dead_ogonek ] };
    key <AE09> { [	   9,  parenleft, leftsinglequotemark, dead_breve ] };
    key <AE10> { [	   0, parenright, rightsinglequotemark, dead_abovering ] };
    key <AE11> { [ bracketleft,  braceleft,  guillemotleft, leftdoublequotemark ] };
    key <AE12> { [bracketright, braceright, guillemotright, rightdoublequotemark ] };

    key <AD01> { [dead_acute, dead_diaeresis, apostrophe,        quotedbl ] };
    key <AD02> { [     comma,       less,      ccedilla,         Ccedilla ] };
    key <AD03> { [    period,    greater, dead_abovedot,       dead_caron ] };
    key <AD04> { [	   p,          P,    odiaeresis,       Odiaeresis ] };
    key <AD05> { [	   y,          Y,    udiaeresis,       Udiaeresis ] };
    // key <AD06> { [	   f,	F		]	};
    // key <AD07> { [	   g,	G		]	};
    key <AD08> { [	   c,          C,     copyright,             cent ] };
    key <AD09> { [	   r,          R,    registered,       registered ] };
    key <AD10> { [	   l,          L,        oslash,         Ooblique ] };
    key <AD11> { [     slash,   question,  questiondown,        dead_hook ] };
    // key <AD12> { [     equal,       plus,      multiply,         division ] };
    key <AC01> { [	   a,          A,        aacute,           Aacute ] };
    key <AC02> { [	   o,          O,        oacute,           Oacute ] };
    key <AC03> { [	   e,          E,        eacute,           Eacute ] };
    key <AC04> { [	   u,          U,        uacute,           Uacute ] };
    key <AC05> { [	   i,          I,        iacute,           Iacute ] };
    key <AC06> { [	   d,          D,           eth,              ETH ] };
    // key <AC07> { [	   h,	H		]	};
    key <AC08> { [	   t,          T,         thorn,            THORN ] };
    key <AC09> { [	   n,          N,        ntilde,           Ntilde ] };
    key <AC10> { [	   s,          S,        ssharp,          section ] };
    // key <AC11> { [     minus, underscore,           yen,    dead_belowdot ] };
    key <AB01> { [ semicolon,      colon,     paragraph,           degree ] };
    key <AB02> { [	   q,          Q,    adiaeresis,       Adiaeresis ] };
    // key <AB03> { [	   j,	J		]	};
    key <AB04> { [	   k,          K,            oe,               OE ] };
    // key <AB05> { [	   x,	X		]	};
    // key <AB06> { [	   b,	B		]	};
    key <AB07> { [	   m,          M,            mu,               mu ] };
    key <AB08> { [	   w,          W,         aring,            Aring ] };
    // key <AB09> { [	   v,	V		]	};
    key <AB10> { [	   z,          Z,            ae,               AE ] };
    key <BKSL> { [ backslash,        bar,       notsign,        brokenbar ] };
    include "level3(ralt_switch)"
};

// Dvorak international without dead keys
// Stephane Magnenat (stephane at magnenat dot net, http://stephane.magnenat.net)
// Based on information from http://www.poupinou.org/dvorak/index.html
//
//  `   1   2   3   4   5   6   7   8   9   0   [   ]   \
//                  €
//
//      '   ,   .   p   y   f   g   c   r   l   /   =
//          ä   ê   ë   ü           ç
//
//      a   o   e   u   i   d   h   t   n   s   -
//      à   ô   é   û   î                   ß
//
//      ;   q   j   k   x   b   m   w   v   z
//      â   ö   è   ù   ï

partial alphanumeric_keys
xkb_symbols "dvorak-alt-intl" {

    include "us(dvorak)"
    name[Group1]= "English (Dvorak, alt. intl.)";
    key <AE04> { [         4,  dollar,    EuroSign ] };
    key <AD02> { [     comma,    less,  adiaeresis,       dead_caron ] };
    key <AD03> { [    period, greater, ecircumflex,   periodcentered	] };
    key <AD04> { [         p,       P,  ediaeresis,     dead_cedilla ] };
    key <AD05> { [         y,       Y,  udiaeresis ] };
    key <AD08> { [         c,       C,    ccedilla,    dead_abovedot ] };
    key <AC01> { [         a,       A,      agrave ] };
    key <AC02> { [         o,       O, ocircumflex ] };
    key <AC03> { [         e,       E,      eacute ] };
    key <AC04> { [         u,       U, ucircumflex ] };
    key <AC05> { [         i,       I, icircumflex ] };
    key <AC10> { [         s,       S,      ssharp,            U1E9E ] };
    key <AB01> { [ semicolon,   colon, acircumflex ] };
    key <AB02> { [         q,       Q,  odiaeresis,      dead_ogonek ] };
    key <AB03> { [         j,       J,      egrave, dead_doubleacute ] };
    key <AB04> { [         k,       K,      ugrave ] };
    key <AB05> { [         x,       X,  idiaeresis ] };
    include "level3(ralt_switch)"
};

// Left and right handed dvorak layouts
// by sqweek <sqweek@gmail.com> 2006-01-30
// Based on the corresponding layouts in the console-tools package.
partial alphanumeric_keys
xkb_symbols "dvorak-l" {

    include "us(dvorak)"
    name[Group1]= "English (Dvorak, left-handed)";

    key <AE01> {	[ bracketleft,	braceleft	]	};
    key <AE02> {	[ bracketright,	braceright	]	};
    key <AE03> {	[	slash,	question	]	};
    key <AE04> {	[	    p,	P		]	};
    key <AE05> {	[	    f,	F		]	};
    key <AE06> {	[	    m,	M		]	};
    key <AE07> {	[	    l,	L		]	};
    key <AE08> {	[	    j,	J		]	};
    key <AE09> {	[	    4,	dollar		]	};
    key <AE10> {	[	    3,	numbersign	]	};
    key <AE11> {	[	    2,	at		]	};
    key <AE12> {	[	    1,	exclam 		]	};
    key <AD01> {	[   semicolon,	colon 		]	};
    key <AD02> {	[	    q,	Q		]	};
    key <AD03> {	[	    b,	B		]	};
    key <AD04> {	[	    y,	Y		]	};
    key <AD05> {	[	    u,	U		]	};
    key <AD06> {	[	    r,	R		]	};
    key <AD07> {	[	    s,	S		]	};
    key <AD08> {	[	    o,	O		]	};
    key <AD09> {	[      period,	greater		]	};
    key <AD10> {	[	    6,	asciicircum	]	};
    key <AD11> {	[	    5,	percent		]	};
    key <AD12> {	[	equal,	plus		]	};

    key <AC01> {	[	minus,	underscore	]	};
    key <AC02> {	[	    k,	K		]	};
    key <AC03> {	[	    c,	C		]	};
    key <AC04> {	[	    d,	D		]	};
    key <AC05> {	[	    t,	T		]	};
    key <AC06> {	[	    h,	H		]	};
    key <AC07> {	[	    e,	E		]	};
    key <AC08> {	[	    a,	A 		]	};
    key <AC09> {	[	    z,	Z		]	};
    key <AC10> {	[	    8,	asterisk	]	};
    key <AC11> {	[	    7,	ampersand	]	};

    key <AB01> {	[  apostrophe,	quotedbl	] 	};
    key <AB02> {	[	    x,	X		]	};
    key <AB03> {	[	    g,	G		]	};
    key <AB04> {	[	    v,	V		]	};
    key <AB05> {	[	    w,	W		]	};
    key <AB06> {	[	    n,	N		]	};
    key <AB07> {	[	    i,	I		]	};
    key <AB08> {	[	comma,	less		]	};
    key <AB09> {	[	    0,	parenright	]	};
    key <AB10> {	[	    9,	parenleft	]	};
};

partial alphanumeric_keys
xkb_symbols "dvorak-r" {

    include "us(dvorak)"
    name[Group1]= "English (Dvorak, right-handed)";
    key <AE01> {	[	    1,	exclam 		]	};
    key <AE02> {	[	    2,	at		]	};
    key <AE03> {	[	    3,	numbersign	]	};
    key <AE04> {	[	    4,	dollar		]	};
    key <AE05> {	[	    j,	J		]	};
    key <AE06> {	[	    l,	L		]	};
    key <AE07> {	[	    m,	M		]	};
    key <AE08> {	[	    f,	F		]	};
    key <AE09> {	[	    p,	P		]	};
    key <AE10> {	[	slash,	question	]	};
    key <AE11> {	[ bracketleft,	braceleft	]	};
    key <AE12> {	[ bracketright,	braceright	]	};
    key <AD01> {	[   semicolon,	colon 		]	};
    key <AD02> {	[	    q,	Q		]	};
    key <AD03> {	[	    b,	B		]	};
    key <AD04> {	[	    v,	V		]	};
    key <AD05> {	[	    z,	Z		]	};
    key <AD06> {	[	    g,	G		]	};
    key <AD07> {	[	    c,	C		]	};
    key <AD08> {	[	    w,	W		]	};
    key <AD09> {	[	    h,	H		]	};
    key <AD10> {	[	    t,	T		]	};
    key <AD11> {	[	    6,	asciicircum	]	};
    key <AD12> {	[	    5,	percent		]	};
    key <AC01> {	[	minus,	underscore	]	};
    key <AC02> {	[	    k,	K		]	};
    key <AC03> {	[	    x,	X		]	};
    key <AC04> {	[	    r,	R		]	};
    key <AC05> {	[	    n,	N		]	};
    key <AC06> {	[	    e,	E		]	};
    key <AC07> {	[	    i,	I		]	};
    key <AC08> {	[	    u,	U		]	};
    key <AC09> {	[	    a,	A 		]	};
    key <AC10> {	[	    8,	asterisk	]	};
    key <AC11> {	[	    7,	ampersand	]	};
    key <AB01> {	[  apostrophe,	quotedbl	] 	};
    key <AB02> {	[	    y,	Y		]	};
    key <AB03> {	[	    d,	D		]	};
    key <AB04> {	[	    s,	S		]	};
    key <AB05> {	[	    o,	O		]	};
    key <AB06> {	[	    m,	M		]	};
    key <AB07> {	[	    q,	Q		]	};
    key <AB08> {	[	comma,	less		]	};
    key <AB09> {	[	    0,	parenright	]	};
    key <AB10> {	[	    9,	parenleft	]	};
};

// Dvorak programmer's layout
// J. F. R. de Jesus (jfrdej@netcabo.pt)
partial alphanumeric_keys
xkb_symbols "dvorak-prog" {
  name[Group1]= "English (Dvorak, programmer)";
  key <TLDE> { [ grave, asciitilde, grave, asciitilde ] };
  key <AE01> { [ 1, exclam, 1, exclam ] };
  key <AE02> { [ 2, at, 2, at ] };
  key <AE03> { [ 3, numbersign, 3, numbersign ] };
  key <AE04> { [ 4, dollar, 4, dollar ] };
  key <AE05> { [ 5, percent, 5, percent ] };
  key <AE06> { [ 6, asciicircum, 6, asciicircum ] };
  key <AE07> { [ 7, ampersand, 7, ampersand ] };
  key <AE08> { [ 8, asterisk, 8, asterisk ] };
  key <AE09> { [ 9, parenleft, 9, parenleft ] };
  key <AE10> { [ 0, parenright, 0, parenright ] };
  key <AE11> { [ minus, underscore, minus, underscore ] };
  key <AE12> { [ equal, plus, equal, plus ] };

  key <AD01> { [ q, Q, Q, Q ] };
  key <AD02> { [ w, W, W, W ] };
  key <AD03> { [ e, E, E, E ] };
  key <AD04> { [ r, R, R, R ] };
  key <AD05> { [ t, T, T, T ] };
  key <AD06> { [ y, Y, Y, Y ] };
  key <AD07> { [ u, U, U, U ] };
  key <AD08> { [ i, I, I, I ] };
  key <AD09> { [ o, O, O, O ] };
  key <AD10> { [ p, P, P, P ] };
  key <AD11> { [ bracketleft, braceright, braceleft, braceright ] };
  key <AD12> { [ bracketright, braceright, bracketleft, bracketright ] };

  key <AC01> { [ a, A, A, A ] };
  key <AC02> { [ s, S, S, S ] };
  key <AC03> { [ d, D, D, D ] };
  key <AC04> { [ f, F, F, F ] };
  key <AC05> { [ g, G, G, G ] };
  key <AC06> { [ h, H, H, H ] };
  key <AC07> { [ j, J, J, J ] };
  key <AC08> { [ k, K, K, K ] };
  key <AC09> { [ l, L, L, L ] };
  key <AC10> { [ semicolon, colon, colon, semicolon ] };
  key <AC11> { [ apostrophe, quotedbl, apostrophe, quotedbl ] };

  key <AB01> { [ z, Z, Z, Z ] };
  key <AB02> { [ x, X, X, X ] };
  key <AB03> { [ c, C, C, C ] };
  key <AB04> { [ v, V, V, V ] };
  key <AB05> { [ b, B, B, B ] };
  key <AB06> { [ n, N, N, N ] };
  key <AB07> { [ m, M, M, M ] };
  key <AB08> { [ comma, less, less, comma ] };
  key <AB09> { [ period, greater, greater, period ] };
  key <AB10> { [ slash, question, question, slash ] };

  key <BKSL> { [ backslash, bar, backslash, bar ] };
};

// Dvorak-programmer's layout, with AltGr-Intl functions
// J. F. R. de Jesus (jfrdej@netcabo.pt)
partial alphanumeric_keys
xkb_symbols "dvorak-prog-intl" {
  include "us(dvorak-prog)"
  name[Group1]= "English (Dvorak, prog, intl)";
  include "alt-intl"
};

// Dvorak layout with Colemak-like symbols layout on level 3
// Created by Thomas (thomas.kugelstadt@gmail.com) 2011-04-12
partial alphanumeric_keys
xkb_symbols "dvorak-colemak-sym" {

  include "us(dvorak)"
  name[Group1]= "English (Dvorak, Colemak symbols)";

  // Shifted letters/symbols/numbers/bracket changes to match Colemak's second level for number row
  key <AE01> { [ 1, exclam, 1, exclam ] };
  key <AE02> { [ 2, at, 2, at ] };
  key <AE03> { [ 3, numbersign, 3, numbersign ] };
  key <AE04> { [ 4, dollar, 4, dollar ] };
  key <AE05> { [ 5, percent, 5, percent ] };
  key <AE06> { [ 6, asciicircum, 6, asciicircum ] };
  key <AE07> { [ 7, ampersand, 7, ampersand ] };
  key <AE08> { [ 8, asterisk, 8, asterisk ] };
  key <AE09> { [ 9, parenleft, 9, parenleft ] };
  key <AE10> { [ 0, parenright, 0, parenright ] };
  key <AE11> { [ minus, underscore, bracketleft, braceleft ] };
  key <AE12> { [ equal, plus, bracketright, braceright ] };

  // Dvorak symbol keys changed to Colemak's symbol keys
  key <AD01> { [ apostrophe, quotedbl, apostrophe, quotedbl ] };
  key <AD02> { [ comma, less, comma, less ] };
  key <AD03> { [ period, greater, period, greater ] };

  // Dvorak symbol keys changed to Colemak's symbol keys (home row)
  key <AC10> { [ s, S, s, S ] };
  key <AC11> { [ slash, question, slash, question ] };

  // Dvorak symbol keys changed to Colemak's symbol keys (bottom row)
  key <AB01> { [ semicolon, colon, semicolon, colon ] };
  key <AB08> { [ w, W, w, W ] };
  key <AB09> { [ v, V, v, V ] };
  key <AB10> { [ z, Z, z, Z ] };

  include "level3(ralt_switch)"
};
  '';
in

{
  # 1. Define the custom layout. The custom symbols file is registered under the name 'dvo-mod'.
  services.xserver = {
      xkb.extraLayouts.us = {
          description = "My Customized Dvorak Layout";
          languages = [ "eng" ];
          symbolsFile = myCustomKeymap;
      };

      # 2. Set the active layouts: standard US (QWERTY) and your custom layout.
      # This will make 'us' and 'dvo-mod' selectable.
      # Note: The 'dvorak' keyboard symbols group inside your file is named "dvorak".
      # To specifically use the Dvorak mapping from your custom file, you might need to use "dvo-mod(dvorak)".
      # I'll use the base layout name, and you can change it if necessary.
      # You must choose *only one* of the options below. I recommend the second one for clarity.
      # xkb.layout = "us,dvo-mod"; # Fallback layout and base custom layout
      xkb.layout = "us,dvorak"; # Standard US and the Dvorak variant from your custom file

      # 3. Add an option to easily switch between layouts, e.g., using Alt+Shift.
      xkb.options = "grp:alt_shift_toggle";
  };
}
