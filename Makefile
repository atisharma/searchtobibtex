SHELL = /bin/sh

MAKE     := /usr/bin/make
PREFIX   := /tmp/usr/local
MANDIR   := $(PREFIX)/share/man/man1
BINDIR   := $(PREFIX)/bin
BUILDDIR := build

BINFILES := doitobibtex pdftobibtex pdf-rename-by-doi searchtobibtex
MANFILES := $(patsubst %,man/%.1,$(BINFILES))

install: bin man

uninstall:
	-@for FILE in $(BINFILES); do \
		rm -f $(BINDIR)/$$FILE; \
		rm -f $(MANDIR)/$$FILE.1.gz; \
	done
	-@rmdir -p --ignore-fail-on-non-empty $(MANDIR) $(BINDIR) || true

bin: $(BINFILES)

$(BINFILES):
	@test -d $(BUILDDIR)/bin || mkdir -p $(BUILDDIR)/bin;
	@test -d $(BINDIR) || mkdir -p $(BINDIR);
	@for BINFILE in $(BINFILES); do \
		install -m 0755 bin/$$BINFILE $(BINDIR)/; \
	done

man: $(MANFILES)

$(MANFILES):
	@test -d $(BUILDDIR)/man || mkdir -p $(BUILDDIR)/man;
	@test -d $(MANDIR) || mkdir -p $(MANDIR);
	@for MANFILE in $(MANFILES); do \
		gzip -c $$MANFILE > $(BUILDDIR)/$$MANFILE.gz; \
		install -m 0644 $(BUILDDIR)/$$MANFILE.gz $(MANDIR)/; \
	done

clean:
	rm -rf $(BUILDDIR)

.PHONY: install man $(MANFILES) bin $(BINFILES) clean

