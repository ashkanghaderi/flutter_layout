import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Demo'),
              background: Image.network(
                'https://source.unsplash.com/random',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item #$index'),
                  tileColor:
                      Colors.primaries[index % Colors.primaries.length].shade100,
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}