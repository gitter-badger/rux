
DESTDIR=$(shell pwd)/.install
export DESTDIR

all:
	$(MAKE) -C src
	$(MAKE) -C doc

install: all
	mkdir -p $(DESTDIR)
	$(MAKE) -C src install
	$(MAKE) -C doc install
	@mkdir -p $(DESTDIR)/usr/share/doc/rux/
	cp -r examples $(DESTDIR)/usr/share/doc/rux/
	chown -R root.root $(DESTDIR)/usr/share/doc/rux/
	@$(MAKE) -C $(DESTDIR)/usr/share/doc/rux/examples clean

deb: install
	mkdir -p $(DESTDIR)/DEBIAN
	cp package/debian/control $(DESTDIR)/DEBIAN/
	dpkg-deb --build $(DESTDIR) rux.deb

rpm: install
	rm -rf RPMS
	mkdir -p RPMS
	rpmbuild -bb package/rpm/rux.spec --buildroot=`readlink -e $(DESTDIR)`
	mv `find RPMS -name \*.rpm` .
	rm -rf RPMS


deb-check:
	lintian rux.deb

clean:
	$(MAKE) -C doc clean
	rm -f *.rpm *.deb
	rm -rf $(DESTDIR)

test:
	@echo Dummy rule
