# unicode-normalizer package

Normalize Unicode characters.

See [Unicode equivalence](https://en.wikipedia.org/wiki/Unicode_equivalence) for more details.

##Functions

#####original text:

'①②③ Åüöã Åüöã CO₂ E=mc² ⅠⅦⅫ ㌀㈱ががｸﾞ'

#####unicode escape sequence:

'①②③ \xC5\xFC\xF6\xE3 A\u030Au\u0308o\u0308a\u0303 CO\u2082 E=mc\u00B2 ⅠⅦⅫ ㌀㈱か\u3099がｸﾞ'

### To NFC format
`unicode-normalizer:convert-to-NFC`

#####converted text:

'①②③ Åüöã Åüöã CO₂ E=mc² ⅠⅦⅫ ㌀㈱ががｸﾞ'

#####unicode escape sequence:

'①②③ \xC5\xFC\xF6\xE3 \xC5\xFC\xF6\xE3 CO\u2082 E=mc\xB2 ⅠⅦⅫ ㌀㈱ががｸﾞ'

### To NFKC format
`unicode-normalizer:convert-to-NFKC`

#####converted text:

'123 Åüöã Åüöã CO2 E=mc2 IVIIXII アパート(株)ががグ'

#####unicode escape sequence:

'123 \xC5\xFC\xF6\xE3 \xC5\xFC\xF6\xE3 CO2 E=mc2 IVIIXII アパート(株)ががグ'

### To NFD format
`unicode-normalizer:convert-to-NFD`

#####converted text:

'①②③ Åüöã Åüöã CO₂ E=mc² ⅠⅦⅫ ㌀㈱ががｸﾞ'

#####unicode escape sequence:

'①②③ A\u030Au\u0308o\u0308a\u0303 A\u030Au\u0308o\u0308a\u0303
 CO\u2082 E=mc\u00B2 ⅠⅦⅫ ㌀㈱か\u3099か\u3099ｸﾞ'

### To NFKD format
`unicode-normalizer:convert-to-NFKD`

#####converted text:

'123 Åüöã Åüöã CO2 E=mc2 IVIIXII アパート(株)ががグ'

#####unicode escape sequence:

'123 A\u030Au\u0308o\u0308a\u0303 A\u030Au\u0308o\u0308a\u0303
 CO2 E=mc2 IVIIXII アハ\u309Aート(株)か\u3099か\u3099ク\u3099'
