import 'package:flutterflame/game/loader.dart';
import 'package:flutterflame/game/utils/cell.dart';
import 'package:flutterflame/game/utils/position.dart';
import 'package:flutterflame/game/utils/row.dart';

class Area {
  Position position;

  List<Row> rows = List<Row>();

  Loader _loader = Loader();

  Area(this.position);

  Future<Area> load() async {
    rows = List<Row>();

    List<List<String>> lines = await _loader.loadMap(position.x.toString() + '-' + position.y.toString());

    for (double y = 0; y < lines.length; y++) {
      Row row = Row();

      for (double x = 0; x < lines.length; x++) {
        row.cells.add(
          Cell(Position(x, y))
        );
      }

      rows.add(row);
    }

    return this;
  }
}
