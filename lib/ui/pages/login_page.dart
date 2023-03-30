import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:projeto_crianca/controllers/login_page_controller.dart';
import 'package:projeto_crianca/mixins/validators_mixin.dart';
import 'package:projeto_crianca/ui/widgets/buttons/button_component.dart';
import 'package:projeto_crianca/ui/widgets/buttons/facebook_button_component.dart';
import 'package:projeto_crianca/ui/widgets/buttons/google_button_component.dart';
import 'package:projeto_crianca/ui/widgets/buttons/link_button_component.dart';
import 'package:projeto_crianca/ui/widgets/inputs/pass_input_component.dart';
import 'package:projeto_crianca/ui/widgets/inputs/text_input_component.dart';
import 'package:projeto_crianca/ui/widgets/appbar_component.dart';
import 'package:projeto_crianca/ui/widgets/modal_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class _ForgotPasswordModal extends StatelessWidget with ValidatorsMixin {
  final LoginPageController controller = Get.find<LoginPageController>();

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Te enviaremos por email um link para a redefinição da sua senha.",
              ),
              SizedBox(height: metrics.gap),
              Form(
                key: controller.getForgotPassFormKey,
                child: TextInputComponent(
                  controller: controller.getEmailFieldController,
                  placeholder: "Digite seu email",
                  type: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  action: TextInputAction.next,
                  icon: Ionicons.mail_outline,
                  validador: emailValidador,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: metrics.gap),
        ButtonWidget(
          text: "Enviar email",
          icon: Ionicons.send_outline,
          color: ButtonWidgetColor.secoundary,
          reversed: true,
          onPressed: () {
            Get.back();
            controller.resetPassword();
          },
        ),
      ],
    );
  }
}

class LoginPage extends GetView<LoginPageController> with ValidatorsMixin {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Login",
      ),
      body: Padding(
        padding: metrics.padding,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GoogleButtonWidget(
                      text: "Entrar com o Google",
                      onPressed: () => controller.loginWithGoogle(),
                    ),
                    SizedBox(height: metrics.gap),
                    FacebookButtonWidget(
                      text: "Entrar com Facebook",
                      onPressed: () => controller.loginWithFacebook(),
                    ),
                  ],
                ),
                SizedBox(height: metrics.gap),
                const Text("ou"),
                SizedBox(height: metrics.gap),
                Form(
                  key: controller.getFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextInputComponent(
                        controller: controller.getEmailFieldController,
                        placeholder: "Digite seu email",
                        type: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        action: TextInputAction.next,
                        icon: Ionicons.mail_outline,
                        validador: emailValidador,
                      ),
                      SizedBox(height: metrics.gap),
                      PassInputComponent(
                        controller: controller.getPassFieldController,
                        autofillHints: const [AutofillHints.password],
                        placeholder: "Digite sua senha",
                        action: TextInputAction.done,
                        icon: Ionicons.lock_closed_outline,
                        validador: passwordValidador,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LinkButtonWidget(
                            text: "Esqueceu a senha?",
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => ModalComponent(
                                title: "Recuperação de senha",
                                child: _ForgotPasswordModal(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: metrics.gap),
                ButtonWidget(
                  text: "Entrar",
                  icon: Ionicons.enter_outline,
                  onPressed: () => {
                    if (controller.getFormKey.currentState!.validate())
                      {controller.loginWithEmailAndPass()}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
