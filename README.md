# Nix Configuration

### Structure Explanation

- **All of the files used for the configuration are stored under the `/modules/` folder**
- **Most of the configuration is modularized inside of the `/modules/parts/` folder**
	- Inside of the `/modules/parts` folder are more folders to categorize the modules based on what system uses the parts
- **Inside of the `/modules/hosts` directory is where all of the system configurations are stored. These configuration files import select parts and also add some system-specific configs**
	- Inside of the `/modules/hosts` folder are the folders for each OS. The folders inside of the OS folders contain different types of configs (main, lightweight, etc.)
	- The reason for the parts system is to allow for modularity. I can have a part which contains my development apps, and one which contains games. Then depending on my specific config I can easily select development apps, games, or both
- **Inside of the `/modules/extras` folder are outputs such as packages which are not included in any configuration. Instead these are made to be ran using the nix commands**
	- Inside of the `/modules/extras` folder are folders which categorize the kind of outputs (packages, dev environments, etc)

### MacOS Manual Change Preferences

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