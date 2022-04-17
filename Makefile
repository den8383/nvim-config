install-neovim:
	sudo apt-get -y install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt-get -y update
	sudo apt-get -y install neovim

install-node:
	sudo apt install -y nodejs npm
	sudo npm install n -g
	sudo n stable
	sudo apt purge -y nodejs npm
	node -v


set-nvim-config:
	make install-neovim
	make install-node
	cp ./* ~/.config/nvim/ -r

