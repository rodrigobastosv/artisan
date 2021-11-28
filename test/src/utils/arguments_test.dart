import 'package:flutter_test/flutter_test.dart';
import 'package:artisan/artisan.dart';

void main() {
  late Arguments arguments;

  setUp(
    () {
      arguments = Arguments(
        uri: Uri.parse('/test'),
        params: const {
          'param1': 1,
        },
        data: 1,
      );
    },
  );

  group(
    'copyWith',
    () {
      test(
        'get default arguments',
        () {
          final argsCopy = arguments.copyWith();

          expect(argsCopy.uri, Uri.parse('/test'));
          expect(
            argsCopy.params,
            {
              'param1': 1,
            },
          );
          expect(argsCopy.data, 1);
        },
      );

      test(
        'get given arguments',
        () {
          final argsCopy = arguments.copyWith(
            uri: Uri.parse('/changed'),
            params: const {
              'param2': 2,
            },
            data: 2,
          );

          expect(argsCopy.uri, Uri.parse('/changed'));
          expect(
            argsCopy.params,
            {
              'param2': 2,
            },
          );
          expect(argsCopy.data, 2);
        },
      );
    },
  );

  group(
    'queryParams',
    () {
      test(
        'should return query params when uri has then',
        () {
          final argumentsQueryParam = arguments.copyWith(
            uri: Uri.parse('/test?q=1'),
          );
          final queryParams = argumentsQueryParam.queryParams;

          expect(
            queryParams,
            {'q': '1'},
          );
        },
      );

      test(
        'should return empty map when uri has no query params',
        () {
          expect(arguments.queryParams, {});
        },
      );
    },
  );

  test(
    'props',
    () {
      final sameArguments = arguments.copyWith();
      expect(arguments == sameArguments, true);

      const otherArguments = Arguments();
      expect(arguments == otherArguments, false);
    },
  );
}
