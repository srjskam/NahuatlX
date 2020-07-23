
all: install
	libreoffice Nahuatl_test.odt

install: Nahuatl_X.ttf Nahuatl_X_thin.ttf
	cp $^ ~/.local/share/fonts

Nahuatl_outlined.sfd:
	./outlines.py --name "NahuatlX" --family "NahuatlX" --weight "Regular" --width 17 --height 7 Nahuatl.sfd $@
Nahuatl_thin_outlined.sfd:
	./outlines.py --name "NahuatlXthin" --family "NahuatlXthin" --weight "Thin" --width 10 --height 7 Nahuatl.sfd $@

%.ttf: %.sfd
	fontforge -lang=ff -c "Open(\"$<\");Generate(\"$@\");Close()"

Nahuatl_X.ttf: Nahuatl_outlined.ttf
	cp $< $@
Nahuatl_X_thin.ttf: Nahuatl_thin_outlined.ttf
	cp $< $@

clean:
	-rm *.ttf
	-rm Nahuatl_outlined*
	-rm Nahuatl_thin_outlined*
	-rm dbg_*.txt gdlerr.txt
	-rm ~/.local/share/fonts/Nahuatl_X.ttf
	-rm ~/.local/share/fonts/Nahuatl_X_thin.ttf
