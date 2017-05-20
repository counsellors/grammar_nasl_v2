
/*  A Bison parser, made from nasl_grammar.y with Bison version GNU Bison version 1.24
  */

#define YYBISON 1  /* Identify Bison output.  */

#define	COMMENT	258
#define	FUNCTION	259
#define	LOCAL	260
#define	GLOBAL	261
#define	ELSE	262
#define	IF	263
#define	INCLUDE	264
#define	EXPORT	265
#define	IMPORT	266
#define	RETURN	267
#define	BREAK	268
#define	CONTINUE	269
#define	FOR	270
#define	FOREACH	271
#define	IN_ITER	272
#define	WHILE	273
#define	REPEAT	274
#define	REP	275
#define	UNTIL	276
#define	IDENT	277
#define	INT	278
#define	STRING	279
#define	FALSE	280
#define	_NULL_	281
#define	TRUE	282
#define	OR	283
#define	AND	284
#define	ADD_ASS	285
#define	SUB_ASS	286
#define	SUBSTR_EQ	287
#define	SUBSTR_NEQ	288
#define	REGEX_EQ	289
#define	REGEX_NEQ	290
#define	DEC	291
#define	INC	292
#define	DIV_ASS	293
#define	MUL_ASS	294
#define	MOD_ASS	295
#define	POWER	296
#define	CMP_EQ	297
#define	CMP_GE	298
#define	CMP_LE	299
#define	CMP_NEQ	300
#define	SL	301
#define	SR	302
#define	SRR	303
#define	SRR_ASS	304
#define	SR_ASS	305
#define	SL_ASS	306

#line 1 "nasl_grammar.y"


#define YYERROR_VERBOSE 1
#define YYDEBUG 1
extern int yylineno;

#ifndef YYLTYPE
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;

#define YYLTYPE yyltype
#endif

#ifndef YYSTYPE
#define YYSTYPE int
#endif
#include <stdio.h>

#ifndef __cplusplus
#ifndef __STDC__
#define const
#endif
#endif



#define	YYFINAL		273
#define	YYFLAG		-32768
#define	YYNTBASE	75

#define YYTRANSLATE(x) ((unsigned)(x) <= 306 ? yytranslate[x] : 116)

static const char yytranslate[] = {     0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    65,     2,     2,     2,    70,    55,     2,    52,
    53,    68,    66,    54,    67,    59,    69,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,    64,    56,    73,
    58,    74,     2,    57,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    62,     2,    63,    71,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    60,    72,    61,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    20,    21,    22,    23,    24,    25,
    26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
    36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
    46,    47,    48,    49,    50,    51
};

#if YYDEBUG != 0
static const short yyprhs[] = {     0,
     0,     3,     4,     6,     8,    10,    12,    15,    22,    28,
    32,    34,    36,    39,    41,    43,    45,    47,    49,    51,
    53,    55,    57,    59,    61,    63,    65,    67,    69,    71,
    73,    76,    79,    85,    91,    95,    99,   101,   105,   109,
   114,   120,   125,   129,   133,   135,   137,   140,   143,   146,
   149,   153,   157,   161,   165,   169,   173,   177,   181,   183,
   185,   187,   189,   191,   193,   195,   197,   205,   207,   210,
   212,   214,   216,   218,   220,   230,   240,   247,   254,   262,
   270,   276,   282,   288,   294,   300,   306,   314,   322,   330,
   338,   339,   342,   346,   350,   353,   357,   361,   365,   367,
   371,   373,   377,   379,   383,   387,   391,   395,   399,   403,
   405,   407,   408,   412,   416,   419,   423,   427,   431,   434,
   438,   442,   446,   450,   454,   458,   462,   466,   470,   474,
   478,   482,   486,   490,   494,   498,   502,   506,   510,   514,
   516,   518,   520
};

static const short yyrhs[] = {    76,
    75,     0,     0,     3,     0,    77,     0,    78,     0,    81,
     0,    10,    78,     0,     4,    98,    52,    79,    53,   110,
     0,     4,    98,    52,    53,   110,     0,    80,    54,    79,
     0,    80,     0,    98,     0,    55,    98,     0,    93,     0,
   100,     0,    99,     0,    82,     0,   104,     0,    93,     0,
    92,     0,    83,     0,    84,     0,    87,     0,    90,     0,
    89,     0,    94,     0,    91,     0,    85,     0,    86,     0,
    88,     0,    13,    56,     0,    14,    56,     0,    11,    52,
   100,    53,    56,     0,     9,    52,   100,    53,    56,     0,
    12,   115,    56,     0,    12,    57,    56,     0,    56,     0,
     6,   112,    56,     0,     5,   112,    56,     0,    92,    20,
   115,    56,     0,    98,    52,   113,    53,    56,     0,    98,
    52,    53,    56,     0,    98,    58,    97,     0,    98,    58,
   103,     0,    95,     0,    96,     0,    37,    98,     0,    36,
    98,     0,    98,    37,     0,    98,    36,     0,    98,    30,
    97,     0,    98,    31,    97,     0,    98,    39,    97,     0,
    98,    38,    97,     0,    98,    40,    97,     0,    98,    50,
    97,     0,    98,    49,    97,     0,    98,    51,    97,     0,
   115,     0,    92,     0,    22,     0,    17,     0,    23,     0,
    27,     0,    25,     0,    24,     0,    99,    59,    99,    59,
    99,    59,    99,     0,    26,     0,    57,    22,     0,   105,
     0,   106,     0,   107,     0,   108,     0,   109,     0,    15,
    52,   115,    56,   115,    56,   115,    53,   110,     0,    15,
    52,   115,    56,   115,    56,   115,    53,    81,     0,    16,
    98,    52,   115,    53,   110,     0,    16,    98,    52,   115,
    53,    81,     0,    16,    52,    98,    17,   115,    53,   110,
     0,    16,    52,    98,    17,   115,    53,    81,     0,    19,
   110,    21,   115,    56,     0,    19,    81,    21,   115,    56,
     0,    18,    52,   115,    53,   110,     0,    18,    52,   115,
    53,    81,     0,     8,    52,   115,    53,   110,     0,     8,
    52,   115,    53,    81,     0,     8,    52,   115,    53,   110,
     7,    81,     0,     8,    52,   115,    53,   110,     7,   110,
     0,     8,    52,   115,    53,    81,     7,   110,     0,     8,
    52,   115,    53,    81,     7,    81,     0,     0,    60,    61,
     0,    60,    76,    61,     0,    60,   113,    61,     0,    62,
    63,     0,    62,   113,    63,     0,    98,    58,   115,     0,
    98,    58,   103,     0,    98,     0,   111,    54,   112,     0,
   111,     0,   113,    54,   114,     0,   114,     0,   100,    64,
   115,     0,    99,    64,   115,     0,   100,    64,   103,     0,
    99,    64,   103,     0,    98,    64,   115,     0,    98,    64,
   103,     0,   115,     0,   103,     0,     0,    52,   115,    53,
     0,   115,    29,   115,     0,    65,   115,     0,   115,    28,
   115,     0,   115,    66,   115,     0,   115,    67,   115,     0,
    67,   115,     0,   115,    68,   115,     0,   115,    41,   115,
     0,   115,    69,   115,     0,   115,    70,   115,     0,   115,
    55,   115,     0,   115,    71,   115,     0,   115,    72,   115,
     0,   115,    47,   115,     0,   115,    46,   115,     0,   115,
    48,   115,     0,   115,    32,   115,     0,   115,    33,   115,
     0,   115,    35,   115,     0,   115,    34,   115,     0,   115,
    73,   115,     0,   115,    74,   115,     0,   115,    43,   115,
     0,   115,    44,   115,     0,   115,    42,   115,     0,   115,
    45,   115,     0,    99,     0,   100,     0,   101,     0,   102,
     0
};

#endif

#if YYDEBUG != 0
static const short yyrline[] = { 0,
    51,    52,    57,    58,    59,    60,    67,    70,    71,    77,
    78,    81,    82,    83,    84,    85,    90,    91,    96,    97,
    98,    99,   100,   101,   102,   103,   104,   105,   106,   107,
   114,   117,   120,   123,   126,   127,   130,   133,   136,   139,
   142,   143,   148,   149,   150,   151,   154,   155,   156,   157,
   160,   161,   162,   163,   164,   167,   168,   169,   174,   175,
   178,   179,   182,   183,   184,   187,   190,   193,   196,   201,
   202,   203,   204,   205,   211,   212,   215,   216,   217,   218,
   221,   222,   225,   226,   229,   230,   231,   232,   233,   234,
   237,   238,   239,   240,   241,   242,   249,   250,   251,   254,
   255,   258,   259,   262,   263,   264,   265,   266,   267,   268,
   269,   274,   274,   275,   276,   277,   278,   279,   280,   281,
   282,   283,   284,   285,   286,   287,   288,   289,   290,   291,
   292,   293,   294,   295,   296,   297,   298,   299,   300,   301,
   302,   303,   304
};

static const char * const yytname[] = {   "$","error","$undefined.","COMMENT",
"FUNCTION","LOCAL","GLOBAL","ELSE","IF","INCLUDE","EXPORT","IMPORT","RETURN",
"BREAK","CONTINUE","FOR","FOREACH","IN_ITER","WHILE","REPEAT","REP","UNTIL",
"IDENT","INT","STRING","FALSE","_NULL_","TRUE","OR","AND","ADD_ASS","SUB_ASS",
"SUBSTR_EQ","SUBSTR_NEQ","REGEX_EQ","REGEX_NEQ","DEC","INC","DIV_ASS","MUL_ASS",
"MOD_ASS","POWER","CMP_EQ","CMP_GE","CMP_LE","CMP_NEQ","SL","SR","SRR","SRR_ASS",
"SR_ASS","SL_ASS","'('","')'","','","'&'","';'","'@'","'='","'.'","'{'","'}'",
"'['","']'","':'","'!'","'+'","'-'","'*'","'/'","'%'","'^'","'|'","'<'","'>'",
"nasl_script","line","export","function","parameters","parameter","command",
"simple","break","continue","import","include","return","empty","global","local",
"rep","call_function","assign","inc_dec_exp","assign_math_op","assign_shift_op",
"value","identifier","integer","string","ip","null","ref","compound","for_loop",
"foreach_loop","repeat_loop","while_loop","if_cond","block","var","vars","argument_list",
"argument","expression",""
};
#endif

static const short yyr1[] = {     0,
    75,    75,    76,    76,    76,    76,    77,    78,    78,    79,
    79,    80,    80,    80,    80,    80,    81,    81,    82,    82,
    82,    82,    82,    82,    82,    82,    82,    82,    82,    82,
    83,    84,    85,    86,    87,    87,    88,    89,    90,    91,
    92,    92,    93,    93,    93,    93,    94,    94,    94,    94,
    95,    95,    95,    95,    95,    96,    96,    96,    97,    97,
    98,    98,    99,    99,    99,   100,   101,   102,   103,   104,
   104,   104,   104,   104,   105,   105,   106,   106,   106,   106,
   107,   107,   108,   108,   109,   109,   109,   109,   109,   109,
   110,   110,   110,   110,   110,   110,   111,   111,   111,   112,
   112,   113,   113,   114,   114,   114,   114,   114,   114,   114,
   114,   115,   115,   115,   115,   115,   115,   115,   115,   115,
   115,   115,   115,   115,   115,   115,   115,   115,   115,   115,
   115,   115,   115,   115,   115,   115,   115,   115,   115,   115,
   115,   115,   115
};

static const short yyr2[] = {     0,
     2,     0,     1,     1,     1,     1,     2,     6,     5,     3,
     1,     1,     2,     1,     1,     1,     1,     1,     1,     1,
     1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
     2,     2,     5,     5,     3,     3,     1,     3,     3,     4,
     5,     4,     3,     3,     1,     1,     2,     2,     2,     2,
     3,     3,     3,     3,     3,     3,     3,     3,     1,     1,
     1,     1,     1,     1,     1,     1,     7,     1,     2,     1,
     1,     1,     1,     1,     9,     9,     6,     6,     7,     7,
     5,     5,     5,     5,     5,     5,     7,     7,     7,     7,
     0,     2,     3,     3,     2,     3,     3,     3,     1,     3,
     1,     3,     1,     3,     3,     3,     3,     3,     3,     1,
     1,     0,     3,     3,     2,     3,     3,     3,     2,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     1,
     1,     1,     1
};

static const short yydefact[] = {     2,
     3,     0,     0,     0,     0,     0,     0,     0,   112,     0,
     0,     0,     0,    62,     0,    91,    61,     0,     0,    37,
     2,     4,     5,     6,    17,    21,    22,    28,    29,    23,
    30,    25,    24,    27,    20,    19,    26,    45,    46,     0,
    18,    70,    71,    72,    73,    74,     0,    99,   101,     0,
     0,   112,     0,     7,     0,    63,    66,    65,    68,    64,
   112,     0,   112,   112,   140,   141,   142,   143,     0,    31,
    32,   112,     0,     0,   112,   112,   112,     0,     0,    48,
    47,     1,   112,   112,   112,    50,    49,   112,   112,   112,
   112,   112,   112,   112,   112,     0,   112,     0,    39,    38,
     0,     0,     0,     0,    36,   115,   119,     0,   112,   112,
   112,   112,   112,   112,   112,   112,   112,   112,   112,   112,
   112,   112,   112,    35,   112,   112,   112,   112,   112,   112,
   112,   112,   112,     0,     0,   112,     0,     0,    92,     0,
     0,   140,   141,   111,     0,   103,   110,    95,     0,     0,
   112,   112,     0,    60,    51,     0,    59,    52,    54,    53,
    55,    57,    56,    58,     0,     0,    43,    44,    91,     0,
     0,    11,    14,    12,    16,    15,    98,    97,   100,    91,
     0,     0,   113,     0,   116,   114,   130,   131,   133,   132,
   121,   138,   136,   137,   139,   128,   127,   129,   124,   117,
   118,   120,   122,   123,   125,   126,   134,   135,   112,   112,
     0,    91,    69,    93,   112,   112,   112,   112,    94,    96,
     0,     0,    40,    42,     0,     9,    13,    91,     0,    86,
    85,    34,    33,     0,     0,     0,    91,    84,    83,   109,
   108,   107,   105,   106,   104,   102,    82,    81,    41,     8,
    10,    91,    91,     0,   112,    91,    78,    77,    90,    89,
    87,    88,     0,     0,    80,    79,    67,    91,    76,    75,
     0,     0,     0
};

static const short yydefgoto[] = {    82,
    21,    22,    23,   171,   172,    24,    25,    26,    27,    28,
    29,    30,    31,    32,    33,    34,    35,    36,    37,    38,
    39,   155,    40,    65,    66,    67,    68,   144,    41,    42,
    43,    44,    45,    46,    79,    49,    50,   145,   146,   157
};

static const short yypact[] = {   350,
-32768,    43,    43,    43,   -46,   -42,    22,   -24,     6,   -19,
   -18,    -6,     2,-32768,    14,   315,-32768,    43,    43,-32768,
   350,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,    50,-32768,-32768,-32768,-32768,  1038,
-32768,-32768,-32768,-32768,-32768,-32768,    20,    18,    24,    28,
    32,   113,    69,-32768,    69,-32768,-32768,-32768,-32768,-32768,
   113,    38,   113,   113,    36,-32768,-32768,-32768,   412,-32768,
-32768,   113,    43,    46,   113,   252,   356,    79,   105,-32768,
-32768,-32768,   113,    25,    25,-32768,-32768,    25,    25,    25,
    25,    25,    25,   372,   409,   -10,   162,    43,-32768,-32768,
   459,    80,    81,   506,-32768,   976,   976,    60,   113,   113,
   113,   113,   113,   113,   113,   113,   113,   113,   113,   113,
   113,   113,   113,-32768,   113,   113,   113,   113,   113,   113,
   113,   113,   113,   553,   115,   113,   600,   119,-32768,    85,
  1021,    15,    83,-32768,   -20,-32768,   976,-32768,    84,   -27,
   113,   113,   647,-32768,-32768,    90,   976,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,    93,     8,-32768,-32768,   -40,    43,
    97,    98,-32768,   192,-32768,-32768,-32768,   976,-32768,   315,
   101,   102,-32768,    94,   976,   976,   976,   976,   976,   976,
   976,   976,   976,   976,   976,   976,   976,   976,   976,   976,
   976,   976,   976,   976,   976,   976,   976,   976,   113,   113,
   694,   315,-32768,-32768,   162,   162,   162,   409,-32768,-32768,
   741,   788,-32768,-32768,   104,-32768,-32768,   -40,   270,   170,
   172,-32768,-32768,    60,   835,   882,   315,-32768,-32768,-32768,
   976,-32768,   976,-32768,   976,-32768,-32768,-32768,-32768,-32768,
-32768,   315,   315,   123,   113,   315,-32768,-32768,-32768,-32768,
-32768,-32768,    60,   929,-32768,-32768,-32768,   315,-32768,-32768,
   183,   191,-32768
};

static const short yypgoto[] = {   193,
   118,-32768,   188,   -32,-32768,   -16,-32768,-32768,-32768,-32768,
-32768,-32768,-32768,-32768,-32768,-32768,   251,   -94,-32768,-32768,
-32768,   428,    78,   -73,   -37,-32768,-32768,   -86,-32768,-32768,
-32768,-32768,-32768,-32768,   -53,-32768,     1,   -69,   -14,    -8
};


#define	YYLAST		1096


static const short yytable[] = {    78,
    69,   173,   142,   142,    51,    52,    14,   150,   168,    53,
   177,    17,    56,    57,    58,   102,    60,   103,    14,    76,
   142,    77,   175,    17,   166,     2,   218,    55,    56,    57,
    58,    59,    60,   218,   184,   220,    70,    71,   143,   143,
   219,    14,   169,   101,   170,    72,    17,    56,    57,    58,
    59,    60,   104,    73,   106,   107,   143,    61,   176,    14,
   225,   218,    62,   134,    17,    75,   137,   147,   147,    83,
    63,    96,    64,   108,   153,    97,    61,    98,   216,    47,
    48,    48,    56,    99,    58,   147,    60,   100,   178,    63,
    74,    64,    57,   105,   108,    80,    81,   136,   179,   151,
   185,   186,   187,   188,   189,   190,   191,   192,   193,   194,
   195,   196,   197,   198,   199,   226,   200,   201,   202,   203,
   204,   205,   206,   207,   208,   152,   231,   211,   240,   242,
   244,   210,   181,   182,   173,    56,    57,    58,    59,    60,
   213,    94,   221,   222,   142,   214,   217,   215,   224,   228,
   135,   229,   234,   141,   149,   175,   232,   233,   239,   249,
   254,   156,   156,   230,    61,   156,   156,   156,   156,   156,
   156,   149,   156,   174,   250,    48,   252,    63,   253,    64,
   143,   263,   272,   258,    56,    57,    58,    59,    60,   267,
   273,   176,   271,   140,    54,   238,   251,     0,   260,   262,
   235,   236,   266,   246,     0,     0,   241,   243,   245,   147,
     0,     0,     0,    61,   270,     0,     0,     0,   138,     0,
   257,    84,    85,     0,     0,     0,    63,     0,    64,    88,
    89,    90,     0,     0,     0,   259,   261,     0,     0,   265,
    91,    92,    93,     0,     0,     0,   264,   227,     0,    95,
     0,   269,     0,     0,     1,     2,     3,     4,     0,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
    16,     0,     0,    17,    56,    57,    58,    59,    60,     0,
     0,     0,     0,     0,     0,     0,    14,    18,    19,     0,
     0,    17,    56,    57,    58,   149,    60,     0,     0,     0,
     0,     0,     0,    61,     0,     0,   174,    20,   138,     0,
     0,     0,   139,     0,     0,     0,    63,     0,    64,     3,
     4,     0,     5,     6,   170,     8,     9,    10,    11,    12,
    13,    14,    15,    16,   154,   154,    17,     0,   154,   154,
   154,   154,   154,   154,     0,   154,     0,     0,     0,     0,
    18,    19,     1,     2,     3,     4,     0,     5,     6,     7,
     8,     9,    10,    11,    12,    13,    14,    15,    16,     0,
    20,    17,    14,     0,    76,     0,    77,    17,    56,    57,
    58,    59,    60,     0,     0,    18,    19,     0,    14,     0,
     0,     0,     0,    17,    56,    57,    58,    59,    60,     0,
     0,     0,     0,     0,     0,    20,     0,    61,     0,     0,
     0,     0,   138,     0,     0,     0,     0,     0,   148,     0,
    63,     0,    64,    61,   165,    14,     0,     0,   138,     0,
    17,    56,    57,    58,    59,    60,    63,     0,    64,   109,
   110,     0,     0,   111,   112,   113,   114,     0,     0,     0,
     0,     0,   115,   116,   117,   118,   119,   120,   121,   122,
    61,     0,     0,     0,     0,   138,   123,   124,     0,     0,
     0,     0,     0,    63,     0,    64,     0,   125,   126,   127,
   128,   129,   130,   131,   132,   133,   109,   110,     0,     0,
   111,   112,   113,   114,     0,     0,     0,     0,     0,   115,
   116,   117,   118,   119,   120,   121,   122,     0,     0,     0,
     0,   180,   158,   123,     0,   159,   160,   161,   162,   163,
   164,     0,   167,     0,   125,   126,   127,   128,   129,   130,
   131,   132,   133,   109,   110,     0,     0,   111,   112,   113,
   114,     0,     0,     0,     0,     0,   115,   116,   117,   118,
   119,   120,   121,   122,     0,     0,     0,     0,   183,     0,
   123,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,   125,   126,   127,   128,   129,   130,   131,   132,   133,
   109,   110,     0,     0,   111,   112,   113,   114,     0,     0,
     0,     0,     0,   115,   116,   117,   118,   119,   120,   121,
   122,     0,     0,     0,     0,     0,     0,   123,   209,     0,
     0,     0,     0,     0,     0,     0,     0,     0,   125,   126,
   127,   128,   129,   130,   131,   132,   133,   109,   110,     0,
     0,   111,   112,   113,   114,     0,     0,     0,     0,     0,
   115,   116,   117,   118,   119,   120,   121,   122,     0,     0,
     0,     0,   212,     0,   123,     0,     0,     0,     0,     0,
     0,     0,     0,     0,     0,   125,   126,   127,   128,   129,
   130,   131,   132,   133,   109,   110,     0,     0,   111,   112,
   113,   114,     0,     0,     0,     0,     0,   115,   116,   117,
   118,   119,   120,   121,   122,     0,     0,     0,     0,     0,
     0,   123,   223,     0,     0,     0,     0,     0,     0,     0,
     0,     0,   125,   126,   127,   128,   129,   130,   131,   132,
   133,   109,   110,     0,     0,   111,   112,   113,   114,     0,
     0,     0,     0,     0,   115,   116,   117,   118,   119,   120,
   121,   122,     0,     0,     0,     0,   237,     0,   123,     0,
     0,     0,     0,     0,     0,     0,     0,     0,     0,   125,
   126,   127,   128,   129,   130,   131,   132,   133,   109,   110,
     0,     0,   111,   112,   113,   114,     0,     0,     0,     0,
     0,   115,   116,   117,   118,   119,   120,   121,   122,     0,
     0,     0,     0,     0,     0,   123,   247,     0,     0,     0,
     0,     0,     0,     0,     0,     0,   125,   126,   127,   128,
   129,   130,   131,   132,   133,   109,   110,     0,     0,   111,
   112,   113,   114,     0,     0,     0,     0,     0,   115,   116,
   117,   118,   119,   120,   121,   122,     0,     0,     0,     0,
     0,     0,   123,   248,     0,     0,     0,     0,     0,     0,
     0,     0,     0,   125,   126,   127,   128,   129,   130,   131,
   132,   133,   109,   110,     0,     0,   111,   112,   113,   114,
     0,     0,     0,     0,     0,   115,   116,   117,   118,   119,
   120,   121,   122,     0,     0,     0,     0,     0,     0,   123,
   255,     0,     0,     0,     0,     0,     0,     0,     0,     0,
   125,   126,   127,   128,   129,   130,   131,   132,   133,   109,
   110,     0,     0,   111,   112,   113,   114,     0,     0,     0,
     0,     0,   115,   116,   117,   118,   119,   120,   121,   122,
     0,     0,     0,     0,   256,     0,   123,     0,     0,     0,
     0,     0,     0,     0,     0,     0,     0,   125,   126,   127,
   128,   129,   130,   131,   132,   133,   109,   110,     0,     0,
   111,   112,   113,   114,     0,     0,     0,     0,     0,   115,
   116,   117,   118,   119,   120,   121,   122,     0,     0,     0,
     0,   268,     0,   123,     0,     0,     0,     0,     0,     0,
     0,     0,     0,     0,   125,   126,   127,   128,   129,   130,
   131,   132,   133,   109,   110,     0,     0,   111,   112,   113,
   114,     0,     0,     0,     0,     0,   115,   116,   117,   118,
   119,   120,   121,   122,     0,     0,     0,     0,     0,     0,
   123,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,   125,   126,   127,   128,   129,   130,   131,   132,   133,
    84,    85,     0,     0,     0,     0,    86,    87,    88,    89,
    90,     0,     0,     0,     0,     0,     0,    84,    85,    91,
    92,    93,    94,    86,    87,    88,    89,    90,    95,     0,
     0,     0,     0,     0,   215,     0,    91,    92,    93,    94,
     0,     0,     0,     0,     0,    95
};

static const short yycheck[] = {    16,
     9,    96,    76,    77,     4,    52,    17,    77,    95,    52,
    97,    22,    23,    24,    25,    53,    27,    55,    17,    60,
    94,    62,    96,    22,    94,     4,    54,    52,    23,    24,
    25,    26,    27,    54,   108,    63,    56,    56,    76,    77,
    61,    17,    53,    52,    55,    52,    22,    23,    24,    25,
    26,    27,    61,    52,    63,    64,    94,    52,    96,    17,
    53,    54,    57,    72,    22,    52,    75,    76,    77,    20,
    65,    52,    67,    59,    83,    58,    52,    54,    64,     2,
     3,     4,    23,    56,    25,    94,    27,    56,    97,    65,
    13,    67,    24,    56,    59,    18,    19,    52,    98,    21,
   109,   110,   111,   112,   113,   114,   115,   116,   117,   118,
   119,   120,   121,   122,   123,   169,   125,   126,   127,   128,
   129,   130,   131,   132,   133,    21,   180,   136,   215,   216,
   217,    17,    53,    53,   229,    23,    24,    25,    26,    27,
    22,    52,   151,   152,   218,    61,    64,    64,    56,    53,
    73,    54,    59,    76,    77,   229,    56,    56,   212,    56,
   234,    84,    85,   180,    52,    88,    89,    90,    91,    92,
    93,    94,    95,    96,   228,    98,     7,    65,     7,    67,
   218,    59,     0,   237,    23,    24,    25,    26,    27,   263,
     0,   229,     0,    76,     7,   212,   229,    -1,   252,   253,
   209,   210,   256,   218,    -1,    -1,   215,   216,   217,   218,
    -1,    -1,    -1,    52,   268,    -1,    -1,    -1,    57,    -1,
   237,    30,    31,    -1,    -1,    -1,    65,    -1,    67,    38,
    39,    40,    -1,    -1,    -1,   252,   253,    -1,    -1,   256,
    49,    50,    51,    -1,    -1,    -1,   255,   170,    -1,    58,
    -1,   268,    -1,    -1,     3,     4,     5,     6,    -1,     8,
     9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
    19,    -1,    -1,    22,    23,    24,    25,    26,    27,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    17,    36,    37,    -1,
    -1,    22,    23,    24,    25,   218,    27,    -1,    -1,    -1,
    -1,    -1,    -1,    52,    -1,    -1,   229,    56,    57,    -1,
    -1,    -1,    61,    -1,    -1,    -1,    65,    -1,    67,     5,
     6,    -1,     8,     9,    55,    11,    12,    13,    14,    15,
    16,    17,    18,    19,    84,    85,    22,    -1,    88,    89,
    90,    91,    92,    93,    -1,    95,    -1,    -1,    -1,    -1,
    36,    37,     3,     4,     5,     6,    -1,     8,     9,    10,
    11,    12,    13,    14,    15,    16,    17,    18,    19,    -1,
    56,    22,    17,    -1,    60,    -1,    62,    22,    23,    24,
    25,    26,    27,    -1,    -1,    36,    37,    -1,    17,    -1,
    -1,    -1,    -1,    22,    23,    24,    25,    26,    27,    -1,
    -1,    -1,    -1,    -1,    -1,    56,    -1,    52,    -1,    -1,
    -1,    -1,    57,    -1,    -1,    -1,    -1,    -1,    63,    -1,
    65,    -1,    67,    52,    53,    17,    -1,    -1,    57,    -1,
    22,    23,    24,    25,    26,    27,    65,    -1,    67,    28,
    29,    -1,    -1,    32,    33,    34,    35,    -1,    -1,    -1,
    -1,    -1,    41,    42,    43,    44,    45,    46,    47,    48,
    52,    -1,    -1,    -1,    -1,    57,    55,    56,    -1,    -1,
    -1,    -1,    -1,    65,    -1,    67,    -1,    66,    67,    68,
    69,    70,    71,    72,    73,    74,    28,    29,    -1,    -1,
    32,    33,    34,    35,    -1,    -1,    -1,    -1,    -1,    41,
    42,    43,    44,    45,    46,    47,    48,    -1,    -1,    -1,
    -1,    53,    85,    55,    -1,    88,    89,    90,    91,    92,
    93,    -1,    95,    -1,    66,    67,    68,    69,    70,    71,
    72,    73,    74,    28,    29,    -1,    -1,    32,    33,    34,
    35,    -1,    -1,    -1,    -1,    -1,    41,    42,    43,    44,
    45,    46,    47,    48,    -1,    -1,    -1,    -1,    53,    -1,
    55,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    66,    67,    68,    69,    70,    71,    72,    73,    74,
    28,    29,    -1,    -1,    32,    33,    34,    35,    -1,    -1,
    -1,    -1,    -1,    41,    42,    43,    44,    45,    46,    47,
    48,    -1,    -1,    -1,    -1,    -1,    -1,    55,    56,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    67,
    68,    69,    70,    71,    72,    73,    74,    28,    29,    -1,
    -1,    32,    33,    34,    35,    -1,    -1,    -1,    -1,    -1,
    41,    42,    43,    44,    45,    46,    47,    48,    -1,    -1,
    -1,    -1,    53,    -1,    55,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    -1,    66,    67,    68,    69,    70,
    71,    72,    73,    74,    28,    29,    -1,    -1,    32,    33,
    34,    35,    -1,    -1,    -1,    -1,    -1,    41,    42,    43,
    44,    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,
    -1,    55,    56,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    66,    67,    68,    69,    70,    71,    72,    73,
    74,    28,    29,    -1,    -1,    32,    33,    34,    35,    -1,
    -1,    -1,    -1,    -1,    41,    42,    43,    44,    45,    46,
    47,    48,    -1,    -1,    -1,    -1,    53,    -1,    55,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,
    67,    68,    69,    70,    71,    72,    73,    74,    28,    29,
    -1,    -1,    32,    33,    34,    35,    -1,    -1,    -1,    -1,
    -1,    41,    42,    43,    44,    45,    46,    47,    48,    -1,
    -1,    -1,    -1,    -1,    -1,    55,    56,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    66,    67,    68,    69,
    70,    71,    72,    73,    74,    28,    29,    -1,    -1,    32,
    33,    34,    35,    -1,    -1,    -1,    -1,    -1,    41,    42,
    43,    44,    45,    46,    47,    48,    -1,    -1,    -1,    -1,
    -1,    -1,    55,    56,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    -1,    66,    67,    68,    69,    70,    71,    72,
    73,    74,    28,    29,    -1,    -1,    32,    33,    34,    35,
    -1,    -1,    -1,    -1,    -1,    41,    42,    43,    44,    45,
    46,    47,    48,    -1,    -1,    -1,    -1,    -1,    -1,    55,
    56,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    66,    67,    68,    69,    70,    71,    72,    73,    74,    28,
    29,    -1,    -1,    32,    33,    34,    35,    -1,    -1,    -1,
    -1,    -1,    41,    42,    43,    44,    45,    46,    47,    48,
    -1,    -1,    -1,    -1,    53,    -1,    55,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    -1,    -1,    -1,    66,    67,    68,
    69,    70,    71,    72,    73,    74,    28,    29,    -1,    -1,
    32,    33,    34,    35,    -1,    -1,    -1,    -1,    -1,    41,
    42,    43,    44,    45,    46,    47,    48,    -1,    -1,    -1,
    -1,    53,    -1,    55,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    -1,    -1,    -1,    66,    67,    68,    69,    70,    71,
    72,    73,    74,    28,    29,    -1,    -1,    32,    33,    34,
    35,    -1,    -1,    -1,    -1,    -1,    41,    42,    43,    44,
    45,    46,    47,    48,    -1,    -1,    -1,    -1,    -1,    -1,
    55,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
    -1,    66,    67,    68,    69,    70,    71,    72,    73,    74,
    30,    31,    -1,    -1,    -1,    -1,    36,    37,    38,    39,
    40,    -1,    -1,    -1,    -1,    -1,    -1,    30,    31,    49,
    50,    51,    52,    36,    37,    38,    39,    40,    58,    -1,
    -1,    -1,    -1,    -1,    64,    -1,    49,    50,    51,    52,
    -1,    -1,    -1,    -1,    -1,    58
};
/* -*-C-*-  Note some compilers choke on comments on `#line' lines.  */
#line 3 "bison.simple"

/* Skeleton output parser for bison,
   Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */
   
#ifndef alloca
#ifdef __GNUC__
#define alloca __builtin_alloca
#else /* not GNU C.  */
#if (!defined (__STDC__) && defined (sparc)) || defined (__sparc__) || defined (__sparc) || defined (__sgi)
#include <alloca.h>
#else /* not sparc */
#if defined (MSDOS) && !defined (__TURBOC__)
#include <malloc.h>
#else /* not MSDOS, or __TURBOC__ */
#if defined(_AIX)
#include <malloc.h>
 #pragma alloca
#else /* not MSDOS, __TURBOC__, or _AIX */
#ifdef __hpux
#ifdef __cplusplus
extern "C" {
void *alloca (unsigned int);
};
#else /* not __cplusplus */
void *alloca ();
#endif /* not __cplusplus */
#endif /* __hpux */
#endif /* not _AIX */
#endif /* not MSDOS, or __TURBOC__ */
#endif /* not sparc.  */
#endif /* not GNU C.  */
#endif /* alloca not defined.  */

/* This is the parser code that is written into each bison parser
  when the %semantic_parser declaration is not specified in the grammar.
  It was written by Richard Stallman by simplifying the hairy parser
  used when %semantic_parser is specified.  */

/* Note: there must be only one dollar sign in this file.
   It is replaced by the list of actions, each action
   as one case of the switch.  */

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		goto yyerrlab1
/* Like YYERROR except do call yyerror.
   This remains here temporarily to ease the
   transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */
#define YYFAIL		goto yyerrlab
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    { yychar = (token), yylval = (value);			\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { yyerror ("syntax error: cannot back up"); YYERROR; }	\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, &yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval, &yylloc)
#endif
#else /* not YYLSP_NEEDED */
#ifdef YYLEX_PARAM
#define YYLEX		yylex(&yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(&yylval)
#endif
#endif /* not YYLSP_NEEDED */
#endif

/* If nonreentrant, generate the variables here */

#ifndef YYPURE

int	yychar;			/*  the lookahead symbol		*/
YYSTYPE	yylval;			/*  the semantic value of the		*/
				/*  lookahead symbol			*/

#ifdef YYLSP_NEEDED
YYLTYPE yylloc;			/*  location data for the lookahead	*/
				/*  symbol				*/
#endif

int yynerrs;			/*  number of parse errors so far       */
#endif  /* not YYPURE */

#if YYDEBUG != 0
int yydebug;			/*  nonzero means print parse trace	*/
/* Since this is uninitialized, it does not stop multiple parsers
   from coexisting.  */
#endif

/*  YYINITDEPTH indicates the initial size of the parser's stacks	*/

#ifndef	YYINITDEPTH
#define YYINITDEPTH 200
#endif

/*  YYMAXDEPTH is the maximum size the stacks can grow to
    (effective only if the built-in stack extension method is used).  */

#if YYMAXDEPTH == 0
#undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
#define YYMAXDEPTH 10000
#endif

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
int yyparse (void);
#endif

#if __GNUC__ > 1		/* GNU C and GNU C++ define this.  */
#define __yy_memcpy(FROM,TO,COUNT)	__builtin_memcpy(TO,FROM,COUNT)
#else				/* not GNU C or C++ */
#ifndef __cplusplus

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (from, to, count)
     char *from;
     char *to;
     int count;
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#else /* __cplusplus */

/* This is the most reliable way to avoid incompatibilities
   in available built-in functions on various systems.  */
static void
__yy_memcpy (char *from, char *to, int count)
{
  register char *f = from;
  register char *t = to;
  register int i = count;

  while (i-- > 0)
    *t++ = *f++;
}

#endif
#endif

#line 192 "bison.simple"

/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
#define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
#else
#define YYPARSE_PARAM
#define YYPARSE_PARAM_DECL
#endif

int
yyparse(YYPARSE_PARAM)
     YYPARSE_PARAM_DECL
{
  register int yystate;
  register int yyn;
  register short *yyssp;
  register YYSTYPE *yyvsp;
  int yyerrstatus;	/*  number of tokens to shift before error messages enabled */
  int yychar1 = 0;		/*  lookahead token as an internal (translated) token number */

  short	yyssa[YYINITDEPTH];	/*  the state stack			*/
  YYSTYPE yyvsa[YYINITDEPTH];	/*  the semantic value stack		*/

  short *yyss = yyssa;		/*  refer to the stacks thru separate pointers */
  YYSTYPE *yyvs = yyvsa;	/*  to allow yyoverflow to reallocate them elsewhere */

#ifdef YYLSP_NEEDED
  YYLTYPE yylsa[YYINITDEPTH];	/*  the location stack			*/
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;

#define YYPOPSTACK   (yyvsp--, yyssp--, yylsp--)
#else
#define YYPOPSTACK   (yyvsp--, yyssp--)
#endif

  int yystacksize = YYINITDEPTH;

#ifdef YYPURE
  int yychar;
  YYSTYPE yylval;
  int yynerrs;
#ifdef YYLSP_NEEDED
  YYLTYPE yylloc;
#endif
#endif

  YYSTYPE yyval;		/*  the variable used to return		*/
				/*  semantic values from the action	*/
				/*  routines				*/

  int yylen;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Starting parse\n");
#endif

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss - 1;
  yyvsp = yyvs;
#ifdef YYLSP_NEEDED
  yylsp = yyls;
#endif

/* Push a new state, which is found in  yystate  .  */
/* In all cases, when you get here, the value and location stacks
   have just been pushed. so pushing a state here evens the stacks.  */
yynewstate:

  *++yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Give user a chance to reallocate the stack */
      /* Use copies of these so that the &'s don't force the real ones into memory. */
      YYSTYPE *yyvs1 = yyvs;
      short *yyss1 = yyss;
#ifdef YYLSP_NEEDED
      YYLTYPE *yyls1 = yyls;
#endif

      /* Get the current used size of the three stacks, in elements.  */
      int size = yyssp - yyss + 1;

#ifdef yyoverflow
      /* Each stack pointer address is followed by the size of
	 the data in use in that stack, in bytes.  */
#ifdef YYLSP_NEEDED
      /* This used to be a conditional around just the two extra args,
	 but that might be undefined if yyoverflow is a macro.  */
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yyls1, size * sizeof (*yylsp),
		 &yystacksize);
#else
      yyoverflow("parser stack overflow",
		 &yyss1, size * sizeof (*yyssp),
		 &yyvs1, size * sizeof (*yyvsp),
		 &yystacksize);
#endif

      yyss = yyss1; yyvs = yyvs1;
#ifdef YYLSP_NEEDED
      yyls = yyls1;
#endif
#else /* no yyoverflow */
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	{
	  yyerror("parser stack overflow");
	  return 2;
	}
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;
      yyss = (short *) alloca (yystacksize * sizeof (*yyssp));
      __yy_memcpy ((char *)yyss1, (char *)yyss, size * sizeof (*yyssp));
      yyvs = (YYSTYPE *) alloca (yystacksize * sizeof (*yyvsp));
      __yy_memcpy ((char *)yyvs1, (char *)yyvs, size * sizeof (*yyvsp));
#ifdef YYLSP_NEEDED
      yyls = (YYLTYPE *) alloca (yystacksize * sizeof (*yylsp));
      __yy_memcpy ((char *)yyls1, (char *)yyls, size * sizeof (*yylsp));
#endif
#endif /* no yyoverflow */

      yyssp = yyss + size - 1;
      yyvsp = yyvs + size - 1;
#ifdef YYLSP_NEEDED
      yylsp = yyls + size - 1;
#endif

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Stack size increased to %d\n", yystacksize);
#endif

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Entering state %d\n", yystate);
#endif

  goto yybackup;
 yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Reading a token: ");
#endif
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with */

  if (yychar <= 0)		/* This means end of input. */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more */

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Now at end of input.\n");
#endif
    }
  else
    {
      yychar1 = YYTRANSLATE(yychar);

#if YYDEBUG != 0
      if (yydebug)
	{
	  fprintf (stderr, "Next token is %d (%s", yychar, yytname[yychar1]);
	  /* Give the individual parser a way to print the precise meaning
	     of a token, for further debugging info.  */
#ifdef YYPRINT
	  YYPRINT (stderr, yychar, yylval);
#endif
	  fprintf (stderr, ")\n");
	}
#endif
    }

  yyn += yychar1;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != yychar1)
    goto yydefault;

  yyn = yytable[yyn];

  /* yyn is what to do for this token type in this state.
     Negative => reduce, -yyn is rule number.
     Positive => shift, yyn is new state.
       New state is final state => don't bother to shift,
       just return success.
     0, or most negative number => error.  */

  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrlab;

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting token %d (%s), ", yychar, yytname[yychar1]);
#endif

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  /* count tokens shifted since error; after three, turn off error status.  */
  if (yyerrstatus) yyerrstatus--;

  yystate = yyn;
  goto yynewstate;

/* Do the default action for the current state.  */
yydefault:

  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;

/* Do a reduction.  yyn is the number of a rule to reduce with.  */
yyreduce:
  yylen = yyr2[yyn];
  if (yylen > 0)
    yyval = yyvsp[1-yylen]; /* implement default value of the action */

#if YYDEBUG != 0
  if (yydebug)
    {
      int i;

      fprintf (stderr, "Reducing via rule %d (line %d), ",
	       yyn, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (i = yyprhs[yyn]; yyrhs[i] > 0; i++)
	fprintf (stderr, "%s ", yytname[yyrhs[i]]);
      fprintf (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif


  switch (yyn) {

}
   /* the action file gets copied in in place of this dollarsign */
#line 487 "bison.simple"

  yyvsp -= yylen;
  yyssp -= yylen;
#ifdef YYLSP_NEEDED
  yylsp -= yylen;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;

#ifdef YYLSP_NEEDED
  yylsp++;
  if (yylen == 0)
    {
      yylsp->first_line = yylloc.first_line;
      yylsp->first_column = yylloc.first_column;
      yylsp->last_line = (yylsp-1)->last_line;
      yylsp->last_column = (yylsp-1)->last_column;
      yylsp->text = 0;
    }
  else
    {
      yylsp->last_line = (yylsp+yylen-1)->last_line;
      yylsp->last_column = (yylsp+yylen-1)->last_column;
    }
#endif

  /* Now "shift" the result of the reduction.
     Determine what state that goes to,
     based on the state we popped back to
     and the rule number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTBASE] + *yyssp;
  if (yystate >= 0 && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTBASE];

  goto yynewstate;

yyerrlab:   /* here on detecting error */

  if (! yyerrstatus)
    /* If not already recovering from an error, report this error.  */
    {
      ++yynerrs;

#ifdef YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (yyn > YYFLAG && yyn < YYLAST)
	{
	  int size = 0;
	  char *msg;
	  int x, count;

	  count = 0;
	  /* Start X at -yyn if nec to avoid negative indexes in yycheck.  */
	  for (x = (yyn < 0 ? -yyn : 0);
	       x < (sizeof(yytname) / sizeof(char *)); x++)
	    if (yycheck[x + yyn] == x)
	      size += strlen(yytname[x]) + 15, count++;
	  msg = (char *) malloc(size + 15);
	  if (msg != 0)
	    {
	      strcpy(msg, "parse error");

	      if (count < 5)
		{
		  count = 0;
		  for (x = (yyn < 0 ? -yyn : 0);
		       x < (sizeof(yytname) / sizeof(char *)); x++)
		    if (yycheck[x + yyn] == x)
		      {
			strcat(msg, count == 0 ? ", expecting `" : " or `");
			strcat(msg, yytname[x]);
			strcat(msg, "'");
			count++;
		      }
		}
	      yyerror(msg);
	      free(msg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exceeded");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror("parse error");
    }

  goto yyerrlab1;
yyerrlab1:   /* here on error raised explicitly by an action */

  if (yyerrstatus == 3)
    {
      /* if just tried and failed to reuse lookahead token after an error, discard it.  */

      /* return failure if at end of input */
      if (yychar == YYEOF)
	YYABORT;

#if YYDEBUG != 0
      if (yydebug)
	fprintf(stderr, "Discarding token %d (%s).\n", yychar, yytname[yychar1]);
#endif

      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token
     after shifting the error token.  */

  yyerrstatus = 3;		/* Each real token shifted decrements this */

  goto yyerrhandle;

yyerrdefault:  /* current state does not do anything special for the error token. */

#if 0
  /* This is wrong; only states that explicitly want error tokens
     should shift them.  */
  yyn = yydefact[yystate];  /* If its default is to accept any token, ok.  Otherwise pop it.*/
  if (yyn) goto yydefault;
#endif

yyerrpop:   /* pop the current state because it cannot handle the error token */

  if (yyssp == yyss) YYABORT;
  yyvsp--;
  yystate = *--yyssp;
#ifdef YYLSP_NEEDED
  yylsp--;
#endif

#if YYDEBUG != 0
  if (yydebug)
    {
      short *ssp1 = yyss - 1;
      fprintf (stderr, "Error: state stack now");
      while (ssp1 != yyssp)
	fprintf (stderr, " %d", *++ssp1);
      fprintf (stderr, "\n");
    }
#endif

yyerrhandle:

  yyn = yypact[yystate];
  if (yyn == YYFLAG)
    goto yyerrdefault;

  yyn += YYTERROR;
  if (yyn < 0 || yyn > YYLAST || yycheck[yyn] != YYTERROR)
    goto yyerrdefault;

  yyn = yytable[yyn];
  if (yyn < 0)
    {
      if (yyn == YYFLAG)
	goto yyerrpop;
      yyn = -yyn;
      goto yyreduce;
    }
  else if (yyn == 0)
    goto yyerrpop;

  if (yyn == YYFINAL)
    YYACCEPT;

#if YYDEBUG != 0
  if (yydebug)
    fprintf(stderr, "Shifting error token, ");
#endif

  *++yyvsp = yylval;
#ifdef YYLSP_NEEDED
  *++yylsp = yylloc;
#endif

  yystate = yyn;
  goto yynewstate;
}
#line 306 "nasl_grammar.y"

#include <stdio.h>
extern char yytext[];
extern int column;
yyerror(char const *s)
{
	
	//printf("\n%d\n", yylineno);
	fflush(stdout);
	printf("\n%*s\n%*s\n", column, "^", column, s);
}

lex()
{
	printf("\n%s\n", stdin);
}
int main()
{
	return(yyparse());
}
