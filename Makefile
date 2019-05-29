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
	/bin/rm -f ${INSTALL_DIR}/bashrepos.bash ${INSTALL_DIR}/bashrepos-completion.bash ~/.gitlocalrepos
	@echo "Done"
	@echo ""

clean:
	@echo ""
	@echo "Removing Bashrepos..."
	/bin/rm -f ${INSTALL_DIR}/bashrepos.bash ${INSTALL_DIR}/bashrepos-completion.bash ~/.gitlocalrepos
	@echo "Done"
	@echo""

.PHONY: all install uninstall clean
