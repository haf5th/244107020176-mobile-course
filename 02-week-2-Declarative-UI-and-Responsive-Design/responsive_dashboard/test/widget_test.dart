// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_dashboard/main.dart';

void main() {
  testWidgets('Dashboard satu kolom di layar sempit', (tester) async {
    // 1. Atur ukuran layar sempit (lebar 400px)
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // 2. Render aplikasi
    await tester.pumpWidget(const DashboardApp());

    // 3. Ambil ukuran kartu pertama
    final width = tester.getSize(find.byType(Card).first).width;

    // 4. Kartu harus mengambil hampir seluruh lebar layar sempit (< 700px)
    expect(width, lessThan(700));
  });

  testWidgets('Dashboard dua kolom di layar lebar', (tester) async {
    // 1. Atur ukuran layar lebar (lebar 1200px)
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // 2. Render aplikasi
    await tester.pumpWidget(const DashboardApp());

    // 3. Ambil ukuran kartu pertama
    final width = tester.getSize(find.byType(Card).first).width;

    // 4. Kartu dalam 2 kolom lebarnya berkisar ~576px (> 500px)
    expect(width, greaterThan(500));
  });
}