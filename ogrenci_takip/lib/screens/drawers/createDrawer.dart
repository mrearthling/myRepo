import 'package:flutter/material.dart';
class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Ana Sayfa',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profil',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.profile),
          ),

          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Etkinlikler',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.event),
          ),
          Divider(),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Bildirimler',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.notification),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'İletişim',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.contact),
          ),
          ListTile(
            title: Text('version: 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('images/bg_header.jpeg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Öğrenci Not Takip",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}
Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
class pageRoutes {
  static const String home = homePage.routeName;
  static const String contact = contactPage.routeName;
  static const String event = eventPage.routeName;
  static const String profile = profilePage.routeName;
  static const String notification = notificationPage.routeName;
}
class homePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text(" ")));
  }
}
class contactPage extends StatelessWidget {
  static const String routeName = '/contactPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("İletim Bilgilerim"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text("")));
  }
}
class eventPage extends StatelessWidget {
  static const String routeName = '/eventPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Etkinliklerim"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text("")));
  }
}
class notificationPage extends StatelessWidget {
  static const String routeName = '/notificationPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Bildirimler"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text("")));
  }
}
class profilePage extends StatelessWidget {
  static const String routeName = '/profilePage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Profilim"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text("")));
  }
}
