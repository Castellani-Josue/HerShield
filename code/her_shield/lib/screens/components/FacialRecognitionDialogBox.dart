import 'package:flutter/material.dart';
import 'package:her_shield/screens/components/text_lambda.dart';

import '../../styles/colors.dart';

class FacialRecognitionCustomDialogBox extends StatelessWidget {
  final VoidCallback onCameraBTNPressed;
  final VoidCallback onGalleryBTNPressed;

  const FacialRecognitionCustomDialogBox({
    required this.onCameraBTNPressed,
    required this.onGalleryBTNPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: facialRecognitionCustomDialogBoxBoxDecoration,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow:  [
          BoxShadow(
            color: facialRecognitionCustomDialogBoxBoxDecorationShadow,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextLambda(
            "Choose an option",
            fontSize: 20.0,
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: onCameraBTNPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnSmallIdCardCheckColor),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(15),
              ),
            ),
            child: TextLambda(
              "Camera",
              fontSize: 14.0,
            )
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onGalleryBTNPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnSmallIdCardCheckColor),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(15),
              ),
            ),
            child: TextLambda(
              "Gallery",
              fontSize: 14.0,
            )
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: TextLambda(
                "Cancel",
                fontSize: 14.0,
              )
            ),
          ),
        ],
      ),
    );
  }
}
