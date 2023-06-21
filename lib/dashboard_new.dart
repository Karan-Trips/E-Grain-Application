import 'package:flutter/material.dart';

import 'Rice.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grain Broker Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello, Grain Broker!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildCard('Buy Grain', Icons.shopping_cart, context),
                _buildCard('Grain Prices', Icons.monetization_on, context),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Transaction $index'),
                    subtitle: Text('Lorem ipsum dolor sit amet.'),
                    trailing: Text('\$100'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Buy Grain') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BuyPage()),
          );
        } else if (title == 'Grain Prices') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PricesPage()),
          );
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 48),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyPage extends StatefulWidget {
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int _quantity = 0;
  String _grainType = 'Wheat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grain Delivery'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Select Grain Type',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            DropdownButton<String>(
              value: _grainType,
              onChanged: (newValue) {
                setState(() {
                  _grainType = newValue!;
                });
              },
              items: <String>['Wheat', 'Corn', 'Rice', 'Barley']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter Quantity in Kg',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 0) {
                        _quantity--;
                      }
                    });
                  },
                ),
                Text(
                  '$_quantity',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PricesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grain Menu'),
      ),
      body: ListView(
        children: [
          _buildGrainCard(
              'Rice',
              'From ₹56 onward ',
              'assets/rice.jpg',
              'Rice is a staple food in many cultures, and can be served in a variety of ways.',
              context),
          _buildGrainCard(
              'Quinoa',
              'From ₹69 onward ',
              'assets/quinoa.jpg',
              'Quinoa is a protein-rich grain that can be used in salads, bowls, or as a side dish.',
              context),
          _buildGrainCard(
              'Barley',
              'From ₹82 onward ',
              'assets/barley.jpg',
              'Barley is a versatile grain that can be used in soups, stews, and salads.',
              context),
          _buildGrainCard(
              'Buckwheat',
              'from ₹74 onward ',
              'assets/buckwheat.jpg',
              'Buckwheat is a gluten-free grain that can be used in pancakes, porridge, and salads.',
              context),
          _buildGrainCard(
              'dope',
              'from ₹80 onward ',
              'assets/corn.jpg',
              'Corn is a tall annual cereal grass that is widely grown for its large elongated ears of starchy seeds.',
              context),
          _buildGrainCard(
              'op',
              'From ₹60onward ',
              'assets/buckwheat.jpg',
              'Buckwheat is a gluten-free grain that can be used in pancakes, porridge, and salads.',
              context),
        ],
      ),
    );
  }

  Widget _buildGrainCard(String name, String price, String imageAssetPath,
      String description, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (name == 'Rice') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RicePage()));
          print("done");
        } else if (name == 'op') {
          print("op");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GrainPages()));
        } else if (name == 'Buckwheat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => wheat()),
          );
        }
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              imageAssetPath,
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              price,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
