# Nix Configuration

## Repo Mirrors

- **Codeberg** _\<Main Repo\>_ (<https://codeberg.org/Cat_761947/nix-config>)
- **GitHub** _\<Live Mirror Repo\>_ (<https://github.com/Cat761947/nix-config>)
- **GitLab** _\<Daily Mirror Repo\>_ (<https://gitlab.com/Cat_761947/nix-config>)

## Configuration Information

### Folder Structure Info

- `/modules` contains all the modules imported by `flake.nix`
- `/modules/hosts` contains the host configurations
- `/modules/packages` contains all the wrapped packages
  - Wrapped packages are packages which have the
    configuration file(s) embedded in the application by
    making the main executable a shell script which applies flags and
    environment variables to the application before launching the executable.
    These flags and environment variables are usually used to
    set configuration values, or to point to a
    configuration file stored inside of the
    same nix store folder where the application is stored
- `/modules/bundles` contain wrapped packages which also have
  many other packages bundled with the application
  - These are usually used to create fully configured
    shell/terminal environments which are fully self contained
- `/modules/configs` contains general configurations importable by other modules
  - An example would be a file which adds the options for XDG Directories,
    or which adds the basic configuration for home-manager integration
- `/modules/features` contains configurations importable by
  host configurations which add features to the system
  - An example would be a file which installs a set of packages
- `/modules/extras` contains modules which are imported by `flake.nix`,
  but are not used by any host configurations
  - An example would be the home-manager package,
    which is not installed during the first configuration rebuild

### Module Naming Info

- `feature-<name>` are modules stored under `/modules/features`
- `config-<name>` are modules stored under `/modules/configs`
- `host-<host-config-name>-<name>` are module stored under `/modules/hosts`.
  These modules should only be used by the host specified by the `<host-config-name>`

### Bundle Naming Info

- `terminal-<terminal-type>-<name>` are wrapped terminal emulators bundled
  with other packages. The terminal emulator used is specified by the `<terminal-type>`
  - Usually these bundles will run a bundled shell. If this is the case,
    the terminals colour scheme will be taken from the shell bundle
- `shell-<shell-type>-<name>` are wrapped shells bundled with other packages.
  The shell used is specified by the `<shell-type>`

## Manually Changed Settings

### MacOS Settings

#### Battery

- Charge Limit `80%`
- Slightly dim the display on battery `Off`

#### Login Items & Extensions

- `LinearMouse.app`
- `realTimeSync.sh`
- `Rectangle.app`
- `Tuta Mail.app`

#### Desktop & Dock

- Default web browser `LibreWolf.app`

#### Displays

- Resolution `More Space`
- Automatically adjust brightness `Off`

#### Menu Bar

- Recent documents, applications, and servers `None`
- Spotlight `Off`

#### Wallpaper

- Wallpaper `Ventura`
- Screen Saver `Automatic`
- Start Screen Saver `1 minute`
- Show large clock `On Screen Saver and Lock Screen`

#### Notifications

- Show notifications when display is sleeping `On`
- App Notification Settings

#### Lock Screen

- Turn display off on batter when inactive `5 minutes`
- Turn display off on power adapter when inactive `10 minutes`
- Require password after screen saver begins `Immediately`

#### Keyboard

- Turn keyboard backlight off after inactivity `5 minutes`
- Keyboard Shortcuts
- Keyboard Layout `Colemak DH ANSI`
- Text Replacements `None`

#### Finder

- Sidebar Items

### LibreWolf Extensions

- **uBlock Origin** (<https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/>)
- **CanvasBlocker** (<https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/>)
- **Bitwarden** (<https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/>)
- **SponsorBlock** (<https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/>)
- **Volume Control** (<https://addons.mozilla.org/en-US/firefox/addon/volume-control-boost-volume/>)
- **Video Speed Controller** (<https://addons.mozilla.org/en-US/firefox/addon/videospeed/>)

### uBlock Origin Settings

- **Settings**
  - I am an advanced user `Enable`

- **My Rules**
  - **(+)** `* * 3p-script block`
  - **(+)** `* * 3p-frame block`
  - **(+)** `youtube.com * 3p-script noop`
  - **(+)** `github.com * 3p-script noop`

- **My Filters**
  - **(+)** `youtube.com##.ytd-rich-section-renderer.style-scope`
  - **(+)** `youtube.com##ytd-reel-shelf-renderer.ytd-item-section-renderer.style-scope`
  - **(+)** `youtube.com##grid-shelf-view-model.ytGridShelfViewModelHostHasBottomButton.ytd-item-section-renderer.ytGridShelfViewModelHost`
