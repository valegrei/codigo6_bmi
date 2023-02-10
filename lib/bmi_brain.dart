import 'dart:math';

class BMIBrain {
  double height;
  double weight;

  BMIBrain({required this.height, required this.weight});

  double bmi = 0;

  //Calcular el BMI
  double bmiCalculator() {
    bmi = weight / pow((height / 100), 2);
    return bmi;
  }

  //Darme el resultado
  String getResult() {
    String result = "";
    if (bmi < 18) {
      result = "Bajo peso";
    } else if (bmi < 25) {
      result = "Normal";
    } else {
      result = "Sobrepeso";
    }
    return result;
  }

  //Darme la recomendacion
  String getRecomendacion() {
    String recomendacion = "";
    if (bmi < 18) {
      recomendacion = "Consulte a su nutricionista para una dieta saludable.";
    } else if (bmi < 25) {
      recomendacion = "Muy bien! Siga con su vida saludable.";
    } else {
      recomendacion = "Haga ejercicio y una dieta saludable.";
    }
    return recomendacion;
  }

  //Darme la imagen
  String getImageSrc() {
    String imageSrc = "";
    if (bmi < 18) {
      imageSrc = "assets/images/image1.png";
    } else if (bmi < 25) {
      imageSrc = "assets/images/image2.png";
    } else {
      imageSrc = "assets/images/image3.png";
    }
    return imageSrc;
  }
}
