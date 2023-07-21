# SezilAkdogan_TurkcellCase

Welcome to Video Games App.
This app has been created using the rawg.io API and includes features for game searching, listing, and adding to favorites.

Project Tech Stack
-------------------------------------
. Language: Swift 5

. Xcode Version: 14.3.1

. Deployment Target: 16.4

. Design Pattern: VIPER

. Third Party Library: 
     Alamofire (The communication between the Network service and the app was established using Alamofire.)
     SDWebIMage
.Organized folder structure

.Modularity

.CoreData

.Custom views

.Storyboard Design

.Auto Layout

.UI Test Unit Test

Screens of the application
---------------------------------------
Internet connection is checked and the first page is entered.
The app utilizes the Splash monitor manager to perform internet queries. If there is no internet connection, the user cannot access the app and will receive a message saying "You are not connected to the internet."


First screen: 
TabBar used in the application, transitions to both the "Favorites" and "Home" pages are made possible.

The app displays the top three data entries as headers at the top, using the Page Control for navigation between these entries. Below, the remaining data is listed in a CollectionView. At the top of the screen, a SearchBar is used. When the user enters three or more letters into the SearchBar, filtering is initiated, and the data is listed accordingly.

When the user makes a selection from one of the lists, they can click on it to transition to the detail screen.

First screenshots
-----------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/ef94c805-0dc7-40bb-bb3c-bfb494011544" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/9ee4af5d-85e2-40e8-b2f4-e140ab9191d8)" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/831b81f0-3f6f-416b-9fdd-bdde408d0fa3" />

Second screen:
The detail screen displays the content of the data that was clicked on from the home screen. Additionally, there is a "Add to Favorites" button on this screen. When the button is clicked, the selected game is saved to CoreData as a favorite, and it will be listed on the Favorites screen. If desired, the user can remove it from the favorites list.

Second screenshots
------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/e403ad35-fcfc-4f01-99f0-821597792c61" />

Favourite screen: 
On the detail screen, when the user clicks the heart button located at the top right of the ImageView, the selected game is saved to CoreData, and it will be listed on this screen. When the user clicks on a saved game, it will lead to the game's detail page. However, if the game hasn't been added to favorites yet, the app will display a "No Result" view to the user.

Favourite screenshots
------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/9505e093-1945-4723-a359-3784ea42ef18" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/51c0fd85-8ada-441d-bd95-d15b0be25d74" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/9eaaa204-2812-45f4-9cdb-de0287b8b365" />

Gifs of screens
---------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_HW4/assets/111681902/bc6391b2-f60e-42e7-96e0-4450ec2d5220" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/e4ad7271-3875-48a4-a393-bcfc181d7a79" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/7c58128a-ebc6-489f-8577-37f26053f99d" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/44ff0b44-88d3-4b09-8d46-9005f42eec0b" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/d1a586d0-145c-4b03-b92c-c7bc5b09fccf" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/e5a641c9-c65b-42e6-a25b-2da43c102b70" />
