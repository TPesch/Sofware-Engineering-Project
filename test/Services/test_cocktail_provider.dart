// ignore_for_file: override_on_non_overriding_member

import 'package:NewFolderName/providers/cocktail-provider.dart';
import 'package:NewFolderName/Services/google_sheets_integration.dart';
import 'package:NewFolderName/services/authentications.dart';

class TestCocktailProvider extends CocktailProvider {
  final GoogleSheetsService testSheetsService;
  final AuthService testAuthService;

  TestCocktailProvider({
    required this.testSheetsService,
    required this.testAuthService,
  }) : super();

  // Override methods in CocktailProvider to use test services
  @override
  GoogleSheetsService get _sheetsService => testSheetsService;

  @override
  AuthService get _authService => testAuthService;
}
