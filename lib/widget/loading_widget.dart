
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: Colors.grey,
      child: isLoading ? const LinearProgressIndicator() : const SizedBox(),
    );
  }
}

