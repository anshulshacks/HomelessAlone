import 'package:HomelessAlone/screens/create_request.dart';
import 'package:flutter/material.dart';
import 'package:HomelessAlone/screens/find_request.dart';

class DrawerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text(
              'Find a Request',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                FindRequest.routeName,
              );
            },
          ),
          ListTile(
            title: Text('Create Request',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(
                CreateScreen.routeName,
              );
            },
          ),
           ListTile(
            title: Text('Logout',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(
                CreateScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
