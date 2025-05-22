# Install Terraform
---------------------------------------

# Ubuntu/Debian

$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Install the HashiCorp GPG key.

$ wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null


# Verify the key's fingerprint.

$ gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint


# The gpg command will report the key fingerprint:

/usr/share/keyrings/hashicorp-archive-keyring.gpg
-------------------------------------------------
pub   rsa4096 XXXX-XX-XX [SC]
AAAA AAAA AAAA AAAA
uid           [ unknown] HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>
sub   rsa4096 XXXX-XX-XX [E]


$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list


# Download the package information from HashiCorp.

$ sudo apt update

# Install Terraform from the new repository.

$ sudo apt-get install terraform

# Verify the installation

$ terraform -help


# Usage: terraform [-version] [-help] <command> [args]

The available commands for execution are listed below.
The most common, useful commands are shown first, followed by
less common or more advanced commands. If you're just getting
started with Terraform, stick with the common commands. For the
other commands, please read the help and docs before usage.
##...


$ terraform -help plan


# Enable tab completion

touch ~/.bashrc

# Then install the autocomplete package.

terraform -install-autocomplete







