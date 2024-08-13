# Social Posts App

## Description

Welcome to the **Social Posts App**! This application is designed to fetch posts from an API and display their details along with the respective comments.

### Features
- **Fetch Posts**: Retrieve a list of posts from a remote API.
- **Post Details**: View detailed information for each post.
- **Comments Section**: Access and display comments related to each post.
- **Like Functionality**: Users can like posts directly from the post list or the post detail page. The like status is displayed on both pages, providing a seamless user experience.

### Packages Used
The following packages have been integrated into the app to streamline development and improve performance:

- [**riverpod**](https://pub.dev/packages/riverpod): A popular state management solution that provides a simple and efficient way to manage the app's state.
- [**riverpod_generator**](https://pub.dev/packages/riverpod_generator): A code generator for Riverpod that simplifies the creation of providers and enhances type safety.
- [**build_runner**](https://pub.dev/packages/build_runner): An auxiliary tool used in this project for the generation of Riverpod providers, facilitating code generation and improving development efficiency.
- [**http**](https://pub.dev/packages/http): A powerful package for making HTTP requests, essential for fetching data from the API.
- [**mockito**](https://pub.dev/packages/mockito): A library for creating mock objects in Dart, useful for testing.
- [**JSONPlaceholder**](https://jsonplaceholder.typicode.com/): The app utilizes the **JSONPlaceholder** service to call the posts and comments endpoints.

### Getting Started

To run the Social Posts App on your device, follow these steps:

1.  **Clone the Repository**:
        
    ```bash
    git clone <repository-url>
    
    ```
    
2.  **Navigate to the Project Directory**:
        
    ```bash
    cd social_posts
    
    ```
    
3.  **Install Dependencies**:
        
    ```bash
    flutter pub get
    
    ```
    
4.  **Run the App**:
    
    ```bash
    flutter run
    
    ```
    

### Conclusion

The  **Social  Posts App** is a simple yet powerful application that demonstrates how to fetch and display data using Flutter and its ecosystem. With the added **like functionality**, users can interact with posts more effectively