import 'package:HomelessAlone/screens/more_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:HomelessAlone/widgets/drawer.dart';

enum FilterOptions { All, Food, Housing, Other }

class FindRequest extends StatefulWidget {
  static const routeName = '/find-request';

  @override
  _FindRequestState createState() => _FindRequestState();
}

class _FindRequestState extends State<FindRequest> {

  var chosenStream = Firestore.instance.collection('requests').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSection(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
              onSelected: (FilterOptions selectedOption) {
                if (selectedOption == FilterOptions.Food) {
                  chosenStream = Firestore.instance.collection('requests').where('food', isEqualTo: true).snapshots();
                }
                if (selectedOption == FilterOptions.Housing) {
                  chosenStream = Firestore.instance.collection('requests').where('house', isEqualTo: true).snapshots();
                }
                if (selectedOption == FilterOptions.Other) {
                  chosenStream = Firestore.instance.collection('requests').where('other', isEqualTo: true).snapshots();
                }
                if (selectedOption == FilterOptions.All) {
                  chosenStream = Firestore.instance.collection('requests').snapshots();
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
                PopupMenuItem(
                  child: Text('Only Food'),
                  value: FilterOptions.Food,
                ),
                PopupMenuItem(
                  child: Text('Only Housing'),
                  value: FilterOptions.Housing,
                ),
                PopupMenuItem(
                  child: Text('Only Other'),
                  value: FilterOptions.Other,
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Find Requests',
                style: TextStyle(
                  fontFamily: 'Source Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: chosenStream,
                builder: (ctx, streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final documents = streamSnapshot.data.documents;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (ctx, index) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: InkWell(
                        child: Ink(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              tileColor: Theme.of(context).primaryColor,
                              title: Text(
                                documents[index]['item'],
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                documents[index]['date'],
                              ),
                              trailing:
                                  Icon(Icons.arrow_right_rounded, size: 40),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoreInfo(
                                    documents[index]['item'],
                                    documents[index]['address'],

                              )));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
