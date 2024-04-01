# 0xC0ncord's Gentoo Overlay

This is my personal Gentoo overlay. Some of these packages are experimental and/or potentially unstable, however I do try to keep them relatively useable for public consumption.

## Installation

This repository can be added manually or by using eselect-repository or layman.

### eselect-repository

```
# eselect repository add concord git https://github.com/0xC0ncord/concord-overlay.git
```

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
