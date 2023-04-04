import 'package:flutter/material.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/how_to_paint/components/time_information.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/views/how_to_paint/components/information.dart';
import 'package:loomi_flutter_boilerplate/src/utils/custom_colors.dart';

class HowToPaint extends StatelessWidget {
  static const routeName = "HowToPaint";

  final void Function(String page) setCurrentPage;

  const HowToPaint({Key? key, required this.setCurrentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            setCurrentPage("DescriptionOfPaints");
          },
        ),
        title: Text(
          'Como pintar',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: CustomColors.black10,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              const Information(
                  number: "1",
                  title: "Preparar a tinta",
                  img: "paint_bucket.svg",
                  description: "Abra a tinta e a coloque na caçamba"),
              const SizedBox(height: 77),
              const Information(
                  number: "2",
                  title: "Primeira demão",
                  img: "brush.svg",
                  description:
                      "Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento"),
              Padding(
                padding: const EdgeInsets.only(top: 57, bottom: 90),
                child: Transform.rotate(
                  angle: -1.57,
                  child: Icon(
                    Icons.arrow_back,
                    color: CustomColors.gray40,
                    size: 60,
                  ),
                ),
              ),
              const Information(
                  number: "3",
                  title: "Repasse a tinta",
                  img: "brush.svg",
                  description:
                      "Passe mais uma camada de tinta por cima da parede para reduzir imperfeições"),
              const TimeInformation(),
              const Information(
                  number: "4",
                  title: "Segunda demão",
                  img: "brush.svg",
                  description:
                      "Aplique a tinta na parede em N como mostrado no vídeo para melhor aproveitamento"),
              const SizedBox(height: 58),
              const Information(
                  number: "5",
                  title: "Repasse a tinta",
                  img: "brush.svg",
                  description:
                      "Passe mais uma camada de tinta por cima da parede para reduzir imperfeições"),
              const TimeInformation(),
              const Information(
                  number: "6",
                  title: "Acabou",
                  description: "Sua parede está pronta"),
              const SizedBox(height: 92),
            ],
          ),
        ),
      ),
    );
  }
}
