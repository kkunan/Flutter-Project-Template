import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';

import 'internet_connection_datasource_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late MockConnectivity connectivity;
  late ConnectivityPlusInternetConnectionDatasource datasource;

  setUp(() {
    connectivity = MockConnectivity();
    datasource = ConnectivityPlusInternetConnectionDatasource(connectivity);
  });

  group('isConnected should return true', () {
    ConnectivityPlusInternetConnectionDatasource.connectedTypes
        .forEach((connectedType) {
      test('if type is $connectedType', () async {
        // arrange
        when(connectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(connectedType));

        // act
        final isConnected = await datasource.isConnected();

        // assert
        expect(isConnected, true);
      });
    });
  });

  group('isConnected should return false', () {
    final disconnectedTypes = ConnectivityResult.values.where((element) =>
        !ConnectivityPlusInternetConnectionDatasource.connectedTypes
            .contains(element));

    disconnectedTypes.forEach((connectedType) {
      test('if type is $connectedType', () async {
        // arrange
        when(connectivity.checkConnectivity())
            .thenAnswer((_) => Future.value(connectedType));

        // act
        final isConnected = await datasource.isConnected();

        // assert
        expect(isConnected, false);
      });
    });
  });
}
