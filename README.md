# Noorish
Noorish is a Flutter mobile application designed to assist Muslims in tracking their health and nutritional intake during the holy month of Ramadan. The app utilizes various APIs, including Alahdan, OpenFoodFacts, and Google's Machine Learning Toolkit subset for barcode scanning.

## Features
### 1. Day Page
<img width="200" alt="my screenshots 2024-03-18 at 12 30 15 PM" src="https://github.com/Zohaib-Kenny-Zakaria-Wilson/noorish_app/assets/121403508/7aae63e0-1239-4590-903b-433757e22b04">

Upon launching the app, users are greeted with the Day page.
The Day page displays essential information such as times for sunset and sunrise, helping users manage their fasting schedule effectively.
It includes a section that lists the meals planned for the day, aiding users in organizing their eating schedule.
The app calculates and updates the total calories and macronutrients consumed, providing users with insights into their nutritional intake.

### 2. Calendar Page
Users can navigate to the Calendar page by swiping left from the Day page.
The Calendar page presents a monthly view with 31 days, allowing users to visualize their fasting and eating patterns throughout Ramadan.
Users can click on any day in the calendar to access the Day page for that specific day, facilitating easy access to detailed information.

<img width="200" alt="my screenshots 2024-03-18 at 12 30 22 PM" src="https://github.com/Zohaib-Kenny-Zakaria-Wilson/noorish_app/assets/121403508/175934a8-a1b6-44c2-bbd9-9edaed3dfe28">


## Testing Environment
The app has been tested using an Android Pixel 3 emulator.
This testing environment ensures that the app functions smoothly and reliably across different devices and screen sizes.
APIs Used

### Alahdan API
Used to fetch information related to sunrise and sunset times, assisting users in scheduling their fasting and eating periods.
OpenFoodFacts API: Provides nutritional information for scanned ingredients, helping users make informed dietary choices.
### Google's Machine Learning Toolkit (Barcode Scanner Subset)
Utilized for barcode scanning functionality, enabling users to quickly retrieve nutritional information for scanned products.
### OpenFoodFacts API
Used to get nutritional information from about the scanned items. This information is then displayed to the user.
## Development Information
Framework: Flutter 
Programming Language: Dart

## How to Run the App
Clone the repository to your local machine.
Ensure that Flutter and the necessary dependencies are installed.
Connect an Android device or launch an Android emulator.
Run the app using the Flutter CLI command: flutter run.

## Contributors
Zohaib Shaikh
Zakaria Rab
Wilson Overfield
Kenny Morales
