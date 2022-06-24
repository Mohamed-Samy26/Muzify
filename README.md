# Muzify

<p align="center">
<br>
<img src="https://user-images.githubusercontent.com/79057189/175548749-db148894-772d-4a09-abf5-31e0211d700c.png" >
<br>
</p>

A `Flutter` based cross-platform music player which is also capable of searching for music, Downloading them locally and playing them offline using it's `python` - `flask` backend running `YTdown` package.

## Getting started

* Main feature of this application is ability to search and download music from youtube to local storage
* The most viewed matching search result is automatically downloaded

<p align="center">
<br>
<img src="screenshots/1.png" alt="img" height=600>
<br>
</p>
<p align="center">
<br>
<br>
<img src="screenshots/4.png" alt="img" height=600>
<br>
</p>

### Log in and Register 

* Muzify uses a `SQLflite` based database to store per-user data locally and enable offline access
* Users can login to a previously created account , create a new account or continue as a guest


<p align="center">
<br>
<img src="screenshots/LOGIN.jpg" alt="img" height=600>
<img src="screenshots/login1.jpg" alt="img" height=600>
<br>
</p>


### Home page

* Landing home page where user can play music, the view contains basic intuitive user-friendly widgets to control the playback including pause/play , stop and a seek bar

<p align="center">
<br>
<img src="screenshots/play.jpg" alt="img" height=600>
<br>
</p>

### Side action menu

* The side action menu makes it easy to navigate through the app and access rest of the features and uses `provider package` to share data between different views

<p align="center">
 <br>
  <img src="screenshots/menu.jpg" alt="img" height=600>
 <br>
</p>

### Music Library

* Music library menu automatically searches the phone storage for any locally downloaded audio files and lists them in the view to play them

<p align="center">
 <br>
  <img src="screenshots/elist.jpg" alt="img" height=600 margin =50>
  <img src="screenshots/list.jpg" alt="img" height=600>
 <br>
</p>


