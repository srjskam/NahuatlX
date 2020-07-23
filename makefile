
all: install
	libreoffice Nahuatl_test.odt

install: Nahuatl_G.ttf
	cp Nahuatl_G.ttf ~/.local/share/fonts

Nahuatl_outlined.sfd:
	./outlines.py

Nahuatl_outlined.ttf: Nahuatl_outlined.sfd
	fontforge -lang=ff -c "Open(\"Nahuatl_outlined.sfd\");Generate(\"Nahuatl_outlined.ttf\");Close()"

Nahuatl_G.ttf: Nahuatl_outlined.ttf
	#./truetype.py
	cp Nahuatl_outlined.ttf Nahuatl_G.ttf
	#grcompiler -D Nahuatl.gdl Nahuatl_outlined.ttf Nahuatl_G.ttf

clean:
	-rm Nahuatl_G.ttf
	-rm Nahuatl_outlined*
	-rm dbg_*.txt gdlerr.txt
	-rm ~/.local/share/fonts/Nahuatl_G.ttf
