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
    super.initState();
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 750 ;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  @override
  Widget build(BuildContext context) {
    //SystemChannels.textInput.invokeMethod('TextInput.show');
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          'Verification code',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: !isTablet(context)?20:30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(
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
            height: responsiveSize.getHeight(
              140,
              context,
            ),
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
                     Text(
                      'CONFIRMATION',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: !isTablet(context)?24:28,),
                    ),
                     Text(
                      'Please type the verification code sent to joudi.kab01@gmail.com',
                      maxLines: 3,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: const Color.fromRGBO(
                          240,
                          240,
                          240,
                          1,
                        ),
                        fontWeight: FontWeight.w400,
                        fontSize: !isTablet(context)?16:22,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == 1
                                ? Colors.white
                                : Colors.blueGrey.shade200,
                          ),
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[0],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 1 ? Colors.black : Colors.white,
                              ),
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
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[1],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 2 ? Colors.black : Colors.white,
                              ),
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
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[2],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 3 ? Colors.black : Colors.white,
                              ),
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
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[3],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 4 ? Colors.black : Colors.white,
                              ),
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
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[4],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 5 ? Colors.black : Colors.white,
                              ),
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
                          width: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.width / 8
                              : MediaQuery.of(context).size.width / 14,
                          child: Center(
                            child: Text(
                              code[5],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color:
                                    selected == 6 ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend code',
                          style: TextStyle(
                            color: Colors.blueGrey.shade200,
                            fontWeight: FontWeight.w600,
                            fontSize: !isTablet(context)?18:22,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade200),
                          shape: MaterialStateProperty.all<OutlinedBorder?>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(
                            Size(
                              MediaQuery.of(context).size.width - 60,
                              MediaQuery.of(context).size.height/17,
                            ),
                          ),
                        ),
                        child:  Text(
                          'VERIFY',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: !isTablet(context)?20:24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/3,
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
                                      code[selected - 1] = '';
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
}
