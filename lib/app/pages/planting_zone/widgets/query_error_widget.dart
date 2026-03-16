import 'package:flutter/material.dart';

class QueryErrorWidget extends StatelessWidget {
  final String errorMessage;
  const QueryErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: SizedBox(
        width: mediaQuery.size.width * 0.35,
        height: 300,
        child: Center(child: Text(errorMessage)),
      ),
    );
  }
}
