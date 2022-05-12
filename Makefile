install-node:
	sudo apt install -y nodejs npm
	sudo npm install -g n
	sudo n stable
	sudo apt purge -y nodejs npm
	node -v

set-nvim-config:
	cp -r ./* ~/.config/nvim/

