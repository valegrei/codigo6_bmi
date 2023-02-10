import 'package:codigo6_bmi/bmi_brain.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 150;
  double weight = 60;
  double bmi = 0;
  int indice = 0;
  String result = "";
  String recomendacion = "";
  String imgSrc = "assets/image";

  BMIBrain mandarina = BMIBrain(height: 0, weight: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bienvenido",
                style: TextStyle(
                  fontFamily: "Noto Sans",
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                "Por favor selecciona los parámetros correspondientes",
                style: TextStyle(
                  fontFamily: "Noto Sans",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  height: 1.3,
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),

              const Center(
                child: Text(
                  "Altura",
                  style: TextStyle(
                    fontFamily: "Noto Sans",
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toInt().toString(),
                    style: const TextStyle(
                      fontFamily: "Noto Sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    " cm",
                    style: TextStyle(
                      fontFamily: "Noto Sans",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // Text(height.toStringAsFixed(0)),
              // Text("$height"),
              // Text("${height}"),
              Slider(
                value: height,
                min: 50,
                max: 220,
                onChanged: (double value) {
                  height = value;
                  setState(() {});
                },
              ),

              const SizedBox(
                height: 16.0,
              ),

              const Center(
                child: Text(
                  "Peso",
                  style: TextStyle(
                    fontFamily: "Noto Sans",
                    fontSize: 16.0,
                    color: Colors.black54,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    weight.toInt().toString(),
                    style: const TextStyle(
                      fontFamily: "Noto Sans",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    " Kg",
                    style: TextStyle(
                      fontFamily: "Noto Sans",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // Text(height.toStringAsFixed(0)),
              // Text("$height"),
              // Text("${height}"),
              Slider(
                value: weight,
                min: 30,
                max: 200,
                onChanged: (double value) {
                  weight = value;
                  setState(() {});
                },
              ),

              const SizedBox(
                height: 16.0,
              ),

              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    mandarina.height = height;
                    mandarina.weight = weight;
                    bmi = mandarina.bmiCalculator();
                    setState(() {});
                  },
                  child: const Text("Calcular"),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Resultado:",
                            style: TextStyle(
                              fontFamily: "Noto Sans",
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            bmi.toStringAsFixed(1),
                            style: const TextStyle(
                              fontFamily: "Noto Sans",
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff06f6a0),
                            ),
                          ),
                          Text(
                            mandarina.getResult(),
                            style: const TextStyle(
                              fontFamily: "Noto Sans",
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff06f6a0),
                            ),
                          ),
                          const Text(
                            "Recomendación:",
                            style: TextStyle(
                              fontFamily: "Noto Sans",
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            mandarina.getRecomendacion(),
                            style: const TextStyle(
                              fontFamily: "Noto Sans",
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        mandarina.getImageSrc(),
                        height: 160.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
