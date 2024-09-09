# ZetaFir: the Fitness Diet Plan Generator

Developed and deployed a cross-platform fitness app that generates personalized diet plans based on user metrics. This project integrates Firebase for secure account management, real-time updates, and notification services. The app achieved a **40% user retention rate** among beta users.

## Features
- **Personalized Diet Plans**: Based on user metrics like age, weight, and fitness goals.
- **Secure Account Management**: Firebase Authentication ensures user data security.
- **Real-time Database**: User data and metrics are stored using Firebase Firestore.
- **Push Notifications**: Integrated Firebase Cloud Messaging to notify users about updates.
- **Modern UI**: Intuitive and responsive design built using Flutter.

## Tech Stack
- **Frontend**: Flutter
- **Backend**: REST API
- **Database**: Firebase Firestore
- **Authentication**: Firebase Authentication
- **Notifications**: Firebase Cloud Messaging (FCM)

## Project Link
[GitHub Repository](https://github.com/theadityarawat/minor_sem6)

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/theadityarawat/minor_sem6.git
2. Install Flutter dependencies:
    ```bash
    flutter pub get
    ```
3. Set up Firebase for the project:
-Create a Firebase project and enable Firestore, Authentication, and Cloud Messaging.
-Download the google-services.json file and add it to your project.
4. Run the app:
    ```bash
    flutter run
    ```
## How it Works
1. Users sign up and provide their personal information.
2. Based on the user’s data, a diet plan is automatically generated.
3. Users can view, update their data, and receive personalized notifications.
