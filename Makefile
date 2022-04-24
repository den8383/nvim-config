install-node:
	sudo apt install -y nodejs npm
	sudo npm install n -g
	sudo n stable
	sudo apt purge -y nodejs npm
	node -v

set-nvim-config:
	make install-node
	cp ./* ~/.config/nvim/ -r

