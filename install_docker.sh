# For ubuntu 20.04

echo ">> Start to install Docker"

# remove previous installed versions
echo ">> Remove old versions"
sudo apt-get remove docker docker-engine docker.io containerd runc

# set repository
echo ">> Update repository"
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release

# register GPG key for Docker
echo ">> Register GPG key"
sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# register stable repository
echo ">> Register stable repository"
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install docker engine
echo ">> Install recent docker engine"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Check docker version
docker --version

# add user to docker group
sudo usermod -aG docker $(whoami)

# docker login
docker login -u $1
