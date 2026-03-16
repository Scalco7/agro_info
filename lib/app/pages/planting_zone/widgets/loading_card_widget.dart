import 'package:flutter/material.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: SizedBox(
        width: mediaQuery.size.width * 0.35,
        height: 300,
        child: Center(
          child: CircularProgressIndicator(
            constraints: BoxConstraints(
              maxHeight: 50,
              maxWidth: 50,
              minWidth: 50,
              minHeight: 50,
            ),
          ),
        ),
      ),
    );
  }
}
