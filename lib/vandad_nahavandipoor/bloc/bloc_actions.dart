import 'package:flutter/foundation.dart' show immutable;

import '/vandad_nahavandipoor/bloc/person.dart';

// enum PersonUrl {
//   persons1,
//   persons2,
// }

// extension UrlString on PersonUrl {
//   String get urlString {
//     switch (this) {
//       case PersonUrl.persons1:
//         return 'http://10.0.2.2:5500/lib/vandad_nahavandipoor/api/persons1.json';
//       case PersonUrl.persons2:
//         return 'http://10.0.2.2:5500/lib/vandad_nahavandipoor/api/persons2.json';
//     }
//   }
// }

const person1Url =
    'http://10.0.2.2:5500/lib/vandad_nahavandipoor/api/persons1.json';
const person2Url =
    'http://10.0.2.2:5500/lib/vandad_nahavandipoor/api/persons2.json';

typedef PersonsLoader = Future<Iterable<Person>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final String url;
  final PersonsLoader loader;

  const LoadPersonsAction({
    required this.url,
    required this.loader,
  }) : super();
}
