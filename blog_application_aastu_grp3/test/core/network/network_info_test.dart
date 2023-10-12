import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:blog_application_aastu_grp3/core/network/network_info.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnectionChecker();

    networkInfoImpl =
        NetworkInfoImpl(internetConnectionChecker: mockInternetConnection);
  });

  group('isConnected', () {
    test(
        'shouds forward the call the call to the InternectConnectionChecker.hasConnection',
        () {
      // arrange
      final tHasConnectionFuture = Future.value(true);
      when(mockInternetConnection.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // act
      final result = networkInfoImpl.isConnected;

      verify(mockInternetConnection.hasConnection);
      expect(result, tHasConnectionFuture);

      // assert
    });
  });
}
