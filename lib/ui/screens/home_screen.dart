import 'package:flutter/material.dart';
import 'package:learn_flutter_provider/models/cart_model.dart';
import 'package:learn_flutter_provider/models/counter_model.dart';
import 'package:learn_flutter_provider/models/user_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display User Information
            Consumer<UserModel>(
              builder: (context, userModel, child) {
                return Text('User: ${userModel.name}', style: TextStyle(fontSize: 24));
              },
            ),
            SizedBox(height: 20),

            // Display Counter Information
            Consumer<CounterModel>(
              builder: (context, counterModel, child) {
                return Column(
                  children: [
                    Text('Counter: ${counterModel.counter}', style: TextStyle(fontSize: 24)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            counterModel.decrement();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            counterModel.increment();
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),

            // Display Cart Information
            Consumer<CartModel>(
              builder: (context, cartModel, child) {
                return Column(
                  children: [
                    Text('Cart Items:', style: TextStyle(fontSize: 24)),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartModel.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(cartModel.items[index]),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              cartModel.removeItem(cartModel.items[index]);
                            },
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cartModel.addItem('Item ${cartModel.items.length + 1}');
                      },
                      child: Text('Add Item to Cart'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}