import 'package:flutter/material.dart';

import 'Rice.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List<String> mp = <String>[
    "Rice",
    "Wheat",
    "Oats",
    "Barley",
    "Corn",
    "op",
    "Dope"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grain"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 5,
        leadingWidth: 60,
        surfaceTintColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                context: context,
                // delegate to customize the search bar
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:

          // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

          Container(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              // color: Colors.yellowAccent,
              clipBehavior: Clip.antiAliasWithSaveLayer,

              shadowColor: Colors.black,
              borderOnForeground: true,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: mp.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) => InkWell(
                          onTap: () {
                            print("ok");
                            if (mp[index] == mp[0]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RicePage()),
                              );
                            } else if (mp[index] == mp[1]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => wheat()),
                              );
                            } else if (mp[index] == mp[2]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Oats()),
                              );
                            } else if (mp[index] == mp[3]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Barley()),
                              );
                            } else if (mp[index] == mp[4]) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => corn()),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              color: Colors.teal[200],
                              // image: DecorationImage(
                              //     image: AssetImage('assets/background.png'),
                              //     fit: BoxFit.cover),
                            ),

                            height: 120,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    mp[index],
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //       shadowColor: Colors.yellowAccent,
                                //       backgroundColor: Colors.transparent),
                                //   onPressed: () {},
                                //   child: Text(
                                //     "click",
                                //   ),
                                // )
                              ],
                            ),
                            // color: Colors.green[700],
                          ),
                        )),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            // ########################################################################################

            Flexible(
                child: ListView.builder(
              itemCount: mp.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, int index) => ListTile(
                subtitle: Text("Today's fresh \nlet start shopping\n"),
                title: Text(mp[index]),
                textColor: Colors.redAccent,
                iconColor: Colors.red,
                leading: CircleAvatar(
                  radius: 20,
                  child: Text("K"),
                ),
                trailing: Icon(Icons.arrow_circle_right, size: 34),
                isThreeLine: true,
                onTap: () {
                  if (mp[index] == mp[0]) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RicePage()),
                    );
                  } else if (mp[index] == mp[1]) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => wheat()),
                    );
                  } else if (mp[index] == mp[2]) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Oats()),
                    );
                  } else if (mp[index] == mp[3]) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Barley()),
                    );
                  } else if (mp[index] == mp[4]) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => corn()),
                    );
                  }

                  print("OK $index");
                },
              ),
            ))
          ],
        )),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = <String>[
    "Rice",
    "Wheat",
    "Oats",
    "Barley",
    "Corn",
    "op",
    "Dope"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
