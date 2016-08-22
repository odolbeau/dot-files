.PHONY: ${TARGETS}

install: prepare_install
	# Install dot files
	$(MAKE) DOT_FILE=ackrc install_dot_file
	$(MAKE) DOT_FILE=bash_aliases install_dot_file
	$(MAKE) DOT_FILE=bash_prompt install_dot_file
	$(MAKE) DOT_FILE=bashrc install_dot_file
	$(MAKE) DOT_FILE=gitconfig install_dot_file
	$(MAKE) DOT_FILE=gitignore install_dot_file
	$(MAKE) DOT_FILE=inputrc install_dot_file

	# Create ~/.config folder if needed
	if [ ! -d ${HOME}/.config ]; then mkdir ~/.config; fi

	# Install applications specific configuration
	if [ ! -L ${HOME}/.config/terminator ]; then ln -s ${HOME}/dot-files/.config/terminator ${HOME}/.config/terminator; fi

prepare_install:
	if [ -f ${HOME}/.bashrc ] && [ ! -L ${HOME}/.bashrc ]; then rm ${HOME}/.bashrc; fi

install_dot_file:
ifndef DOT_FILE
	$(error DOT_FILE is undefined)
endif
	if [ ! -L ${HOME}/.${DOT_FILE} ]; then \
		ln -s ${HOME}/dot-files/.${DOT_FILE} ${HOME}/.${DOT_FILE}; \
	fi \
