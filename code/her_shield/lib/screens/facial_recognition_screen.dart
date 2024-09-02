import 'package:flutter/material.dart';
import 'package:her_shield/library/cnic_scanner-0.0.4/lib/cnic_scanner.dart';
import 'package:her_shield/library/cnic_scanner-0.0.4/lib/model/cnic_model.dart';
import 'package:image_picker/image_picker.dart';

import '../styles/colors.dart';
import 'components/FacialRecognitionDialogBox.dart';

class FacialRecognitionScreen extends StatefulWidget {
  const FacialRecognitionScreen({super.key});

  @override
  FacialRecognitionScreenState createState() => FacialRecognitionScreenState();
}

class FacialRecognitionScreenState extends State<FacialRecognitionScreen> {
  TextEditingController nameTEController = TextEditingController(),
      sexTEController = TextEditingController(),
      cnicTEController = TextEditingController(),
      dobTEController = TextEditingController(),
      doiTEController = TextEditingController(),
      doeTEController = TextEditingController();

  /// you're required to initialize this model class as method you used
  /// from this package will return a model of CnicModel type
  CnicModel _cnicModel = CnicModel();

  Future<void> scanCnic(ImageSource imageSource) async {
    /// you will need to pass one argument of "ImageSource" as shown here
    CnicModel cnicModel =
    await CnicScanner().scanImage(imageSource: imageSource);
    setState(() {
      _cnicModel = cnicModel;
      nameTEController.text = _cnicModel.cnicHolderName;
      sexTEController.text = _cnicModel.cnicHolderSex;
      cnicTEController.text = _cnicModel.cnicNumber;
      dobTEController.text = _cnicModel.cnicHolderDateOfBirth;
      doiTEController.text = _cnicModel.cnicIssueDate;
      doeTEController.text = _cnicModel.cnicExpiryDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Text('Enter ID Card Details',
                style: TextStyle(
                    color: textFieldLoginFocusedBorderColor,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Text('To verify your Account, please enter your CNIC details.',
                style: TextStyle(
                    color: textFieldLoginFocusedBorderColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  _dataField(
                      text: 'Name', textEditingController: nameTEController),
                  _dataField(text :'Sex', textEditingController: sexTEController),
                  _idCardField(textEditingController: cnicTEController),
                  _dataField(
                      text: 'Date of Birth',
                      textEditingController: dobTEController),
                  _dataField(
                      text: 'Date of Card Issue',
                      textEditingController: doiTEController),
                  _dataField(
                      text: 'Date of Card Expire',
                      textEditingController: doeTEController),
                  const SizedBox(
                    height: 20,
                  ),
                  _getScanIDCardBtn(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// these are my custom designs you can use according to your ease
  Widget _idCardField({required TextEditingController textEditingController}) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.only(top: 2.0, bottom: 5.0),
      child: Container(
        margin:
        const EdgeInsets.only(top: 2.0, bottom: 1.0, left: 0.0, right: 0.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 3,
                height: 45,
                margin: const EdgeInsets.only(left: 3.0, right: 7.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF0000), // Rouge
                        Color(0xFFFFFF00), // Jaune
                        Color(0xFF00FF00), // Vert
                      ],
                      stops: [
                        0.0,
                        0.5,
                        1.0
                      ],
                      tileMode: TileMode.mirror,
                      end: Alignment.bottomCenter,
                      begin: Alignment.topRight),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'National Register N°',
                        style: TextStyle(
                            color: textFieldLoginFocusedBorderColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/sex.png",
                              width: 40, height: 30),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: '01.04.21-016.46',
                                hintStyle: TextStyle(color: textFieldLoginFocusedBorderColor),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(left: 5.0),
                              ),
                              style: TextStyle(
                                  color: textFieldLoginFocusedBorderColor,
                                  fontWeight: FontWeight.bold),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataField(
      {required String text,
        required TextEditingController textEditingController}) {
    return Card(
        shadowColor: textFieldLoginFocusedBorderColor,
        elevation: 5,
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(
                (text == "Name") ? Icons.person : Icons.date_range,
                color: textFieldLoginFocusedBorderColor,
                size: 17,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15.0, top: 5, bottom: 3),
                    child: Text(
                      text.toUpperCase(),
                      style: TextStyle(
                          color: textFieldLoginFocusedBorderColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: (text == "Name" || text == "Sex") ? "User Name" : 'DD/MM/YYYY',
                        border: InputBorder.none,
                        isDense: true,
                        hintStyle: TextStyle(
                            color: textFieldLoginFocusedBorderColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      style: TextStyle(
                          color: textFieldLoginFocusedBorderColor,
                          fontWeight: FontWeight.bold),
                      textInputAction: TextInputAction.done,
                      keyboardType: (text == "Name")
                          ? TextInputType.text
                          : TextInputType.number,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _getScanIDCardBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.all(0.0),
      ),
      onPressed: () {
        /// this is the custom dialog that takes 2 arguments "Camera" and "Gallery"
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return FacialRecognitionCustomDialogBox(onCameraBTNPressed: () {
                scanCnic(ImageSource.camera);
              }, onGalleryBTNPressed: () {
                scanCnic(ImageSource.gallery);
              });
            });
      },
      // textColor: Colors.white,
      // padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(colors: <Color>[
            textFieldLoginFocusedBorderColor,
            textFieldLoginFocusedBorderColor,
            textFieldLoginFocusedBorderColor,
          ]),
        ),
        padding: const EdgeInsets.all(12.0),
        child: const Text('Scan ID Card', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}