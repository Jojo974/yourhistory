import 'package:flutter/material.dart';
import 'quizzi/question.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Your history"),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 255, 233, 233),
        body: SafeArea(
          child: QuizzApp(),
        ),
      ),
    ),
  );
}

//Création de la classe QuizzApp
class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

//Création de la classe _QuizzAppState
class _QuizzAppState extends State<QuizzApp> {
  int numeroQuestion = 0;
  List<Icon> listIcon = [];

  //Création d'une liste avec le constructeur "Question" qui aura les paramètres requis
  List<Question> listQuestion = [
    Question(
        "Vous venez de crevez un pneu à St André. Vous n'avez pas de téléphone vous décidez de faire du stop. Une ford fiesta rouge s'arrête et le conducteur vous demande si vous voulez qu'il vous dépanne",
        "Vous lui remerciez et vous montez dans la voiture",
        "Vous lui demandez s'il n'est pas un meurtrier avant !"),
    Question(
        "Il acquiesce de la tête sans faire attention à la question.",
        "Au moins il est honnête. Vous montez !",
        "Attends, mais je sais comment changer un pneu voyons !"),
    Question(
        "Lorsqu'il commence à conduire, il vous demande d'ouvrir la boite à gant. À l’intérieur, vous trouverez un couteau ensanglanté, deux doigts coupés et un CD de T-Matt.",
        "J'adore T-Matt, je lui donne le CD.",
        "C'est lui ou moi, je prends le couteau et je le poignarde."),
    Question("Woaw ! Quelle évasion ! ", "Recommencer", ""),
    Question(
        "En traversant la route du littoral, vous réfléchissez à la sagesse douteuse de poignarder quelqu’un pendant qu’il conduit une voiture dans laquelle vous êtes.",
        "Recommencer",
        ""),
    Question(
        "Vous vous faites un bon dalon et vous chantez le dernier son de T-matt ensemble. Il vous dépose à Cambaie et il vous demande si vous connaissez un bon endroit pour jeter un corps.",
        "Recommencer",
        "")
  ];

  // Variable pour mettre visible ou non le deuxième bouton
  bool VisibilityVerif = true;

  // Fonction "click" permet de changer de page en fonction du choix
  click(bool b) {
    if (numeroQuestion == 0) {
      if (b == true) {
        setState(() {
          numeroQuestion = 2;
          VisibilityVerif = true;
        });
      } else {
        setState(() {
          numeroQuestion = 1;
          VisibilityVerif = true;
        });
      }
    } else if (numeroQuestion == 2) {
      if (b == true) {
        setState(() {
          numeroQuestion = 4;
          VisibilityVerif = false;
        });
      } else {
        setState(() {
          numeroQuestion = 5;
          VisibilityVerif = false;
        });
      }
    } else if (numeroQuestion == 1) {
      if (b == true) {
        setState(() {
          numeroQuestion = 2;
          VisibilityVerif = true;
        });
      } else {
        setState(() {
          numeroQuestion = 3;
          VisibilityVerif = false;
        });
      }
    } else if (numeroQuestion == 4 ||
        numeroQuestion == 3 ||
        numeroQuestion == 5) {
      if (b == true) {
        setState(() {
          numeroQuestion = 0;
          VisibilityVerif = true;
        });
      } else {
        //
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                listQuestion[numeroQuestion].enonce,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              // Appel de notre fonction dans le cas où la fonction click retourne une réponse "true"
              onPressed: () => click(true),
              child: Text(
                listQuestion[numeroQuestion].reponse1,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Visibility(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                // Appel de notre fonction dans le cas où la fonction click retourne une réponse "false"
                onPressed: () => click(false),
                child: Text(
                  listQuestion[numeroQuestion].reponse2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Permet de déterminser si la visibité est sur true ou false selon la réponse choisie
              visible: VisibilityVerif,
            ),
          ),
          Row(
            children: listIcon,
          )
        ],
      ),
    );
  }
}
