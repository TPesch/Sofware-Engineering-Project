import '../../lib/providers/cocktail-provider.dart';
import '../../lib/services/google_sheets_integration.dart';
import '../../lib/services/authentications.dart';

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
