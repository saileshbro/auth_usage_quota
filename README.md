# auth_usage_quota

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

An example application built with dart_frog

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

# Initial Setup

1. Install [Dart](https://dart.dev/get-dart)
2. Install [dart_frog](https://pub.dev/packages/dart_frog)

# Running the App

1. Get `service-account.json` from the firebase console and place it in the root of the project.
1. Run `dart pub get` in the root of the project
1. Check `db_constants.dart` and update the collection names if needed
1. Run `dart_frog dev` in the root of the project
1. Open `http://localhost:8080` in REST client of your choice (e.g. [Postman](https://www.postman.com/))

# Routes

The following routes are available which require a `Authorization` header with a valid token.

1. `/process` - POST - Processes the json body and deducts the quota from the user
2. `/quota` - GET - Returns the quota for the user
