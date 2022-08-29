import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_project/responsive.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  List<String> code = ['', '', '', '', '', ''];
  int selected = 0;
  //final _formKey = GlobalKey<FormState>();
  // final firstController = TextEditingController();
  // final secondController = TextEditingController();
  // final thirdController = TextEditingController();
  // final fourthController = TextEditingController();
  // final fifthController = TextEditingController();
  // final sixthController = TextEditingController();
  // late FocusNode firstFocusNode;
  // late FocusNode secondFocusNode;
  // late FocusNode thirdFocusNode;
  // late FocusNode fourthFocusNode;
  // late FocusNode fifthFocusNode;
  // late FocusNode sixthFocusNode;

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    // SystemChannels.textInput.invokeMethod('TextInput.show');
    // firstFocusNode = FocusNode();
    // firstFocusNode.addListener(() {
    //   setState(() {});
    // });
    // secondFocusNode = FocusNode();
    // secondFocusNode.addListener(() {
    //   setState(() {});
    // });
    // thirdFocusNode = FocusNode();
    // thirdFocusNode.addListener(() {
    //   setState(() {});
    // });
    // fourthFocusNode = FocusNode();
    // fourthFocusNode.addListener(() {
    //   setState(() {});
    // });
    // fifthFocusNode = FocusNode();
    // fifthFocusNode.addListener(() {
    //   setState(() {});
    // });
    // sixthFocusNode = FocusNode();
    // sixthFocusNode.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChannels.textInput.invokeMethod('TextInput.show');
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
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: double.infinity,
            height: responsiveSize.getHeight(200, context),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
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
                    const Text(
                      'CONFIRMATION',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24
                      ),
                    ),
                    const Text(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 1
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[0],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 1
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 2
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[1],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 2
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 3
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[2],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 3
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 4
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[3],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 4
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 5
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[4],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 5
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 6
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.width / 8,
                          child: Center(
                            child: Text(
                              code[5],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: selected == 6
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Form(
                    //   key: _formKey,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           autofocus: true,
                    //           onFieldSubmitted: (value) {
                    //             fieldFocusChange(
                    //                 context, firstFocusNode, secondFocusNode);
                    //           },
                    //           textInputAction: TextInputAction.next,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: firstFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: firstController,
                    //           focusNode: firstFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: firstFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: firstFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: firstFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: firstFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           onFieldSubmitted: (value) {
                    //             fieldFocusChange(
                    //                 context, secondFocusNode, thirdFocusNode);
                    //           },
                    //           textInputAction: TextInputAction.next,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: secondFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: secondController,
                    //           focusNode: secondFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: secondFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: secondFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: secondFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: secondFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           onFieldSubmitted: (value) {
                    //             fieldFocusChange(
                    //                 context, thirdFocusNode, fourthFocusNode);
                    //           },
                    //           textInputAction: TextInputAction.next,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: thirdFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: thirdController,
                    //           focusNode: thirdFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: thirdFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: thirdFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: thirdFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: thirdFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           onFieldSubmitted: (value) {
                    //             fieldFocusChange(
                    //                 context, fourthFocusNode, fifthFocusNode);
                    //           },
                    //           textInputAction: TextInputAction.next,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: fourthFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: fourthController,
                    //           focusNode: fourthFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fourthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fourthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fourthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: fourthFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           onFieldSubmitted: (value) {
                    //             fieldFocusChange(
                    //                 context, fifthFocusNode, sixthFocusNode);
                    //           },
                    //           textInputAction: TextInputAction.next,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: fifthFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: fifthController,
                    //           focusNode: fifthFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fifthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fifthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: fifthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: fifthFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //
                    //         width: MediaQuery.of(context).size.width / 8,
                    //         child: TextFormField(
                    //           onEditingComplete: () {},
                    //           textInputAction: TextInputAction.none,
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //             color: sixthFocusNode.hasFocus
                    //                 ? Colors.black
                    //                 : Colors.white,
                    //           ),
                    //           inputFormatters: [
                    //             FilteringTextInputFormatter.digitsOnly,
                    //             LengthLimitingTextInputFormatter(1),
                    //             FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    //           ],
                    //           cursorColor: Colors.blueGrey,
                    //           controller: sixthController,
                    //           focusNode: sixthFocusNode,
                    //           decoration: InputDecoration(
                    //             border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: sixthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: sixthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(
                    //                 30,
                    //               ),
                    //               borderSide: BorderSide(
                    //                 width: 2,
                    //                 style: BorderStyle.none,
                    //                 color: sixthFocusNode.hasFocus
                    //                     ? Colors.white
                    //                     : Colors.blueGrey.shade300,
                    //               ),
                    //             ),
                    //             fillColor: sixthFocusNode.hasFocus
                    //                 ? Colors.white
                    //                 : Colors.blueGrey.shade300,
                    //             filled: true,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend code',
                          style: TextStyle(
                            color:Colors.blueGrey.shade200,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade200),
                            shape: MaterialStateProperty
                                .all<OutlinedBorder?>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius
                                    .circular(12),
                              ),
                            ),
                          fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-60, 50))
                        ),
                        child: const Text(
                          'VERIFY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '1';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '4';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '7';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '2';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '5';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '5',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '8';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '0';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '3';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '6';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '6',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    code[selected] = '9';
                                    selected = selected + 1;
                                  });
                                },
                                child: const Text(
                                  '9',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (selected > 0) {
                                    setState(() {
                                      code[selected-1] = '';
                                      selected = selected - 1;
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.cancel_presentation_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   firstController.dispose();
  //   secondController.dispose();
  //   thirdController.dispose();
  //   fourthController.dispose();
  //   fifthController.dispose();
  //   sixthController.dispose();
  //
  //   firstFocusNode.dispose();
  //   secondFocusNode.dispose();
  //   thirdFocusNode.dispose();
  //   fourthFocusNode.dispose();
  //   fifthFocusNode.dispose();
  //   sixthFocusNode.dispose();
  //
  //   firstFocusNode.removeListener(() {});
  //   secondFocusNode.removeListener(() {});
  //   thirdFocusNode.removeListener(() {});
  //   fourthFocusNode.removeListener(() {});
  //   fifthFocusNode.removeListener(() {});
  //   sixthFocusNode.removeListener(() {});
  //   super.dispose();
  // }
}
