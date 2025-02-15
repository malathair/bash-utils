## About

This is a simple bash script to kill the no subscription notice when accessing Proxmox's web UI. It is a copy of John McLaren's Proxmox Subscription Notice popup remover: `https://mclarendatasystems.com/remove-proxmox51-subscription-notice/`

I've simply copied this because I use Proxmox frequently and it was easier to save a copy rather than needing to hunt it down every time. That and if the original source ever disappears, this copy will still exist (at least for as long as I need it)

## Installation

Run the following to install to your user's private bin:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/pve-nag-buster/install.sh | bash
```

or alternatively you can run this to install globally for all users:

```bash
curl https://raw.githubusercontent.com/malathair/cli-tools/main/pve-nag-buster/install.sh | sudo bash
```
