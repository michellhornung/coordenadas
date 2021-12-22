import 'package:coordenadas/app_module.dart';
import 'package:coordenadas/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Future<void> loadPage(WidgetTester tester) async {
    final coordPage = ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    );

    await tester.pumpWidget(coordPage);
    await tester.pump();
  }

  testWidgets('Should load with correct initial state', (WidgetTester tester) async {
    await loadPage(tester);

    final imageChildren = find.byType(Image);
    expect(
      imageChildren,
      findsOneWidget,
      reason: 'When screen load image should be available',
    );

    final collectTextChildren = find.descendant(of: find.bySemanticsLabel('Tempo de Coleta (minutos)'), matching: find.byType(Text));
    expect(
      collectTextChildren,
      findsOneWidget,
      reason: 'When a textFormFiel is not pressed should hold hint value',
    );
  });

  testWidgets('Should call Entrar on click ', (WidgetTester tester) async {
    await loadPage(tester);

    final button = find.text('Entrar');
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pump(); // isso gera uma atualizacao da tela
  });
}
