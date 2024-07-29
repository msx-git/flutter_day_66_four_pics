import 'package:get/get.dart';

import '../model/word.dart';

class WordController extends GetxController {
  RxList<Word> words = <Word>[
    Word(
      id: "fruit",
      word: "Fruit",
      prompt: "I'm sweet and juicy, and I come in many colors. What am I?",
    ),
    Word(
      id: "ocean",
      word: "Ocean",
      prompt: "I am vast and salty, home to many creatures. What am I?",
    ),
    Word(
      id: "landmark",
      word: "Landmark",
      prompt:
          "I'm a famous building or monument that people travel to see. What am I?",
    ),
    Word(
      id: "animal",
      word: "Animal",
      prompt:
          "I have fur, feathers, or scales, and I can walk, fly, or swim. What am I?",
    ),
    // Word(
    //   id: "job",
    //   word: "Job",
    //   prompt:
    //       "I use my skills to help others, and I might require a special uniform. What am I?",
    // ),
    // Word(
    //   id: "food",
    //   word: "Food",
    //   prompt:
    //       "I can be sweet or savory, and I'm eaten for meals or snacks. What am I?",
    // ),
    // Word(
    //   id: "sport",
    //   word: "Sport",
    //   prompt:
    //       "I involve physical activity and competition, and there are many ways to play me. What am I?",
    // ),
    // Word(
    //   id: "color",
    //   word: "Color",
    //   prompt:
    //       "I can be bright or dark, and I can describe the appearance of things. What am I?",
    // ),
    // Word(
    //   id: "season",
    //   word: "Season",
    //   prompt:
    //       "I bring changes in weather and nature throughout the year. What am I?",
    // ),
    // Word(
    //   id: "holiday",
    //   word: "Holiday",
    //   prompt:
    //       "I'm a special day for celebration, often with traditions and gifts. What am I?",
    // ),
  ].obs;
}
