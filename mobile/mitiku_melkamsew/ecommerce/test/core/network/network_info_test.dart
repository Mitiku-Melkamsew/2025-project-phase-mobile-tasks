import 'package:ecommerce/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mocks.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp((){
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('is connected', () {
    test('Should call internet connection checker has connection when is connected is called on network info', () async{
      final tHasFutureValue = Future.value(true);
      when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) => tHasFutureValue);

      final result = networkInfoImpl.isConnected;

      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, tHasFutureValue);
    });
  });
}