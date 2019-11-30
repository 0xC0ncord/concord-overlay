# 0xC0ncord's Gentoo Overlay

This Gentoo overlay contains experimental and potentially unstable packages that I use personally.

## Installation

This repository can be added manually or by using Layman.

### Layman

```
# layman -o https://raw.githubusercontent.com/0xC0ncord/concord-overlay/master/repositories.xml -f -a concord
```

### Manually

1. Clone this repository somewhere.

```
$ git clone https://github.com/0xC0ncord/concord-overlay.git
```

2. Create a new file called `concord.conf` in `/etc/portage/repos.conf` with the following content:
```
[concord]
location = /path/to/cloned/repository
```

3. Install the package(s) using Portage.
4. To update the overlay just run `git pull` in the cloned repository.

## Contributing

You can report any ebuild issues or feature requests in the [issue tracker](https://github.com/0xC0ncord/concord-overlay/issues).
