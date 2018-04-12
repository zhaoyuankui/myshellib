ifndef DESTDIR
DESTDIR = /usr/local
endif
ifeq ($(DESTDIR),'')
DESTDIR = /usr/local
endif

SOURCES = $(shell ls *.sh)
DOCS = $(addprefix docs/, $(shell ls docs 2> /dev/null)) README.md

all: install

install:
	install -d $(DESTDIR)/lib/myshellib
	install -d $(DESTDIR)/share/myshellib/docs
	install -m644 $(SOURCES) $(DESTDIR)/lib/myshellib
	install -m644 $(DOCS) $(DESTDIR)/share/myshellib/docs
	cd $(DESTDIR)/lib/myshellib && sh dependencies.sh
	@echo 'Please run the following command to add environment variables:'
	@echo "    export MYSHELLIB=$(DESTDIR)/lib/myshellib"
	@echo "    export MYSHELLIB_INSTALL_PATH=$(DESTDIR)"
uninstall:
	rm -rf $(MYSHELLIB_INSTALL_PATH)/lib/myshellib
	rm -rf $(MYSHELLIB_INSTALL_PATH)/share/myshellib
