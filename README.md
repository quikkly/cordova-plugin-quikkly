
A cordova plugin for the Quikkly IOS and Android SDK's. The main purpose of this is to underpin an Ionic plugin. This allows Ionic developers launch the Quikkly scanner from their app.

### Installation ###

To add this to your ionic app use the following
```sh
ionic cordova add cordova-plugin-quikkly
```

We also recommend the `ionic-quikkly-plugin` wrapper.

---

Alternatively to add to your cordova app use the following
```sh
cordova add cordova-plugin-quikkly
```

### Updates ###

Please read [RELEASENOTES.md]() for details

Need to build and ionic native wrapper for the cordova plugin to surface the functionality as a component that can be easily integrated.

### Usage ###

#### openScanner ####
This will launch the native scanner, an array of tag indentifiers scanned by the user is returned

```javascript
    cordova.plugins.quikkly.openScanner();
```