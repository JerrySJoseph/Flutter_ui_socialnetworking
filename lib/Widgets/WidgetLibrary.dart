import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_socialnetworking/Configurations.dart';
import 'package:ui_socialnetworking/Models/EventModel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_socialnetworking/Models/User.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: AppConfigurations.BackgorundColor,
      leading: IconButton(
        padding: EdgeInsets.all(12),
        icon: Icon(Icons.menu),
      ),
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}

class EventSelector extends StatefulWidget {
  @override
  _EventSelectorState createState() => _EventSelectorState();
}

class _EventSelectorState extends State<EventSelector> {
  int selectecIndex = 0;
  List<String> selections = ['Featured', 'Recent', 'Latest'];
  List<EventModel> current = [];
  List<EventModel> events = [
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Featured',
        imageUrl: "https://image.flaticon.com/icons/svg/2659/2659991.svg"),
    EventModel(
        title: "The Walking Dead \n is it a Zombie \nattack?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Featured',
        imageUrl: "https://image.flaticon.com/icons/svg/742/742863.svg"),
    EventModel(
        title: "BRIGHT SIDE \n Got any amazing\n new Ideas?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Featured',
        imageUrl: "https://image.flaticon.com/icons/svg/1087/1087840.svg"),
    EventModel(
        title: "Spotify Event \n Another spotify?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Featured',
        imageUrl: "https://image.flaticon.com/icons/svg/725/725281.svg"),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Recent'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Recent'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Recent'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Recent'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Featured'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Latest'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Latest'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.SecondaryColor,
        Tag: 'Latest'),
    EventModel(
        title: "COVID-19 \n Should you care?",
        bg: AppConfigurations.PrimaryColor,
        Tag: 'Latest'),
  ];

  @override
  void initState() {
    current = fetchData(selections[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: selections.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectecIndex = index;
                    current = fetchData(selections[selectecIndex]);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                  child: Text(
                    selections[index],
                    style: TextStyle(
                        fontSize: 20,
                        color: selectecIndex == index
                            ? Colors.black87
                            : Colors.black26,
                        fontWeight: selectecIndex == index
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              );
            }),
      ),
      Container(
        height: 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: current.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: current[index].bg,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      current[index].imageUrl == null
                          ? "https://image.flaticon.com/icons/png/512/2760/2760147.png"
                          : current[index].imageUrl,
                      height: 120,
                      width: 120,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      current[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1.5),
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              );
            }),
      )
    ]);
  }

  List<EventModel> fetchData(String type) {
    List<EventModel> models = [];
    events.forEach((element) {
      if (element.Tag == type) models.add(element);
    });
    return models;
  }
}

class MainBottomNav extends StatefulWidget {
  @override
  _MainBottomNavState createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selected = index;
        });
      },
      currentIndex: selected,
      elevation: 0,
      backgroundColor: Colors.white,
      unselectedItemColor: AppConfigurations.IconColor,
      selectedItemColor: AppConfigurations.PrimaryColor,
      selectedFontSize: 20,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.dashboard),
            title: Text("Home",
                style: TextStyle(
                    fontWeight:
                        selected == 0 ? FontWeight.bold : FontWeight.normal))),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.add_circle_outline),
            title: Text(
              "Add",
              style: TextStyle(
                  fontWeight:
                      selected == 1 ? FontWeight.bold : FontWeight.normal),
            )),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.search),
            title: Text("Search",
                style: TextStyle(
                    fontWeight:
                        selected == 2 ? FontWeight.bold : FontWeight.normal))),
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.data_usage),
            title: Text("Profile",
                style: TextStyle(
                    fontWeight:
                        selected == 3 ? FontWeight.bold : FontWeight.normal)))
      ],
    );
  }
}

class UserSelector extends StatefulWidget {
  @override
  _UserSelectorState createState() => _UserSelectorState();
}

class _UserSelectorState extends State<UserSelector> {
  List<User> models = [
    User(imageurl: "assets/images/user1.jpg", name: "name1", isOnline: true),
    User(imageurl: "assets/images/user2.jpg", name: "name2", isOnline: true),
    User(imageurl: "assets/images/user3.jpg", name: "name3", isOnline: false),
    User(imageurl: "assets/images/user4.jpg", name: "name4", isOnline: true),
    User(imageurl: "assets/images/user5.jpg", name: "name5", isOnline: false),
    User(imageurl: "assets/images/user6.jpg", name: "name6", isOnline: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: models.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CircleAvatar(
                    radius: 53,
                    backgroundColor: models[index].isOnline
                        ? Colors.greenAccent
                        : AppConfigurations.SecondaryColor,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(models[index].imageurl),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: models[index].isOnline
                        ? Colors.greenAccent
                        : AppConfigurations.SecondaryColor,
                    radius: 5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
