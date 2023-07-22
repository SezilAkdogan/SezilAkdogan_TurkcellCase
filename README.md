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

Internet connection - Launch Screen
---------------------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/19733cbb-57da-4e97-96de-7dad5ecf0e89" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/149381eb-dc40-4fc0-9ffb-fe3fab38c8c3" /> 

First screen: 
TabBar used in the application, transitions to both the "Favorites" and "Home" pages are made possible.

The app displays the top three data entries as headers at the top, using the Page Control for navigation between these entries. Below, the remaining data is listed in a CollectionView. At the top of the screen, a SearchBar is used. When the user enters three or more letters into the SearchBar, filtering is initiated, and the data is listed accordingly.

When the user makes a selection from one of the lists, they can click on it to transition to the detail screen.

First screenshots
-----------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/3629ef3c-3783-410c-b63d-d4f222e5c487" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/cfdc708f-808a-4649-9c46-a1e5807a2165" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/877698c2-bf7c-4600-9a2d-fbf4e68d9970" />

Second screen:
The detail screen displays the content of the data that was clicked on from the home screen. Additionally, there is a "Add to Favorites" button on this screen. When the button is clicked, the selected game is saved to CoreData as a favorite, and it will be listed on the Favorites screen. If desired, the user can remove it from the favorites list.

Second screenshots
------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/0f07253a-d510-4ed4-bb0f-073f69e1d608" />

Favourite screen: 
On the detail screen, when the user clicks the heart button located at the top right of the ImageView, the selected game is saved to CoreData, and it will be listed on this screen. When the user clicks on a saved game, it will lead to the game's detail page. However, if the game hasn't been added to favorites yet, the app will display a "No Result" view to the user.

Favourite screenshots
------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/fff18c12-8d94-4724-aeea-b56945fe0228" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/0421ba47-9d2e-4b92-adc2-27be059b01f4" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/4720a72f-6bf0-4f8a-9f48-ba499184bc92" />

Gifs of screens
---------------------------
<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_HW4/assets/111681902/bc6391b2-f60e-42e7-96e0-4450ec2d5220" />

<img width="200" height="450" alt="color picker" src="https://github.com/SezilAkdogan/SezilAkdogan_TurkcellCase/assets/111681902/2bab0e51-20eb-41e0-888d-cbe3be5fd111" />
