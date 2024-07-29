import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/word_controller.dart';
import 'result_screen.dart';

final wordController = Get.put(WordController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController();
  int currentIndex = 0;
  int emptyIndex = 0;
  int diamonds = 0;
  int stars = 0;

  String currentWord = '';
  List currentInputWord = [];
  String options = '';

  setEmpty(word) =>
      currentInputWord = List.generate(word.length, (index) => '');

  setCurrentWord(word) => setState(() => currentWord = word);

  generateOptions(String word) {
    List alphabet = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    alphabet.removeWhere((letter) => currentWord.contains(letter));
    options = currentWord +
        List.generate(
          (word.length.isEven ? 2 : 3),
          (index) => alphabet[Random().nextInt(alphabet.length)],
        ).join();
    var random = options.split('');
    random.shuffle();
    options = random.join();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setCurrentWord(wordController.words[currentIndex].word);
      generateOptions(wordController.words[currentIndex].word);
      setEmpty(wordController.words[currentIndex].word);
    });
  }

  @override
  Widget build(BuildContext context) {
    final words = wordController.words;
    Future.delayed(
      Duration.zero,
      () {
        if (emptyIndex == currentWord.length &&
            currentInputWord.join().toUpperCase() ==
                currentWord.toUpperCase()) {
          print("correct");
          diamonds += 5;
          stars += 10;
          pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
          if (currentIndex == words.length - 1) {
            Get.to(() => ResultScreen(diamonds: diamonds, stars: stars));
          }
        } else if (emptyIndex == currentWord.length) {
          setEmpty(currentWord);
          emptyIndex = 0;
          setState(() {});
        }
      },
    );
    return Obx(
      () {
        return Scaffold(
          body: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/background.svg',
                fit: BoxFit.cover,
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 3.6.h, 15.w, 67.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: const Alignment(-0.1, 1),
                            children: [
                              SvgPicture.asset('assets/images/left.svg'),
                              Text(
                                "$stars",
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: 'Comic',
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff484848),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset('assets/images/center.svg'),
                              Text(
                                '${currentIndex + 1}',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontFamily: 'Comic',
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          Stack(
                            alignment: const Alignment(0.1, 1),
                            children: [
                              SvgPicture.asset('assets/images/right.svg'),
                              Text(
                                '$diamonds',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: 'Comic',
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff484848),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),

                      /// HINT AND DIAMOND
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images/add_hint.svg',
                              ),
                            ),
                            SvgPicture.asset('assets/images/add_diamond.svg'),
                          ],
                        ),
                      ),

                      /// PROMPT
                      Expanded(
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: pageController,
                          itemCount: words.length,
                          onPageChanged: (index) {
                            if (currentIndex != index) {
                              currentIndex = index;
                              setEmpty(words[index].word);
                              emptyIndex = 0;
                              setCurrentWord(words[index].word);
                              generateOptions(words[index].word);
                            }
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                              child: Center(
                                child: Text(
                                  words[index].prompt,
                                  style: TextStyle(
                                    fontFamily: 'Comic',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      /// GUESSING WORD
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 5.w,
                        runSpacing: 5.h,
                        children: [
                          ...List.generate(
                            currentWord.length,
                            (i) {
                              return Container(
                                height: 50.h,
                                width: 50.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: currentInputWord[i] == ''
                                      ? const Color(0xffFFFFFF)
                                          .withOpacity(0.26)
                                      : const Color(0xff3E87FF),
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: const Color(0xff3E87FF),
                                    width: 3.r,
                                  ),
                                ),
                                child: Text(
                                  currentInputWord[i].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24.sp,
                                    fontFamily: 'Comic',
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 66.h),

                      /// OPTIONS
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 8.h,
                        alignment: WrapAlignment.center,
                        children: List.generate(
                          options.length,
                          (i) {
                            return GestureDetector(
                              onTap: emptyIndex < currentWord.length
                                  ? () {
                                      setState(() {
                                        currentInputWord[emptyIndex] =
                                            options[i];
                                        print(currentInputWord);
                                        emptyIndex++;
                                      });
                                    }
                                  : null,
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff3E87FF),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  options[i].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Comic',
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
