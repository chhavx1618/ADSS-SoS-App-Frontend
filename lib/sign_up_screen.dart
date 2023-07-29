import 'dart:io';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_adss/custom_text_field_widget.dart';
import 'package:sos_adss/otp_verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController aadharnumTextEditingController =
      TextEditingController();

  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  String? gender;
  String? dob;
  String initValue = "dd/mm/yyyy";
  bool isDateSelected = false;
  DateTime? birthDate; // instance of DateTime
  String? birthDateInString;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String dowmloadUrlImage = "";
  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();
  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imgXFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0a1119),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  "Your Info",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Name",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomTextField(
                textEditingController: nameTextEditingController,
                iconData: Icons.person,
                hintText: "Enter your name",
                // labelText: "Name is one ",
                isObscure: false,
                enabled: true,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Aadhar Number",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomTextField(
                textEditingController: nameTextEditingController,
                iconData: Icons.person,
                hintText: "Enter your name",
                // labelText: "Name is one ",
                isObscure: false,
                enabled: true,
              ),
              SizedBox(height: 20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                        child: Text(
                          "DOB",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 30, 45, 65),
                              border: Border.all(
                                color: Color.fromARGB(255, 30, 45, 65),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
                            child: Row(
                              children: [
                                Text(
                                  isDateSelected
                                      ? birthDateInString!
                                      : initValue,
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                    child: new Icon(Icons.calendar_today,
                                        color: Colors.grey),
                                    onTap: () async {
                                      final datePick = await showDatePicker(
                                          context: context,
                                          initialDate: new DateTime.now(),
                                          firstDate: new DateTime(1900),
                                          lastDate: new DateTime(2100));
                                      if (datePick != null &&
                                          datePick != birthDate) {
                                        setState(() {
                                          birthDate = datePick;
                                          isDateSelected = true;

                                          // put it here
                                          birthDateInString =
                                              "${birthDate?.day}/${birthDate?.month}/${birthDate?.year}"; // 08/14/2019
                                        });
                                      }
                                    }),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Gender",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 30, 45, 65),
                          border: Border.all(
                            color: Color.fromARGB(255, 30, 45, 65),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.fromLTRB(5, 4, 8, 4),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            isDense: true,
                            elevation: 20,
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                            menuMaxHeight: 180,
                            focusColor: Colors.grey,
                            value: gender,
                            //elevation: 5,
                            style: TextStyle(color: Colors.grey[500]),
                            iconEnabledColor: Colors.grey[500],
                            items: <String>['Male', 'Woman', 'Trasngender']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Select",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),

                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Mobile Number",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
              CustomTextField(
                textEditingController: nameTextEditingController,
                iconData: Icons.person,
                hintText: "Enter your 10 digit mobile number",
                // labelText: "Name is one ",
                isObscure: false,
                enabled: true,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Photo",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: imgXFile == null
                        ? null
                        : FileImage(File(
                            imgXFile!.path,
                          )),
                    radius: MediaQuery.of(context).size.width * 0.20,
                    child: imgXFile == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: MediaQuery.of(context).size.width * 0.20,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: const BoxDecoration(
                    color: Color(0xFF121a25),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    DotsIndicator(
                        dotsCount: 3,
                        position: 1,
                        reversed: false,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            activeSize: Size(38.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            activeColor: Color(0xFF14b79a),
                            color: Colors.grey)),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const OtpVerificationScreen()));
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF14b79a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
