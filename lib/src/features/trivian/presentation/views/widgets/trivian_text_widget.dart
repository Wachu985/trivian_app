import 'package:flutter/material.dart';

import 'data_widget.dart';

class TrivianTextWidget extends StatelessWidget {
  const TrivianTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(20)),
        child: const DataWidget(),
      ),
    );
  }
}
