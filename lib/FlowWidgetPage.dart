import 'package:flutter/material.dart';
import 'dart:math';

class FlowWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow Widget Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Flow Layout
              _buildSectionTitle('Basic Flow Layout'),
              Container(
                height: 150,
                child: Flow(
                  delegate: _BasicFlowDelegate(),
                  children: List.generate(
                    10,
                    (index) => _buildBox(index),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Circular Flow Layout
              _buildSectionTitle('Circular Flow Layout'),
              Container(
                height: 200,
                child: Flow(
                  delegate: _CircularFlowDelegate(),
                  children: List.generate(
                    12,
                    (index) => _buildCircularBox(index),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Overlapping Flow Layout
              _buildSectionTitle('Overlapping Flow Layout'),
              Container(
                height: 150,
                child: Flow(
                  delegate: _OverlappingFlowDelegate(),
                  children: List.generate(
                    10,
                    (index) => _buildBox(index, opacity: 0.7),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Spiral Flow Layout
              _buildSectionTitle('Spiral Flow Layout'),
              Container(
                height: 300,
                child: Flow(
                  delegate: _SpiralFlowDelegate(),
                  children: List.generate(
                    20,
                    (index) => _buildBox(index, width: 40, height: 40),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Radial Burst Layout
              _buildSectionTitle('Radial Burst Layout'),
              Container(
                height: 250,
                child: Flow(
                  delegate: _RadialBurstFlowDelegate(),
                  children: List.generate(
                    15,
                    (index) => _buildBurstBox(index),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  // Helper to build rectangular boxes
  Widget _buildBox(int index, {double width = 60, double height = 60, double opacity = 1.0}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length].withOpacity(opacity),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Helper to build circular boxes
  Widget _buildCircularBox(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Helper to build burst boxes
  Widget _buildBurstBox(int index) {
    return Container(
      width: 30 + index * 2,
      height: 30 + index * 2,
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length].withAlpha((0.8 * 255).toInt()),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}

// Delegate 1: Basic Flow Layout
class _BasicFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;

    for (int i = 0; i < context.childCount; i++) {
      final childSize = context.getChildSize(i)!;

      if (x + childSize.width > context.size.width) {
        x = 0;
        y += childSize.height + 10; // Add vertical spacing
      }

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );

      x += childSize.width + 10; // Add horizontal spacing
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}

// Delegate 2: Circular Flow Layout
class _CircularFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final radius = context.size.shortestSide / 3;
    final centerX = context.size.width / 2;
    final centerY = context.size.height / 2;

    for (int i = 0; i < context.childCount; i++) {
      final angle = i * 2 * 3.1415926 / context.childCount;
      final x = centerX + radius * cos(angle) - context.getChildSize(i)!.width / 2;
      final y = centerY + radius * sin(angle) - context.getChildSize(i)!.height / 2;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}

// Delegate 3: Overlapping Flow Layout
class _OverlappingFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;

    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, 0, 0),
      );

      x += 40; // Overlapping offset
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}

// Delegate 4: Spiral Flow Layout
class _SpiralFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = context.size.width / 2;
    double y = context.size.height / 2;
    double radiusIncrement = 10;

    for (int i = 0; i < context.childCount; i++) {
      final radius = radiusIncrement * i;
      final angle = i * 0.5;

      final childSize = context.getChildSize(i)!;
      final offsetX = radius * cos(angle);
      final offsetY = radius * sin(angle);

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x + offsetX - childSize.width / 2,
            y + offsetY - childSize.height / 2, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}

// Delegate 5: Radial Burst Layout
class _RadialBurstFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final centerX = context.size.width / 2;
    final centerY = context.size.height / 2;
    final angleIncrement = 2 * 3.1415926 / context.childCount;

    for (int i = 0; i < context.childCount; i++) {
      final angle = i * angleIncrement;
      final distance = 50 + i * 15;

      final x = centerX + distance * cos(angle) - context.getChildSize(i)!.width / 2;
      final y = centerY + distance * sin(angle) - context.getChildSize(i)!.height / 2;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}