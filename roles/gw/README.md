# Before initial run
Generate a new ssh key for the root user, add as a deploy key to sown/network

Then make sure you can run `ssh git@github.com`

You'll also want to ensure there's udev rules to set interface names based on MACs, so they don't reorder between reboots.
