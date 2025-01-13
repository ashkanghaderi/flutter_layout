import 'package:flutter/material.dart';

class MiscellaneousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Miscellaneous Widgets Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Stack with Positioned widgets
              Text(
                'Stack & Positioned',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(color: Colors.grey.shade300),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Align
              Text(
                'Align',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 100,
                color: Colors.grey.shade300,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // FractionallySizedBox
              Text(
                'FractionallySizedBox',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 100,
                color: Colors.grey.shade300,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.6,
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Wrap
              Text(
                'Wrap Widget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  10,
                  (index) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}