import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class Loader {
  Future<List<List<String>>> loadMap(String name) async {
    String data = await rootBundle.loadString('assets/world/' + name + '.txt');

    LineSplitter lineSplitter = LineSplitter();
    List<String> lines = lineSplitter.convert(data);

    return lines.map<List<String>>((line) => line.split(''));
  }
}