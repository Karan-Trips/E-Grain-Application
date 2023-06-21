import 'package:flutter/material.dart';

class GrainPage extends StatefulWidget {
  @override
  _GrainPageState createState() => _GrainPageState();
}

class _GrainPageState extends State<GrainPage> {
  int _quantity = 0;
  double _totalPrice = 0.0;
  double _pricePerKg = 80.0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _totalPrice = _quantity * _pricePerKg;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
        _totalPrice = _quantity * _pricePerKg;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Grain'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    "Wheat is a grass widely cultivated for its seed, a cereal grain that is a worldwide staple food. ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                widthFactor: 110,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Quantity: $_quantity',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "bt1",
                    onPressed: _decrementQuantity,
                    tooltip: 'Decrement',
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 16.0),
                  FloatingActionButton(
                    heroTag: "bt2",
                    onPressed: _incrementQuantity,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Total Price: $_totalPrice',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Order Confirmed'),
                        content: Text(
                            'You have ordered $_quantity kg of grain for a total of $_totalPrice.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Confirm Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
