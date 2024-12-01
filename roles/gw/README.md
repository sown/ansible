# Before initial run
It will add systemd-networkd configuration for the interfaces, so ensure there's no old netplan configuration left over. Bring up an interface on the SOWN VLAN manually in order to run ansible against the server first, then remove it afterwards.

You'll also want to ensure there's udev rules to set interface names based on MACs, so they don't reorder between reboots.

Once you're happy for the router to become active, you can change the keepalived priorities in `/etc/keepalived/local.conf` and reload keepalived.

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
