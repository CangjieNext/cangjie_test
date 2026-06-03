

first go to xcode-settings-components to delete all arm-only simulator devices, then run following command to install universal simulator devices:

```bash
# first delete unavailable devices, in cache, because if there is any arm-only simulator devices left, installing universal device would fail with message 'no needed download'.
xcrun simctl delete unavailable
xcodebuild -downloadPlatform iOS -architectureVariant universal
```
when first use rosetta x64 ios simulator, needs to run this.

```bash
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```
