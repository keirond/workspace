# .PHONY

TIME := $(shell date +"%Y-%m-%d %H:%M:%S")

commit:
	git add .
	git commit -m "update $(TIME)"
	git push

# -------------------------------------------------------
# VARIABLES (update it if needed)

MY_MACOS_HOME := /home/baodh
MY_LINUX_HOME := /home/baodh
MY_WINDOWS_HOME := /mnt/c/Users/baodh

MY_SETUP_REPO := $(CURDIR)

# -------------------------------------------------------
# GITCONFIG

origin_macos_gitconfig := $(MY_MACOS_HOME)/.gitconfig
origin_linux_gitconfig := $(MY_LINUX_HOME)/.gitconfig
origin_windows_gitconfig := $(MY_WINDOWS_HOME)/.gitconfig

local_macos_gitconfig := $(MY_SETUP_REPO)/version_control/git/.gitconfig
local_linux_gitconfig := $(MY_SETUP_REPO)/version_control/git/.gitconfig
local_windows_gitconfig := $(MY_SETUP_REPO)/version_control/git/.gitconfig

push-gitconfig:  # wsl-linux & windows
	#yes | cp -rf $(local_macos_gitconfig) $(origin_macos_gitconfig)
	yes | cp -rf $(local_linux_gitconfig) $(origin_linux_gitconfig)
	yes | cp -rf $(local_windows_gitconfig) $(origin_windows_gitconfig)

pull-gitconfig: # wsl-linux & windows
	#yes | cp -rf $(origin_macos_gitconfig) $(local_macos_gitconfig)
	yes | cp -rf $(origin_linux_gitconfig) $(local_linux_gitconfig)
	yes | cp -rf $(origin_windows_gitconfig) $(local_windows_gitconfig)

# -------------------------------------------------------
# TERMINAL CONFIGURATION

origin_macos_zsh := $(MY_MACOS_HOME)/.zshrc
origin_linux_zsh := $(MY_LINUX_HOME)/.zshrc
origin_windows_pwsh := $(MY_WINDOWS_HOME)/OneDrive/Documents/Powershell/Microsoft.Powershell_profile.ps1

local_macos_zsh := $(MY_SETUP_REPO)/terminal/.zshrc
local_linux_zsh := $(MY_SETUP_REPO)/terminal/.zshrc
local_windows_pwsh := $(MY_SETUP_REPO)/terminal/Microsoft.Powershell_profile.ps1

push-terminal-config:  # wsl-linux & windows
	#yes | cp -rf $(local_macos_zsh) $(origin_macos_zsh)
	yes | cp -rf $(local_linux_zsh) $(origin_linux_zsh)
	yes | cp -rf $(local_windows_pwsh) $(origin_windows_pwsh)

pull-terminal-config: # wsl-linux & windows
	#yes | cp -rf $(origin_macos_zsh) $(local_macos_zsh)
	yes | cp -rf $(origin_linux_zsh) $(local_linux_zsh)
	yes | cp -rf $(origin_windows_pwsh) $(local_windows_pwsh)


# TERMINAL SETUP

local_macos_terminal_setup := $(MY_SETUP_REPO)/terminal/macos.terminal.setup.sh
local_linux_terminal_setup := $(MY_SETUP_REPO)/terminal/linux.terminal.setup.sh
local_windows_terminal_setup := $(MY_SETUP_REPO)/terminal/linux.terminal.setup.ps1

linux-terminal-setup:
	chmod +x $(local_linux_terminal_setup)
	$(local_linux_terminal_setup)
	yes | cp -rf $(local_linux_zsh) $(origin_linux_zsh)
	/bin/zsh -c 'source $(origin_linux_zsh)'
