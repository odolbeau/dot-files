.PHONY: ${TARGETS}

install: prepare_install
	# Install dot files
	@$(MAKE) -s DOT_FILE=ackrc install_dot_file
	@$(MAKE) -s DOT_FILE=bash_aliases install_dot_file
	@$(MAKE) -s DOT_FILE=bash_prompt install_dot_file
	@$(MAKE) -s DOT_FILE=bashrc install_dot_file
	@$(MAKE) -s DOT_FILE=gitconfig install_dot_file
	@$(MAKE) -s DOT_FILE=gitignore install_dot_file
	@$(MAKE) -s DOT_FILE=inputrc install_dot_file

	# Install bash completion script to complete aliases
	@# See https://unix.stackexchange.com/a/332522
	@sudo sh -c 'curl -s https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias > /etc/bash_completion.d/complete_alias'

	# Create ~/.config folder if needed
	@if [ ! -d ${HOME}/.config ]; then mkdir ~/.config; fi

	# Install applications specific configuration
	@$(MAKE) -s APP=terminator install_application_config

prepare_install:
	@if [ -f ${HOME}/.bashrc ] && [ ! -L ${HOME}/.bashrc ]; then rm ${HOME}/.bashrc; fi

install_dot_file:
ifndef DOT_FILE
	$(error DOT_FILE is undefined)
endif
	@if [ ! -L ${HOME}/.${DOT_FILE} ]; then \
		ln -s ${HOME}/dot-files/.${DOT_FILE} ${HOME}/.${DOT_FILE}; \
	fi \

install_application_config:
ifndef APP
	$(error APP is undefined)
endif
	@if [ ! -L ${HOME}/.config/${APP} ]; then \
		ln -s ${HOME}/dot-files/.config/${APP} ${HOME}/.config/${APP}; \
	fi \
