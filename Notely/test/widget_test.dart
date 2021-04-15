// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:js';

import 'package:Notely/screens/home/home.dart';
import 'package:Notely/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Settings Page should open properly from the homepage', () {
    openSettings(context);
    expect(testVal, 1);
  });
}
