INSTALL_DIR=~/.local/bin

all:
	@echo ""
	@echo "Please run 'make install'"
	@echo ""

install:
	@echo ""
	@echo "Installing Bashrepos..."
	mkdir -p ${INSTALL_DIR}
	cp bashrepos.bash bashrepos-completion.bash ${INSTALL_DIR}
	@echo "Done"
	@echo ""

uninstall:
	@echo ""
	@echo "Removing Bashrepos..."
	/bin/rm -rf ${INSTALL_DIR}
	@echo "Done"
	@echo ""

clean:
	@echo ""
	@echo "Removing Bashrepos..."
	/bin/rm -rf ${INSTALL_DIR}
	@echo "Done"
	@echo""

.PHONY: all install uninstall clean
