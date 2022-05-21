import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '欢迎访问临工智科仓储管理系统',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          '用户登录',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          label: "用户编码",
                          initialValue: controller.id.value,
                          onSaved: controller.idSaved,
                          validator: controller.idValidator,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          label: "用户密码",
                          initialValue: controller.pwd.value,
                          onSaved: controller.pwdSaved,
                          validator: controller.pwdValidator,
                          obscureText: true,
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          onPressed: controller.onSubmit,
                          child: const Text("登录"),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: controller.onUpdate,
                                child: const Text("更新"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(() {
              if (controller.isBusy.value) {
                return Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool obscureText;

  const MyTextFormField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSaved,
    required this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
    );
  }
}
