# Lattice-Connect DAppNode package

[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.dappnode/#/installer/lattice-connect.public.dappnode.eth)


[![Grid Plus github](https://img.shields.io/badge/GithubRepo-blue.svg)](https://github.com/gridplus/lattice-connect)

Lattice Connect lets you host your own server for managing your Lattice1's connections.


You can use this package without installing it in your DAppNode following these instructions:

## Prerequisites

- git

  Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) commandline tool.

- docker

  Install [docker](https://docs.docker.com/engine/installation). The community edition (docker-ce) will work. In Linux make sure you grant permissions to the current user to use docker by adding current user to docker group, `sudo usermod -aG docker $USER`. Once you update the users group, exit from the current terminal and open a new one to make effect.

- docker-compose

  Install [docker-compose](https://docs.docker.com/compose/install)

**Note**: Make sure you can run `git`, `docker ps`, `docker-compose` without any issue and without sudo command.


## Buidling

`docker-compose build`

## Running

### Start

`docker-compose up -d`

### View logs

`docker-compose logs -f`

### Stop

`docker-compose down`

You can edit the `docker-compose.yml` and add extra options


## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
