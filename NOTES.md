# Notes on automating the macOS install via key commands

## Disk formatting

We're doing the HFS+J format for the initial creation because it's simpler than manually setting up the APFS volumes.

A command like this: `diskutil apfs create disk0 'Macintosh HD'` works to create the initial destination volume, however at the end of the install setup this fails at the point where it attempts to create the Preboot volume.

## Install monitoring

The iOS-style black window showing only a progress bar is kind of boring. If you want to see the detailed log, you can get back to the "classic" Install Assistant view using the following key combo: Cmd+Option+Ctrl+Shift+W. From here, you can open the Log progress window using the Window -> Log menu item. It's important to know that with this window open, the installer will not automatically restart the system when it is complete.

## Package creation

`startosinstall --installpackage` can be specified multiple times, however, this functionality was [broken by Apple for a long time](https://managingosx.wordpress.com/2017/11/17/customized-high-sierra-install-issues-and-workarounds/).
