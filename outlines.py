#!/usr/bin/fontforge -script
 
# base: https://github.com/MihailJP/Muktamsiddham/blob/master/outlines.py

import argparse 

parser = argparse.ArgumentParser()
parser.add_argument('--name', type=str, help="Name of font", default="")
parser.add_argument('--family', type=str, help="Font family", default="")
parser.add_argument('--weight', type=str, help="Font weight", default="")
parser.add_argument('--width', type=int, help="Width of pen", default=17)
parser.add_argument('--height', type=int, help="Height of pen", default=7)
parser.add_argument('--angle', type=float, help="Pen angle (degrees)", default=20.0)
parser.add_argument('infile', help="An outline Fontforge font")
parser.add_argument('outfile')
args = parser.parse_args()


import fontforge
from math import radians

font = fontforge.open(args.infile)
font.strokedfont = False
print args.name, args.family, '-------'
if args.name != "":
    font.fontname = args.name.replace(' ','')
    font.fullname = args.name
if args.family != "":
    font.familyname = args.family
if args.weight != "":
    font.weight = args.weight

for glyph in font.glyphs():
    if glyph.isWorthOutputting():
        #print "outlining ", glyph, glyph.glyphname
        glyph.stroke("eliptical",args.width,args.height, radians(args.angle),"round","round")

font.selection.all()
font.addExtrema()
font.simplify()
font.removeOverlap()
font.addExtrema()
font.round()

font.encoding = "Original"
font.autoHint()

font.save(args.outfile)
