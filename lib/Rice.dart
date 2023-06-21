import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:loginuicolors/controller.dart';

class Grain {
  final String name;
  final double price;
  int quantity;

  Grain(this.name, this.price, this.quantity);
}

Widget bottomSheet() {
  return Container(
    height: 120,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Choose Prayment Option",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              alignment: Alignment.center,
              onPressed: () {},
              icon: Icon(Icons.money),
            ),
            TextButton(
              child: Text(
                "Cash",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.monetization_on_outlined),
            ),
            TextButton(
              child: Text(
                "Online",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    ),
  );
}

class RicePage extends StatefulWidget {
  @override
  State<RicePage> createState() => _RicePageState();
}

class _RicePageState extends State<RicePage> {
  int _cartItemCount = 0;
  double _cartTotalPrice = 0;

  List<dynamic> data = [];
  int _counter = 0;

  Future<void> fetchData() async {
    const String uri = "http://192.168.18.90/dope_api/graindetail.php";
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _addToCart(int index) {
    setState(() {
      data[index]._counter++;
      _cartItemCount++;
      _cartTotalPrice += data[index]["price"];
    });
  }

// ###############################################################################

// ##################################################################################################3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Rice'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.green[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Text(
                                "P",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            title: Text(data[index]['grain']),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('\Available:${data[index]['available']}'),
                                Text('\Price:${data[index]['price']}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: _decrementCounter,
                                ),
                                Text('$_counter'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: _incrementCounter,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GrainPages()),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Items: $_counter'),
              Text(
                'Total: \₹${_cartTotalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ElevatedButton(
                child: Text('Payment'),
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// #######################################################

class GrainPages extends StatefulWidget {
  @override
  _GrainPagesState createState() => _GrainPagesState();
}

class _GrainPagesState extends State<GrainPages> {
  List<String> _grainList = [
    "Wheat",
    "Corn",
    "Rice",
    "Barley",
  ];
  List<double> _priceList = [
    10.0,
    8.0,
    12.0,
    7.0,
  ];
  List<String> _cartItems = [];

  void _addToCart(int index) {
    setState(() {
      _cartItems.add(_grainList[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grain Prices"),
      ),
      body: ListView.builder(
        itemCount: _grainList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_grainList[index]),
            subtitle: Text("\$${_priceList[index].toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () => _addToCart(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  CartPage(cartItems: _cartItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<String> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(cartItems[index]),
            ),
          );
        },
      ),
    );
  }
}

class GrainPricePage extends StatefulWidget {
  @override
  _GrainPricePageState createState() => _GrainPricePageState();
}

class _GrainPricePageState extends State<GrainPricePage> {
  // Define the grain prices for each card
  final _cornPrice = 5.00;
  final _wheatPrice = 4.50;
  final _oatPrice = 3.75;

  // Define the total price as a computed property
  double get _totalPrice => _cornPrice + _wheatPrice + _oatPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grain Prices'),
      ),
      body: Column(
        children: [
          _buildCard('Corn', _cornPrice),
          _buildCard('Wheat', _wheatPrice),
          _buildCard('Oat', _oatPrice),
          SizedBox(height: 16),
          Text(
            'Total: \$${_totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, double price) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text('\$${price.toStringAsFixed(2)}'),
      ),
    );
  }
}
// ####################_______________________

// ############################################################+_____________

class wheat extends StatefulWidget {
  const wheat({Key? key}) : super(key: key);

  @override
  State<wheat> createState() => _wheatState();
}

class _wheatState extends State<wheat> {
  List<Grain> _grains = [
    Grain('Common wheat', 100, 0),
    Grain('Khapli Wheat', 50, 0),
    Grain('Sharbati Wheat', 69, 0),
    Grain('Common bread wheat', 82, 0),
  ];

  int _cartItemCount = 0;
  double _cartTotalPrice = 0;

  void _addToCart(int index) {
    setState(() {
      _grains[index].quantity++;
      _cartItemCount++;
      _cartTotalPrice += _grains[index].price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Rice'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://static.agcanada.com/wp-content/uploads/sites/3/2018/08/Wheat_GettyImages-157506494-1.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
                "\tWheat is a grass widely cultivated for its seed\t,\n\ta cereal grain that is a worldwide staple food. ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            widthFactor: 110,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _grains.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.green[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Text(
                                "P",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            title: Text(_grains[index].name),
                            subtitle: Text(_grains[index].price.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    if (_grains[index].quantity > 0) {
                                      setState(() {
                                        _grains[index].quantity--;
                                        _cartItemCount--;
                                        _cartTotalPrice -= _grains[index].price;
                                      });
                                    }
                                  },
                                ),
                                Text(_grains[index].quantity.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () => _addToCart(index),
                                ),
                              ],
                            ),
                            //
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GrainPages()),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (BuildContext context) =>
                //                 GrainAddToCartPage()),
                //       );
                //     },
                //     child: Text('GO to Cart'),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Items: $_cartItemCount'),
              Text(
                'Total: \₹${_cartTotalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ElevatedButton(
                child: Text('Payment'),
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Oats extends StatelessWidget {
  Oats({Key? key}) : super(key: key);
  final Mcontroller c = Get.put(Mcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oats Info"),
        backgroundColor: Colors.green,
      ), // AppBar

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 4,
                  onPressed: () {},
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            ClipOval(
              child: Image.network(
                'https://th.bing.com/th/id/OIP.fC1jTbxLRDW-Ktk8lXZL3QHaHD?pid=ImgDet&rs=1',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                      "Oats DESCRPTION:\n\n \t They are a very good source of fiber, especially beta glucan, and are high in vitamins, minerals, and antioxidants.\nWhole oats are the only food source of avenanthramides, a unique group of antioxidants believed to protect against heart disease. ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  widthFactor: 110,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Oats/Kg",
                  style: TextStyle(fontSize: 30, color: Colors.amber),
                ),
                SizedBox(
                  width: 130,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.redAccent),
                  child: IconButton(
                    onPressed: () => c.decre(),
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Obx(() => Text("${c.o.toString()}")),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.redAccent),
                  child: IconButton(
                    onPressed: () => c.incre(),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.brown),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {},
                      child: Text(
                        "Total = 100",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // #############################
              },
              child: Text("Add to cart"),
            ),
            FloatingActionButton(
              splashColor: Colors.amber,
              heroTag: 3,
              onPressed: () {},
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Barley()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                  )),
            ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class Barley extends StatelessWidget {
  const Barley({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barley Info"),
        backgroundColor: Colors.redAccent,
      ), // AppBar
      body: Column(
        children: [
          Center(
            child: Text("Barley Info",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w700)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 5,
                onPressed: () {},
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RicePage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_rounded,
                    )),
              ),
            ],
          ),
        ],
      ), // Center
    ); // Scaffold
  }
}

class corn extends StatelessWidget {
  const corn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corn Info"),
        backgroundColor: Colors.green,
      ), // AppBar
      body: Center(
        child: Text(
          "Corn Info",
          style: TextStyle(color: Colors.green, fontSize: 30),
        ),
      ), // Center
    ); // Scaffold
  }
}
