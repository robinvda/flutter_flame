import 'package:flutterflame/game/area.dart';
import 'package:flutterflame/game/utils/cell.dart';
import 'package:flutterflame/game/utils/position.dart';
import 'package:flutterflame/game/utils/row.dart';

class World {

  List<Area> areas = List<Area>();

  void init(int size) {

    areas.add(makeArea(size));

    //

  }

  Area makeArea(int size) {
    Area area = Area(
      Position(0, 0)
    );

    for (double i = 0; i < size; i++) {
      area.rows.add(makeRow(i, size));
    }

    //

    return area;
  }

  Row makeRow(double y, int size) {
    Row row = Row();

    for (double i = 0; i < size; i++) {
      row.cells.add(makeCell(i, y));
    }

    //

    return row;
  }

  Cell makeCell(double x, double y) {
    Cell cell = Cell(Position(x, y));

    //

    return cell;
  }

}