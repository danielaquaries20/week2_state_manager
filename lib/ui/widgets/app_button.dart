import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onClick,
    required this.caption,
    this.isLoading = false,
  }) : super(key: key);
  final String caption;
  final VoidCallback onClick;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ElevatedButton(
            onPressed: onClick,
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.resolveWith(
                (states) => Size(double.infinity, 52),
              ),
            ),
            child: Text(isLoading ? '' : caption),
          ),
          Visibility(
            visible: isLoading,
            child: const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
