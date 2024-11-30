# SOWN Ansible

This is the ansible playbook for SOWN.

It contains a number of roles and applies them to hosts according to information from our
Netbox server.

## Usage

### Cloning the repo

You need to include submodules to get monitoring scripts as well:
```console
$ git clone --recurse-submodules git@github.com:sown/ansible.git
Cloning into 'ansible'...
...
```

### Installing Dependencies

You must install the exact version of ansible we are using.

The easiest way to do this is using [poetry](https://python-poetry.org/docs/#installing-with-pipx)

Poetry 1.8 or later is required.

```console
poetry install
```

### Netbox setup

You'll need a netbox token stored in the `NETBOX_TOKEN` environment variable.
For example, `echo "export NETBOX_TOKEN=abcd" >> ~/.bashrc; chmod 600 ~/.bashrc`

You can create one through the Netbox admin interface, or steal one from `/home/tim/.bashrc` if you have root on auth2.

### Ansible Vault setup

We store some secret values using `ansible-vault`, which encrypts files using a symmetric key and will decrypt them during a playbook run. You will need the vault password to execute the playbook.

The vault password is retrieved by ansible by executing `etc/vault_secret.sh`, which will either:

- prompt you for the vault password
- execute `vault_secret.local.sh`
  - You can use this to retrieve the password from a file on a login server, or from your password manager if developing locally

### Running everything

This will run everything, but won't make changes, and print a full diffs of changes that would be made.
```console
$ poetry shell
$ ansible-playbook config.yml --diff --check
```
Remove `--check` to actually make changes.

### Running against a single host

```console
$ ansible-playbook config.yml --diff --check --limit VMS
```
You can run this (without `--check`) against a new host to set it up with standard SOWN configuration.

### Running a single role via tags

It can take a while to run everything, so you can selectively run parts of our ansible configuration via tags. See the documentation below for tags you can use.

```console
$ ansible-playbook config.yml --diff --check --tags pxe
```

## Working on roles

New roles should be developed on branches, and changes rolled out to all servers before merging to master. Therefore, master should be kept in a state where the main playbook can be run, without making changes to servers.

## Tags

- `common`
  - `sown_common`
    - `utilities`
    - `motd`
    - `ssh_gateway_auth`
  - `monitored`
    - `nrpe`
  - `cron_mail_redirect`
  - `unattended_upgrades`
- `pxe`
  - `dnsmasq`
  - `ipxe`
- `backed_up`
- `ssh_gateway`
- `docker`
- `containers_dev`
- `containers_prod`
