import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomMultiChildLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CustomMultiChildLayout Demo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle('CustomMultiChildLayout'),
              SizedBox(
                height: 300,
                child: CustomMultiChildLayout(
                  delegate: _CustomLayoutDelegate(),
                  children: [
                    LayoutId(
                      id: 'center',
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Center',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    LayoutId(
                      id: 'top',
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'Top',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    LayoutId(
                      id: 'bottom',
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            'Bottom',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    LayoutId(
                      id: 'left',
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.purple,
                        child: Center(
                          child: Text(
                            'Left',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    LayoutId(
                      id: 'right',
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.orange,
                        child: Center(
                          child: Text(
                            'Right',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class _CustomLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // Layout the center widget
    if (hasChild('center')) {
      final Size centerSize = layoutChild(
        'center',
        BoxConstraints.loose(size),
      );
      positionChild(
        'center',
        Offset(
          (size.width - centerSize.width) / 2,
          (size.height - centerSize.height) / 2,
        ),
      );
    }

    // Layout the top widget
    if (hasChild('top')) {
      final Size topSize = layoutChild(
        'top',
        BoxConstraints.loose(size),
      );
      positionChild(
        'top',
        Offset(
          (size.width - topSize.width) / 2,
          (size.height - topSize.height) / 4,
        ),
      );
    }

    // Layout the bottom widget
    if (hasChild('bottom')) {
      final Size bottomSize = layoutChild(
        'bottom',
        BoxConstraints.loose(size),
      );
      positionChild(
        'bottom',
        Offset(
          (size.width - bottomSize.width) / 2,
          3 * (size.height - bottomSize.height) / 4,
        ),
      );
    }

    // Layout the left widget
    if (hasChild('left')) {
      final Size leftSize = layoutChild(
        'left',
        BoxConstraints.loose(size),
      );
      positionChild(
        'left',
        Offset(
          (size.width - leftSize.width) / 4,
          (size.height - leftSize.height) / 2,
        ),
      );
    }

    // Layout the right widget
    if (hasChild('right')) {
      final Size rightSize = layoutChild(
        'right',
        BoxConstraints.loose(size),
      );
      positionChild(
        'right',
        Offset(
          3 * (size.width - rightSize.width) / 4,
          (size.height - rightSize.height) / 2,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}