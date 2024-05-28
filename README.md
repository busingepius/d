
# d-gegabox

## Set up dynamic deep links android

- navigate to ```~/AppData/Local/Android/Sdk/platform-tools```
- then run the following line after modification
  - ```
      adb shell 'am start -a android.intent.action.VIEW \
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

#### To sign certificate
- Go to the Java bin directory and run the following codes
```
C:\Program Files\Java\jdk-21\bin
```

```
keytool -genkey -v -keystore <path-to-put-file/file_name.jks> -keyalg RSA -keysize
2048 -validity 10000 -alias preferred_name
```

To get SHA256:
```
./keytool -list -v -keystore "C:\Users\USER\IdeaProjects\D\reciped.jks"
```