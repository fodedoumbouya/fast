import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Controlers
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repearPasswordController = TextEditingController();

  // final variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //variable
  RxBool isValideNumber = false.obs;
  RxBool isValidePassword = false.obs;
  RxBool isValideRepeatPassword = false.obs;
  RxBool hiddenPassword = true.obs;
  RxBool hiddenRepeatPassword = true.obs;

  final double margeLeft = 10.0;

  void onClick() {
    if (numberController.text.isNotEmpty) {
      isValideNumber.value = true;
    } else {
      isValideNumber.value = false;
    }
    if (passwordController.text.isNotEmpty) {
      isValidePassword.value = true;
    } else {
      isValidePassword.value = false;
    }

    if (repearPasswordController.text.isNotEmpty) {
      isValideRepeatPassword.value = true;
    } else {
      isValideRepeatPassword.value = false;
    }
  }

  void valide() {
    if (formKey.currentState!.validate()) {
      //TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        key: const Key("Stack"),
        children: [
          Positioned(
              top: size.height * .12,
              left: margeLeft,
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const ClipOval(
                      child: Icon(
                        Icons.save,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    const Expanded(
                        child: Text(
                      "用户注册",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ))
                  ],
                ),
              )),
          Positioned(
              top: size.height * .25,
              left: margeLeft,
              child: Obx(() => Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //--------------------------------------------------------------Number Form--------------------------------------
                      Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: isValideNumber.value == true
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey))),
                          child: Row(
                            children: [
                              Text(
                                "账号",
                                style: TextStyle(
                                  color: isValideNumber.value == true
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: isValideNumber.value == true
                                        ? Theme.of(context).primaryColor
                                        : Colors.black,
                                  ),
                                  controller: numberController,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return 'Please type your Name';
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: '请输入您的账号',
                                    hintStyle: TextStyle(
                                        color: isValideNumber.value == true
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    onClick();
                                  },
                                  onSaved: (value) {
                                    //  TODO
                                  },
                                ),
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  //delete number
                                  numberController.clear();
                                  onClick();
                                },
                              )
                            ],
                          )),

                      //--------------------------------------------------------------Password Form--------------------------------------
                      Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: isValidePassword.value == true
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey))),
                          child: Row(
                            children: [
                              Text(
                                "密码",
                                style: TextStyle(
                                  color: isValidePassword.value == true
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: isValidePassword.value == true
                                        ? Theme.of(context).primaryColor
                                        : Colors.black,
                                  ),
                                  controller: passwordController,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return 'Please type your 密码';
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: '请输入您的密码',
                                    hintStyle: TextStyle(
                                        color: isValidePassword.value == true
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  obscureText: hiddenPassword.value,
                                  onChanged: (value) {
                                    onClick();
                                  },
                                  onSaved: (value) {
                                    //TODO
                                  },
                                ),
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  //delete password
                                  passwordController.clear();
                                  onClick();
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  hiddenPassword.value = !hiddenPassword.value;
                                },
                              )
                            ],
                          )),

                      //--------------------------------------------------------------Repeat Password Form--------------------------------------
                      Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          isValideRepeatPassword.value == true
                                              ? Theme.of(context).primaryColor
                                              : Colors.grey))),
                          child: Row(
                            children: [
                              Text(
                                "用户名",
                                style: TextStyle(
                                  color: isValideRepeatPassword.value == true
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: isValideRepeatPassword.value == true
                                        ? Theme.of(context).primaryColor
                                        : Colors.black,
                                  ),
                                  controller: repearPasswordController,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return 'Please type your 用户名';
                                    }
                                  },
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: '请输入您的用户名',
                                    hintStyle: TextStyle(
                                        color:
                                            isValideRepeatPassword.value == true
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  obscureText: hiddenRepeatPassword.value,
                                  onChanged: (value) {
                                    onClick();
                                  },
                                  onSaved: (value) {
                                    //TODO
                                  },
                                ),
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  //delete repearPassword
                                  repearPasswordController.clear();
                                  onClick();
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  hiddenRepeatPassword.value =
                                      !hiddenRepeatPassword.value;
                                },
                              )
                            ],
                          )),
                    ],
                  )))),
          //-----------------------------------------Form done-----------------------------------------------------

          Positioned(
              top: size.height * 0.66,
              child: Container(
                  width: size.width,
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  child: Row(children: [
                    const Icon(
                      Icons.confirmation_num_rounded,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                        child: RichText(
                            text: const TextSpan(
                                text: '我以阅读并同意 ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                children: <TextSpan>[
                          TextSpan(
                              text: '《用户协议》',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15)),
                          TextSpan(
                              text: '以及',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          TextSpan(
                              text: '《隐私协议》',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15)),
                        ])))
                  ]))),

          //----------------------------Bottom---------------------------------------------
          Positioned(
              top: size.height * 0.72,
              left: size.width * 0.05,
              child: InkWell(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0))),
                  child: const Center(
                    child: Text(
                      "注册",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () => valide(),
              )),

          Positioned(
              top: size.height * 0.84,
              child: SizedBox(
                  width: size.width,
                  child: Center(
                    child: RichText(
                        text: const TextSpan(
                            text: '已有账号?',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: <TextSpan>[
                          TextSpan(
                              text: '立即登录！',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15)),
                        ])),
                  ))),
        ],
      ),
    );
  }
}
