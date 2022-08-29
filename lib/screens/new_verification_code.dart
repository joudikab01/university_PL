import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_project/responsive.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final _formKey = GlobalKey<FormState>();
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final fourthController = TextEditingController();
  final fifthController = TextEditingController();
  final sixthController = TextEditingController();
  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.show');
    firstFocusNode = FocusNode();
    firstFocusNode.addListener(() {
      setState(() {});
    });
    secondFocusNode = FocusNode();
    secondFocusNode.addListener(() {
      setState(() {});
    });
    thirdFocusNode = FocusNode();
    thirdFocusNode.addListener(() {
      setState(() {});
    });
    fourthFocusNode = FocusNode();
    fourthFocusNode.addListener(() {
      setState(() {});
    });
    fifthFocusNode = FocusNode();
    fifthFocusNode.addListener(() {
      setState(() {});
    });
    sixthFocusNode = FocusNode();
    sixthFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.show');
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Verification code',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: double.infinity,
            height: responsiveSize.getHeight(200, context),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    30,
                  ),
                  topLeft: Radius.circular(
                    30,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CONFIRMATION',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Please type the verification code sent to joudi.kab01@gmail.com',
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Color.fromRGBO(
                          240,
                          240,
                          240,
                          1,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onChanged: (value) {
                                print(value);
                                if (value.length == 1 && isNumeric(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onEditingComplete: () {},
                              autofocus: true,
                              onFieldSubmitted: (value) {
                                fieldFocusChange(
                                    context, firstFocusNode, secondFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: firstFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: firstController,
                              focusNode: firstFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: firstFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: firstFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: firstFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: firstFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1 && isNumeric(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onEditingComplete: () {},
                              onFieldSubmitted: (value) {
                                fieldFocusChange(
                                    context, secondFocusNode, thirdFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: secondFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: secondController,
                              focusNode: secondFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: secondFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: secondFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: secondFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: secondFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1 && isNumeric(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onEditingComplete: () {},
                              onFieldSubmitted: (value) {
                                fieldFocusChange(
                                    context, thirdFocusNode, fourthFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: thirdFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: thirdController,
                              focusNode: thirdFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: thirdFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: thirdFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: thirdFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: thirdFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1 && isNumeric(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onEditingComplete: () {},
                              onFieldSubmitted: (value) {
                                fieldFocusChange(
                                    context, fourthFocusNode, fifthFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fourthFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: fourthController,
                              focusNode: fourthFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fourthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fourthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fourthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: fourthFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1 && isNumeric(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              onEditingComplete: () {},
                              onFieldSubmitted: (value) {
                                fieldFocusChange(
                                    context, fifthFocusNode, sixthFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fifthFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: fifthController,
                              focusNode: fifthFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fifthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fifthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: fifthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: fifthFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              onEditingComplete: () {},
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: sixthFocusNode.hasFocus
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              cursorColor: Colors.blueGrey,
                              controller: sixthController,
                              focusNode: sixthFocusNode,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: sixthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: sixthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  borderSide: BorderSide(
                                    width: 2,
                                    style: BorderStyle.none,
                                    color: sixthFocusNode.hasFocus
                                        ? Colors.white
                                        : Colors.blueGrey.shade300,
                                  ),
                                ),
                                fillColor: sixthFocusNode.hasFocus
                                    ? Colors.white
                                    : Colors.blueGrey.shade300,
                                filled: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend code',
                          style: TextStyle(
                            color: Color.fromRGBO(
                              240,
                              240,
                              240,
                              1,
                            ),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 1, primary: Colors.blueGrey[100]),
                        child: Text(
                          'VERIFY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    sixthController.dispose();

    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();

    firstFocusNode.removeListener(() {});
    secondFocusNode.removeListener(() {});
    thirdFocusNode.removeListener(() {});
    fourthFocusNode.removeListener(() {});
    fifthFocusNode.removeListener(() {});
    sixthFocusNode.removeListener(() {});
    super.dispose();
  }
}
