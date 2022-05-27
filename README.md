

<h1 align="center">Book Store</h1>

---

<h2>Topics 📋</h2>

   <p>

   - [📖 About](#-about)
   - [📖 Preview](#-preview)
   - [🛠️ Features and Technologies](#%EF%B8%8F-features-and-technologies)
   - [🤔 How to use](#-how-to-use)
 
   </p>

---

<h2>📖 About</h2>

<p>
    This was the project developed to solve the following challenge:<br>
    * Rest API (https://developers.google.com/books/docs/v1/getting_started#REST) <br>
    * Example API Call:<br>
    https://www.googleapis.com/books/v1/volumes?q=flutter&maxResults=20&startIndex=0 <br>
    - Using google’s api for books, the app should fetch and display the Thumbnail of a few books at a time and load more as the user scrolls through the list.<br>
    - When the user clicks on one of the books, the app should present a detailed view displaying the most relevant information of the book: Title, Author, Description and, if available, a Buy link.<br>
    - In the detail view, the user can also favorite or unfavorite a book. This option should be stored locally so it persists through each app usage.<br>
    - Clicking on the Buy link should open the link on the web navigator.<br>
</p>

---

<h2>📱 Preview</h2>

   <p align="center">
      <img src="assets\images\home_preview.png" width="200" alt="Home Preview"/>
      <img src="assets\images\detail_preview.png" width="200" alt="Detail Preview"/>
      <img src="assets\images\bd_preview_1.png" width="200" alt="BD Preview 1"/>
      <img src="assets\images\test_preview.png" width="200" alt="BD Preview 1"/>
   </p>
   

---

<h2>🛠️ Features and Technologies</h2>

* Connection and Tools<br>
    - Google Books API.<br>
    - Package "HTTP".<br>
    - Postman Collections: Development and Testing API.<br>

* Dependencies and State Management<br>
    - Provider as a dependency injector.<br>
    - ChangeNotifier as state management.<br>
    - Package "url_lancher" to launch links to web navigator.<br>
    - Package "json_annotation" and "json_serializable" to generate Json serialization.<br>
    - Package "buil_runner" to help Json packages serialization.<br>
    - Package "sqflite_common_ffi" to create tests for "sqflite".<br>

* Data persistence<br>
    - SQFlite as local database.<br>
    - Save and remove favorites list, based on user.<br>
    - Package "path" to get the creation path according to the operating system.<br>

* Screens<br>
    - Splash.<br>
    - Home page.<br>
      - With pagination system.<br>
    - Book details page<br>
  
 </p>

---

<h2>🤔 How to use</h2>

   ```
   Configure the development environment on your machine:
   https://flutter.dev/docs/get-started/install

   - Clone the repository:
   $ git clone https://github.com/DevLSerrano/bookstore_leonardoserrano bookstore_leonardoserrano

   - Enter the directory:
   $ cd bookstore_leonardoserrano

   - Install dependencies:
   $ flutter pub get
   
   - Run OR run the "auto_generate_dart.sh" file:
   $ flutter packages pub run build_runner build --delete-conflicting-outputs
   
   - Run:
   $ flutter run
   ```

---

 
