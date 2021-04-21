import 'dart:io';
import 'dart:math';

import 'package:Notely/screens/ToTest.dart';
import 'package:test/test.dart';

void main(){
  test("tests add function", (){
    var expected = 10;
    var actual = add(2, 8);
    expect(actual, expected);
  });

  test("tests subtract function", (){
    var expected = 4;
    var actual = subtract(6, 2);
    expect(actual, expected);
    
    expected = 8;
    actual = subtract(4, -4);
    expect(actual, expected);
    
    expected = 0;
    actual = subtract(-3, -3);
    expect(actual, expected);
  });

  test("test multiply function", (){
    var expected = 4;
    var actual = multiply(2, 2);
    expect(actual, expected);
  });

  test("tests forLoop function", (){
    var expected = 16;
    var actual = forLoop(1, 3);
    expect(actual, expected);
  });

  test("tests whileLoop function", (){
    var expected = 4;
    var actual = whileLoop(4, 5);
    expect(actual, expected);

    expected = null;
    actual = whileLoop(3, -88);
    expect(actual, expected);

    actual = whileLoop(0, 4);
    expect(actual, expected);
  });

  test("tests ifStatement function", (){
    var expected = true;
    var actual = ifStatement(6, 5);
    expect(actual, expected);

    expected = false;
    actual = ifStatement(-3, 700);
    expect(actual, expected);
  });

}