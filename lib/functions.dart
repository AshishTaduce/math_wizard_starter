import 'dart:math';
import 'main.dart';

int randomNumber(){
  int min = 10;
  int max = 100;
  Random _rnd = new Random();
  int r1 = min + _rnd.nextInt(max - min);
  return r1;
}


