# Before initial run
Generate a new ssh key for the root user, add as a deploy key to sown/network

Then make sure you can run `ssh git@github.com`

It will add systemd-networkd configuration for the interfaces, so ensure there's no old netplan configuration left over.

You'll also want to ensure there's udev rules to set interface names based on MACs, so they don't reorder between reboots.

The BIRD and keepalived local configuration will be copied from ansible on the first run and then left to be locally maintained. After the first run, fill these in with the passwords (TODO we should move these to use ansible vault really). You can change the keepalived priorities to make the service active once it's ready.


## Vault Variables

The IP addresses of trusted users are stored in `vars/vault-nft.yml` in the following format:

```yml
gw_nftables_external_trusted:
  - contact_username: jbloggs
    contact_name: Joe Bloggs
    v4:
      - comment: home
        address: 192.0.2.4
    v6:
      - comment: Server
        address: 2001:db8::1234
```