# Nix Configuration

## Configuration Information

### Folder Structure Info

- `/modules` holds all of the .nix files which are imported by the main flake.nix
- `/modules/packages` holds all the wrapped packages (packages which have their config pre-installed). All of these are automatically made available to run externally, and may also be imported by other configuration files as regular packages
- `/modules/configs` contains pieces of general configuration. This includes stuff such as the nix-darwin homebrew configuration
- `/modules/features` contains pieces of configuration which add features to the system. This includes stuff such as packages and application configurations
- `/modules/hosts` contains the main configs for the hosts. These files specify some system-specific setting and import reusable pieces of configuration from the `/modules/configs` and `/modules/features` directory
- `/modules/extras` contains files which are not used by any configurations, but are still imported by the main flake.nix. One current use of this folder is to hold the packages needed to setup a fresh host
- `/other` contains other files and folders which are manually copied over

### Module Naming Info

- `feature-<name>` is a module which adds a feature and is located in `/modules/features`
- `config-<name>` is a module which contains general configurations and is located in `/modules/configs`
- `feature-<name>-noinstall` is a regular home-manager feature which configures an installed application, but attempts to prevent the package from being installed via home-manager. This is used when a different system, such as nix-darwin, manages installed packages
	- There will always be a `-noinstall` variant of any home-manager application configuration, even if you cannot disable the installation of that package via home manager. This is to simplify the writing of the host configurations
	- Some applications which are configured via a home-manager feature cannot be installed via home-manager. These modules will only have a `-noinstall` variant
- `host-<config-identifier>-<name>` is a module which is located inside of `/modules/hosts`. These files, unlike other modules, are only meant to be imported by the specific hosts config identified by the `<config-identifier>` in the modules name

## Manually Changed Settings

### MacOS Settings

**Battery**
- Charge Limit (80%)
- Slightly dim the display on battery (Off)

**Login Items & Extensions**
- LinearMouse.app
- realTimeSync.sh
- Rectangle.app
- Tuta Mail.app

**Desktop & Dock**
- Default web browser (LibreWolf.app)

**Displays**
- Resolution (More Space)
- Automatically adjust brightness (Off)

**Menu Bar**
- Recent documents, applications, and servers (None)
- Spotlight (Off)

**Wallpaper**
- Wallpaper (Ventura)
- Screen Saver (Automatic)
- Start Screen Saver (1 minute)
- Show large clock (On Screen Saver and Lock Screen)

**Notifications**
- Show notifications when display is sleeping (On)
- App Notification Settings

**Sound**
- Play sound on startup (Off)

**Lock Screen**
- Turn display off on batter when inactive (5 minutes)
- Turn display off on power adapter when inactive (10 minutes)
- Require password after screen saver begins (Immediately)

**Keyboard**
- Turn keyboard backlight off after inactivity (5 minutes)
- Keyboard Shortcuts
- Text Replacements (None)

**Finder**
- Sidebar Items

### LibreWolf Extensions

- **uBlock Origin** (https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- **CanvasBlocker** (https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/)
- **Bitwarden** (https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
- **SponsorBlock** (https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
- **Volume Control** (https://addons.mozilla.org/en-US/firefox/addon/volume-control-boost-volume/)
- **Video Speed Controller** (https://addons.mozilla.org/en-US/firefox/addon/videospeed/)

### uBlock Origin Settings

- **Settings**
	- **(Enable)** *I am an advanced user*

- **My Rules**
	- **(+)** `* * 3p-script block`
	- **(+)** `* * 3p-frame block`
	- **(+)** `youtube.com * 3p-script noop`
	- **(+)** `github.com * 3p-script noop`

- **My Filters**
	- **(+)** `youtube.com##.ytd-rich-section-renderer.style-scope`
	- **(+)** `youtube.com##ytd-reel-shelf-renderer.ytd-item-section-renderer.style-scope`
	- **(+)** `youtube.com##grid-shelf-view-model.ytGridShelfViewModelHostHasBottomButton.ytd-item-section-renderer.ytGridShelfViewModelHost`
