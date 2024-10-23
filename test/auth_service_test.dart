import 'package:ebot/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_service_test.mocks.dart';

import 'firebase_mock.dart';

// Setup the service locator for tests
void setupTestLocator(FirebaseAuth mockFirebaseAuth) {
  GetIt.I.registerLazySingleton<FirebaseAuth>(() => mockFirebaseAuth);
  GetIt.I.registerLazySingleton<AuthService>(
      () => AuthService(GetIt.I<FirebaseAuth>()));
}

@GenerateMocks([FirebaseAuth, UserCredential, User, AuthService])
void main() {
  setupFirebaseAuthMocks();

  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebaseAuth mockFirebaseAuth;
  // late MockUserCredential mockUserCredential;
  // late MockUser mockUser;
  late AuthService authService;

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    setupTestLocator(mockFirebaseAuth);
    // mockUserCredential = MockUserCredential();
    // mockUser = MockUser();
    authService = GetIt.I<AuthService>();
  });

  tearDown(() {
    GetIt.I.reset();
  });

  test('Register user fails with weak password', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
      email: 'dev@example.com',
      password: '123',
    )).thenThrow(FirebaseAuthException(code: 'weak-password'));

    expect(
      () async => await authService.register(
        email: 'dev@example.com',
        password: '123',
        username: 'itsdevyo',
      ),
      throwsA('The password provided is too weak.'),
    );
  });
}
