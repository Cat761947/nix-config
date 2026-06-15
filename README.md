# Nix Configuration

## Configuration Information

### Folder Structure Info

- `/modules` holds all of the .nix files which are imported by the main flake.nix
- `/modules/parts` contains pieces of the configuration. Some or all of these parts are then imported by the main host configurations
- `/modules/hosts` contains the main configs for the hosts. These files specify some system-specific setting and import reusable pieces of configuration from the `/modules/parts` directory
- `/modules/extras` contains files which are not used by any configurations, but are still imported by the main flake.nix. One current use of this folder is to hold the packages needed to setup a fresh host

### Module Naming Info

- `homeModules.<name>` is a regular home-manager module
- `homeModules.<name>-config` is used for home-manager modules which configure a package. The `-config` version applies the configuration without installing the package. This is useful for when installed packages are managed system-wide instead of on a per-user basis
	- Some `-config` variants output the exact same thing as the non `-config` counterpart. This is intended behavior for any applications which cannot be configured without also installing it via home-manager. The `-config` is still specified to make writing the host configurations not require checking of each home-manager module to see if it has a `-config` variant
	- Some `-config` modules do not have a non-config variant. This is the case when it is impossible for home-manager to install the application, such as for applications only available via homebrew
- `modules.darwin.<name>` is a regular nix-darwin modules
- `modules.darwin.host-<config-name>-<name>` are nix-darwin modules located inside of the `/modules/host/darwin/<config-name>` directory are are not to be used for other configs

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

- **Volume Control** (https://addons.mozilla.org/en-US/firefox/addon/volume-control-boost-volume/)

### uBlock Origin Settings

- **Settings**
	- **(Enable)** *I am an advanced user*

- **My Rules**
	- **(+)** `* * 3p-script block`
	- **(+)** `* * 3p-frame block`
	- **(+)** `youtube.com * 3p-script noop`

- **My Filters**
	- **(+)** `youtube.com##.ytd-rich-section-renderer.style-scope`
	- **(+)** `youtube.com##ytd-reel-shelf-renderer.ytd-item-section-renderer.style-scope`
	- **(+)** `youtube.com##grid-shelf-view-model.ytGridShelfViewModelHostHasBottomButton.ytd-item-section-renderer.ytGridShelfViewModelHost`
