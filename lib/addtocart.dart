import 'package:flutter/material.dart';

Widget bottomSheet() {
  return Container(
    height: 150,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          children: [
            IconButton(
              alignment: Alignment.center,
              onPressed: () {},
              icon: Icon(Icons.money),
            ),
            Text("Cash-on-Delivery"),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.monetization_on_outlined),
            ),
            Text("Online"),
          ],
        )
      ],
    ),
  );
}

class Addtocart extends StatefulWidget {
  Addtocart({Key? key}) : super(key: key);

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  void deleteItem(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  final List<Map<String, dynamic>> cart = [
    {
      'name': 'Jasmine Rice',
      'price': 74,
    },
    {
      'name': 'Basmati Rice',
      'price': 82,
      'image': 'basmati_rice.png',
    },
    {
      'name': 'Brown Rice',
      'price': 72,
      'image': 'brown_rice.png',
    },
    {
      'name': 'Wild Rice',
      'price': 59,
      'image': 'wild_rice.png',
    },
    {},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        physics: ScrollPhysics(
            parent: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics())),
        itemCount: cart.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cart[index];
          if (index == cart.length - 1) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 55),
                      shape: StadiumBorder(),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()));
                    },
                    child: Text("Payment")),
              ],
            );
          }

          return Card(
            color: Colors.teal[100],
            elevation: 10,
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              isThreeLine: true,
              title: Text(item['name']),
              subtitle: Text('\$${item['price']}'),
              trailing: IconButton(
                icon:
                    Icon(Icons.remove_circle_outline_sharp, color: Colors.red),
                onPressed: () {
                  deleteItem(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// // #######################################################3

class Grain {
  final String name;
  final double price;
  int quantity;

  Grain(this.name, this.price, this.quantity);
}

class GrainAddToCartPage extends StatefulWidget {
  @override
  _GrainAddToCartPageState createState() => _GrainAddToCartPageState();
}

class _GrainAddToCartPageState extends State<GrainAddToCartPage> {
  List<Grain> _grains = [
    Grain('Wheat', 89, 0),
    Grain('Rice', 59, 0),
    Grain('Oats', 69, 0),
    Grain('Jasmine Rice', 74, 0),
    Grain('Wild-Rice', 50, 0),
    Grain('J Rice', 82, 0),
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
        title: Text('Grains'),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _grains.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_grains[index].name),
            subtitle: Text('\₹${_grains[index].price.toStringAsFixed(2)}'),
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
          );
        },
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
                  // TODO: Implement checkout logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
