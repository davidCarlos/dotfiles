# Meus arquivos de configuração :pencil: :blue_heart:

Esse repositório versiona arquivos de configuração das diferentes ferramentas que utilizo no dia a dia de trabalho.
A configuração do ambiente de trabalho foi automatizada com a ferramenta [Ansible](https://docs.ansible.com/ansible). 

## Permissão de root

O comando do Ansible que configura o ambiente precisa de permissão de root no sistema operacional para conseguir
instalar pacotes e instalar diretórios. Garanta que no arquivo `/etc/sudoers` existe a sefguinte linha para o
usuário que irá executar o script:

    seuusername     ALL=(ALL)       ALL

## Configurando o ambiente

Para instalar a ferramenta Ansible, execute o script `install.sh`. Ele irá criar um virtualenv do Python 
no diretório `.venv` e instalar o pacote `ansible-core`.  Uma vez que o script finalizar, você pode executar os 
playbooks do Ansible com o comando:

        ansible-playbook -i inventory.yml base.yml nvim.yml

## base.yml

O playbook `base.yml` instala os seguintes pacotes:

- python3-libdnf5
- git
- curl
- tmux
- htop

## nvim.yml

O playbook `nvim.yml` instala o neovim e move os arquivos de configuração para o diretório
`~/.local/nvim/`.
