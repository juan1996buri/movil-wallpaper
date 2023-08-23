import 'package:flutter/material.dart';

class BottomDetail extends StatelessWidget {
  const BottomDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Placeholder();
      },
    );
  }
}
