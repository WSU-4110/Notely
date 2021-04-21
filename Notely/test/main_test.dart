import 'package:Notely/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  
  test('Testing if text is entered in search bar', () async{
    var textField = find.byWidget(SearchBar);
    await driver.tap(textField);
    await driver.enterText('notes');
    await driver.waitFor(find.text('notes'));
  });

  testWidgets('Testing if hamburger menu opens', (tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage(key: Key('1'), title: 'Notely')));
    await tester.tap(Drawer);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);
  });

  testWidgets('Testing if profile page is opened', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage(key: Key('1'), title: 'Notely')));
    await tester.tap(find.byIcon(Icons.account_circle));
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('Testing if favorites page is opened', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage(key: Key('1'), title: 'Notely')));
    await tester.tap(find.byIcon(Icons.book_onlined));
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });

  testWidgets('Testing if settings page is opened', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage(key: Key('1'), title: 'Notely')));
    await tester.tap(find.byIcon(Icons.settings));
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
 
  testWidgets('Testing if camera button opens camera', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage(key: (Key('1'), title: 'Notely'))));
    await tester.tap(find.byIcon(Icons.add_a_photo).first);
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.byIcon(Icons.add_a_photo), findsNothing);
  });
  
}
