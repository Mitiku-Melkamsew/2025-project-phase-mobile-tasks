import 'dart:io';

String fixture(String name) => File('test/helper/fixtures/$name').readAsStringSync();