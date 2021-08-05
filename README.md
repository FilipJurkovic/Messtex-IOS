# Messtex

Messtex is a native IOS and Android application developed for the puprose of automatic and easy-to-use reading of utility meters.
For the OCR we are using Pixolous SDK that requires setup before running the code.

## Pixolous SDK Setup

To run the app you have to take these steps:
  * Download the version 3.5.2 from (https://www.magentacloud.de/lnk/teMgNbDV)
  * From the "File" menu in XCode, select the "Add Files to [Project]…" command
  * Navigate to ~/pixometer-sdk-3.5.2-4439-evaluation/ios
  * choose the "MeterReading.framework" file. (You can also use drag and drop from    the Finder to add the framework.)
  * Ensure that the "Copy items if needed" is enabled and that the framework is added to the app target. (You may need to click the "Options" button in the file chooser dialog first in order to access this setting.)
  * Click "OK".
  * In the "Project navigator" on the left, select the project.
  * In the Editor area, select the app target from the "Targets" section of the list and go to the "General" tab.
  * In the "Linked Frameworks and Libraries" section, click on the "+" button.
  * Add the "libc++.tbd" library.


