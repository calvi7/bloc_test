import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CenterModal();
  }
}

class _CenterModal extends StatelessWidget {
  const _CenterModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      width: 400,
      child: Stack(
        children: const [
          Center(child: Text("Welcome to the App!")),
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const SizedBox(
        height: 30,
        width: 30,
        child: Icon(Icons.close),
      ),
    );
  }
}
