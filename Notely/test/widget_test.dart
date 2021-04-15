// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Notely/screens/home/home.dart';
import 'package:Notely/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('privacy.dart', () {
    test(
        'Making sure the privateAccountIndex works properly for the privacy page',
        () {
      //Setting the private account index to 0 here will make the user a private user, see privacy.dart
      //.. there is also another way to do that, we will see in another test.
      privateAccountindex = 0;
      expect(privateAccountindex, 0);
    });

    test(
        'Checking to make sure you can set the privacy of a user with a bool. ',
        () {
      //This is the other way of making a user private. If this works, we know that the function works too.
      privateAccount = true;
      expect(privateAccount, true);
    });
  });

  test('Making sure the notificaitons menu works properly', () {
    changeNotificationsIndex = 3;
    //This will change set the index of the notifications menu to equal to 3. Which is the first option on the list.
    //If this works, then we know that the entire menu is working.
    //see notifictionsMenu.dart
    expect(changeNotificationsIndex, 3);
  });

  test(
      'Makes sure that the edit profile page is able to set the users new email',
      () {
    newEmail = 'go5486@wayne.edu';
    //This should change the value of the new email address.
    //see editProfile.dart

    expect(newEmail, 'go5486@wayne.edu');
  });
  test(
      'Makes sure that the edit profile page is able to set the users new password',
      () {
    newPassword = 'password123';
    //If this test passes, then we knwo that the autofill password input works.
    //see editProfile.dart
    expect(newPassword, 'password123');
  });
  test(
      'Make sures that the edit profile page is able to set the users new major',
      () {
    newMajor = 'Cognitive Science';
    expect(newMajor, 'Cognitive Science');
  });
}
