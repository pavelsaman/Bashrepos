INSTALL_DIR=~/.local/bin

define remove
@echo ""
@echo "Removing Bashrepos..."
/bin/rm -f ${INSTALL_DIR}/bashrepos.bash ${INSTALL_DIR}/bashrepos-completion.bash ~/.gitlocalrepos
@echo "Done"
@echo ""
endef


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
	$(remove)

clean:
	$(remove)

.PHONY: all install uninstall clean
