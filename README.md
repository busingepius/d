# d-gegabox

## Set up dynamic deep links android

- navigate to ```~/AppData/Local/Android/Sdk/platform-tools```
- then run the following line after modification
- ```adb shell 'am start -a android.intent.action.VIEW \
    -c android.intent.category.BROWSABLE \
    -d "http://<web-domain>/details"' \
    <package name>
  ```
  that is 
```js 
 ./adb shell 'am start -a android.intent.action.VIEW \
    -c android.intent.category.BROWSABLE \
    -d "https://gegabox.ug/home"' \ com.gegabox.gegabox
```