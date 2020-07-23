#!/usr/bin/fontforge -script
 
# base: https://github.com/MihailJP/Muktamsiddham/blob/master/outlines.py

import fontforge
from math import radians

font = fontforge.open("Nahuatl.sfd")
font.strokedfont = False

for glyph in font.glyphs():
    if glyph.isWorthOutputting():
        print "outlining ", glyph, glyph.glyphname
        glyph.stroke("eliptical",17,7,radians(20.0),"round","round")

font.selection.all()
font.addExtrema()
font.simplify()
font.removeOverlap()
font.addExtrema()
font.round()

font.encoding = "Original"
font.autoHint()

font.save("Nahuatl_outlined.sfd")
