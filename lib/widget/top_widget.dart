
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final VoidCallback loadHome;
  final VoidCallback onSubmitted;
  const TopWidget({
    required this.textEditingController,
    required this.loadHome,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  loadHome();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  size: 18,
                )),
            Expanded(
                child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search or type web address",
              ),
              onSubmitted: (value) {
                onSubmitted();
              },
            )),
            IconButton(
                onPressed: () {
                  textEditingController.clear();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.trash,
                  size: 18,
                ))
          ],
        ),
      ),
    );
  }
}
