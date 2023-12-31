import 'package:flutter/material.dart';

class ChooseTransportationPage extends StatelessWidget {
  const ChooseTransportationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Transportation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select Transportation',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            buildTransportOption(
              'Bus',
              Icons.directions_bus,
              Colors.blue,
              context,
                (){
                  // Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
            const SizedBox(height: 20),
            buildTransportOption(
              'Car',
              Icons.directions_car,
              Colors.orange,
              context,
                (){
                  // Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
            const SizedBox(height: 20),
            buildTransportOption(
              'Airplane',
              Icons.airplanemode_active,
              Colors.red,
              context,
                (){
                  Navigator.pushNamed(context, '/ChooseSeatPage');
                }
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransportOption(
      String title,
      IconData icon,
      Color color,
      BuildContext context,
      Function voidCallback,
      ) {
    return GestureDetector(
      onTap: () {
        // Handle option selection
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Transportation Selected'),
            content: Text('You have selected $title'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        voidCallback();
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(
              icon,
              size: 36,
              color: color,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

