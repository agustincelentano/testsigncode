whoami
filenameunsigned="$(ls | grep "AnypointStudio-for-macosx.*.zip")" 
filename="${filenameunsigned/-unsigned/}"
unzip $filenameunsigned
codesign --force --keychain login.keychain --verify --verbose --sign "Developer ID Application: MULESOFT, INC. (A693696YG9)" AnypointStudio.app
spctl -a -t execute --verbose=4 AnypointStudio.app
zip -r -X $filename AnypointStudio.app
rm -r AnypointStudio.app