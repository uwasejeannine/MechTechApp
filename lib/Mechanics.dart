import 'package:flutter/material.dart';

class MechanicsPage extends StatelessWidget {
  const MechanicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mechanics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _buildMechanicCard(context);
          },
        ),
      ),
    );
  }

  Widget _buildMechanicCard(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Image.network(
            'https://via.placeholder.com/100',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          const Positioned(
            top: 8.0,
            left: 8.0,
            child: RotatedBox(
              quarterTurns: 3,
              child: FittedBox(
                child: SizedBox(
                  width: 100.0,
                  child: Text(
                    'Mechanic Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 8.0,
            left: 8.0,
            child: FittedBox(
              child: SizedBox(
                width: 100.0,
                child: Text(
                  'Short description about the mechanic.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookMechanicPage()),
                );
              },
              child: Text('Book'),
            ),
          ),
        ],
      ),
    );
  }
}

class BookMechanicPage extends StatelessWidget {
  const BookMechanicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Mechanic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Mechanic Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Short description about the mechanic.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Implement booking logic
              },
              child: const Text('Book Mechanic'),
            ),
          ],
        ),
      ),
    );
  }
}
