import 'package:flutter/material.dart';
import '../main.dart';
import 'Constants.dart';
import '../Screens/CreatePlaylist.dart';
import 'Hover.dart';
import '../Screens/LikedSongs.dart';
import '../Screens/Search.dart';
import '../Screens/HomePage.dart';
import '../Screens/YourLibrary.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //navigation bar
        width: 240,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [KlightPurble, KdarkPurble]),
        ),
        child: Padding(
          //padding for navigation bar
          padding: EdgeInsets.all(30),
          child: Column(
            //all elements in navigation bar
            crossAxisAlignment: CrossAxisAlignment.center,
            //make column in center in x-axis
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Kblue, spreadRadius: 1)
                    ]),
                child: CircleAvatar(
                  //backgroundImage: Image.asset("assets/muzify.png"),
                  radius: 50,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'User name',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  // shadows:
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Hover(builder: (isHovered) {
                final color = isHovered ? Kblue : Kgray;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                      },
                    ),
                  ],
                );
              }),
// -----------------------------------------------------------------------------
              SizedBox(
                height: 10,
              ),
              Hover(
                builder: (isHovered) {
                  final color = isHovered ? Kblue : Kgray;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        size: 30,
                        color: color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Search()));
                        },
                      ),
                    ],
                  );
                },
              ),

// -----------------------------------------------------------------------------
              SizedBox(
                height: 10,
              ),
              Hover(builder: (isHovered) {
                final color = isHovered ? Kblue : Kgray;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.my_library_music_outlined,
                      size: 30,
                      color: color,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Your Library',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => YourLibrary()));
                      },
                    ),
                  ],
                );
              }),

// -----------------------------------------------------------------------------
              const SizedBox(
                height: 40,
              ),
              Hover(builder: (isHovered) {
                final color = isHovered ? Kblue : Kgray;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.library_add_outlined,
                      size: 30,
                      color: color,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Create Playlist',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const CreatePlaylist()));
                      },
                    ),
                  ],
                );
              }),
// -----------------------------------------------------------------------------
              const SizedBox(
                height: 10,
              ),
              Hover(builder: (isHovered) {
                final color = isHovered ? Kblue : Kgray;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: color,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: Text(
                        'Liked Songs',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => const LikedSongs()));
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
