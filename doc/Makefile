DOCPATH=$(DESTDIR)/usr/share/doc/rux
MANPATH=$(DESTDIR)/usr/share/man

all: rux.7 rux.html

rux.7: rux.md
	rst2man $^ $@

rux.html: rux.md
	rst2html $^ $@

install:
	install -D -m 0644 rux.7 $(MANPATH)/man7/rux.7
	install -D -m 0644 rux.html $(DOCPATH)/rux.html
	gzip -n -9 -f $(MANPATH)/man7/rux.7
	install -m 0644 -D ../AUTHORS $(DOCPATH)/AUTHORS
	install -m 0644 -D ../LICENSE $(DOCPATH)/copyright
	install -m 0644 -D ../README.md $(DOCPATH)/README.md
	install -m 0644 -D ../Changelog $(DOCPATH)/changelog
	gzip -n -9 -f $(DOCPATH)/changelog

uninstall:
	rm -f $(MANPATH)/man7/rux.7.gz
	rm -f $(MANPATH)/man1/rux.html
	rm -f $(DOCPATH)/AUTHORS
	rm -f $(DOCPATH)/copyright
	rm -f $(DOCPATH)/README.md
	rm -f $(DOCPATH)/changelog.gz

clean:


