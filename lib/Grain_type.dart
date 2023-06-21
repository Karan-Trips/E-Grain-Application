import 'package:flutter/material.dart';
import 'package:loginuicolors/Rice.dart';
import 'package:loginuicolors/Total.dart';

class Grain_type extends StatelessWidget {
  Grain_type({Key? key}) : super(key: key);

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
          title: Text("Grain-Type"),
        ),
        body: ListView.separated(
          itemCount: mp.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.deepOrange,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              iconColor: Colors.red,
              leading: const Icon(Icons.list),
              trailing: Icon(Icons.arrow_circle_right),
              title: Text(mp[index]),
              onTap: () {
                if (mp[index] == mp[0]) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GrainPages()),
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
            );
          },
        ));
  }
}
