# initial system management
sudo apt autoremove
sudo apt-get update

# utils
sudo apt-get install adb htop git neofetch python3-dev python3-venv

# thunderbird
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa -y
sudo apt-get install thunderbird

# nvidia drivers
ubuntu-drivers autoinstall

# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt-get install docker-ce
# add docker user to sudoers
sudo usermod -aG docker ${USER}
su - ${USER}

# nvidia docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# docker-compose
# check https://github.com/docker/compose/releases for the latest release!
# 1.25.4 as of 2020-04-05
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.4/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# obs
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio -y
sudo apt-get update

# spotify
# ad muter: https://github.com/SecUpwN/Spotify-AdKiller
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# vscodium
# open source vscode without telemetry
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add - 
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list 
sudo apt update && sudo apt install codium 
codium --install-extension ms-python.python
codium --install-extension ms-vscode-remote.vscode-remote-extensionpack


# redshift
sudo apt-get install redshift redshift-gtk
echo '
[redshift]
allowed=true
system=false
users=' | sudo tee -a /etc/geoclue/geoclue.conf