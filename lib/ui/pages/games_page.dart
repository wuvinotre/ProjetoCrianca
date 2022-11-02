import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/routes/app_routes.dart';
import 'package:projeto_crianca/ui/components/Buttons/menu_button_component.dart';
import 'package:projeto_crianca/ui/components/appbar_component.dart';
import 'package:projeto_crianca/ui/theme/theme_extensions.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeMetrics metrics = Theme.of(context).extension<ThemeMetrics>()!;

    return Scaffold(
      appBar: AppBarComponent(
        title: "Games",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: metrics.padding,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: metrics.gap),
                  /*MenuButtonComponent(
                    title: "Jogo da Memória",
                    text:
                        "Trabalha raciocínio lógico das crianças de forma lúdica.",
                    image:
                        const AssetImage("assets/icons/quebraCabecaIcon.png"),
                    onPressed: () => Get.toNamed(AppRoutes.memoryGame), //TEMP
                  ),
                  
                  SizedBox(height: metrics.gap),
                  */
                  MenuButtonComponent(
                    title: "Encaixar",
                    text:
                        "Trabalha desenvolvimento das habilidades de raciocínio espacial, coordenação motora.",
                    image: const AssetImage("assets/icons/encaixarIcon.png"),
                    onPressed: () => Get.toNamed(
                      AppRoutes.encaixarGame,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MenuButtonComponent(
                    title: "Sombra",
                    text:
                        "Trabalha desenvolvimento das habilidades de raciocínio espacial, coordenação motora.",
                    image: const AssetImage("assets/icons/encaixarIcon.png"),
                    onPressed: () => Get.toNamed(
                      AppRoutes.shadowGame,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MenuButtonComponent(
                    title: "Quebra-cabeça",
                    text:
                        "Trabalha desenvolvimento das habilidades de raciocínio espacial, coordenação motora.",
                    image: const AssetImage("assets/icons/encaixarIcon.png"),
                    onPressed: () => Get.toNamed(
                      AppRoutes.puzzleGame,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
