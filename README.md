# 📚 bookly_app - Clean Architecture

Simply Book Application build with Flutter Framework

## Getting Started

- This is a **Clean Architecture** based Flutter app that fetches book data from the Google Books API and displays it. It introduces **data caching** using Hive to store fetched book data for offline use.

- This app supports **infinite scrolling with pagination**, allowing users to load more books as they scroll.

## 📌 Data source

- Free Google Books API: https://www.googleapis.com/books/v1/

## 📂 Structure

- **Data Layer**: Handles network requests and local caching (Hive).
- **Domain Layer**: Contains business logic, entities, and use cases.
- **Presentation Layer**: Contains UI elements, ViewModels, and manages state via Cubit.

## 🛠️ Tech

- Flutter Framework
- Bloc (Cubit) – For state management
- Dio – For making HTTP requests and handling API responses
- Hive – For local caching
- dartz – For error handling
- get_it – For Dependency Injection
- url_launcher – for opening book preview link
- Clean Architecture

## 🔄 Want to see the other architecture?

Check out the other version of this app, implemented using Clean Architecture: [Book App - MVVM Architecture](https://github.com/Kerolos4555/book-app-mvvm.git)

## 📱 Screens

## 🚀 Splash Screen

![Image](https://github.com/user-attachments/assets/44e0af44-bc15-455b-a8b6-2ac181da0909)

## 🏠 Home Screen

![Image](https://github.com/user-attachments/assets/ee2316e6-7106-405d-be9e-854566b6f871)

![Image](https://github.com/user-attachments/assets/fd005786-655a-424a-9f0f-b54d5484b74d)

![Image](https://github.com/user-attachments/assets/74a3d82d-4f5e-41f3-99b2-0c3f0fb66120)

## 📄 Details Screen

![Image](https://github.com/user-attachments/assets/570c02ca-c2d7-4354-b9d8-7e01e6623242)

## 🔗 Book Preview

![Image](https://github.com/user-attachments/assets/233a2213-1c91-43a2-a1e0-311e70c04fa9)

![Image](https://github.com/user-attachments/assets/df6c8ba2-4613-4029-9ebd-83a550636fe6)

## 🔍 Search Screen

![Image](https://github.com/user-attachments/assets/da3e82ef-0ae5-490a-acae-bd471d698171)

![Image](https://github.com/user-attachments/assets/d6e44580-4d6f-451b-965a-feb0dbab5956)

![Image](https://github.com/user-attachments/assets/18e1b43c-cc2f-4ed6-97d1-52179c80d6d6)

![Image](https://github.com/user-attachments/assets/d20fa249-c8ed-4aae-9ebc-613499790a5b)
