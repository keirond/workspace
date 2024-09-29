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

local_macos_gitconfig := $(MY_SETUP_REPO)/version_control/git/.macos.gitconfig
local_linux_gitconfig := $(MY_SETUP_REPO)/version_control/git/.linux.gitconfig
local_windows_gitconfig := $(MY_SETUP_REPO)/version_control/git/.windows.gitconfig

push-gitconfig:  # wsl-linux & windows
	#yes | cp -rf $(local_macos_gitconfig) $(origin_macos_gitconfig)
	yes | cp -rf $(local_linux_gitconfig) $(origin_linux_gitconfig)
	yes | cp -rf $(local_windows_gitconfig) $(origin_windows_gitconfig)

pull-gitconfig: # wsl-linux & windows
	#yes | cp -rf $(origin_macos_gitconfig) $(local_macos_gitconfig)
	yes | cp -rf $(origin_linux_gitconfig) $(local_linux_gitconfig)
	yes | cp -rf $(origin_windows_gitconfig) $(local_windows_gitconfig)

# -------------------------------------------------------
# TERMINAL