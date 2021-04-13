# Notely

Notely is a mobile app for iOS and Android that allows students to take pictures of their notes and share them with others. An internet connection is required to use the app since it interfaces with a database.


## Information

Notely was built using Flutter 2.0.1 and Dart 2.12.0.
Notetly utilizes Google Firebase for its backend API.

Contributing Members
- Christian Anthony
- Julian Gombos
- Leah Mackay
- Sheev Patel
- Jacob Good

## Installation

Here are some resources that will be needed in order to run the app:

- [Flutter Download: Get Flutter here](https://flutter.dev/docs/get-started/install)
- [Flutter installation: Windows](https://flutter.dev/docs/get-started/install/windows)
- [Flutter installation: macOS](https://flutter.dev/docs/get-started/install/macos)
- [Andriod Studio: For emulation](https://developer.android.com/studio)
- [Visual Studio Code](https://code.visualstudio.com/)

## Setting up the emulator

- After Android Studio has been installed, the emulator needs to be setup.

- Open up Android Studio and navigate to "Tools -> AVD Manager".

  ![Image](https://github.com/WSU-4110/Notely/blob/master/Notely/pictures/toolsAVD.png)

- Once in AVD Manager, click on "Create Visual Device..." at the bottom left of the window.

  ![Image}(https://github.com/WSU-4110/Notely/blob/master/Notely/pictures/createVirtualDevice.PNG)

- In the Phone category, select "Pixel 2" and then click next.

- For the system image, select Release Name "R" which should have API Level 30.

- For "AVD Name", name it whatever you like and click finish. The emulator is now setup.

## Importing the project in Visual Studio Code (VS Code)

- Download the Notely source either by cloning or by downloading the .zip

- Once the source code has been downloaded, open VS Code and navigate to "File -> Open Folder...". Select the top most folder for the source code and open it.

- Navigate to "Terminal -> New Terminal" to open up a new terminal.

Run the following commands:
```
cd Notely
flutter pub get
```

- If the file structure can't be seen, at the very top left of VS Code, there is an icon that looks like two pages. When hovering over it will say "Explorer". Click on that to show the file structure.

## Running Notely

- In the file structure navigate to "Notely/lib/main.dart" and double click main.dart.

- At the very bottom right of VS Code it will say "No Device". Click on "No Device" and VS Code will prompt for a device.

- If you installed Android Studio properly, you should see an option to select "Start PIXEL 2 API 30" as a device.

- Once you select the device, you will see VS Code launch the device and the emulated device will show up.

- As long as main.dart is currently in focus, you will see a triangle play button at the top right of VS Code. Click the play button and select "Start Debugging".

- You will see VS Code launch the app and will build it. This can take a couple minutes so be patient. If it was successful, you will see the app automatically open in the emulator.

- The app is now ready to use. 


For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
