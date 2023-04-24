import 'package:debt_controller/db/local/client/client_dao.dart';
import 'package:debt_controller/db/local/debt/debt_dao.dart';
import 'package:debt_controller/db/local/debt/debt_entity.dart';
import 'package:floor/floor.dart';

import 'client/client_entity.dart';

import 'dart:async'; // added
import 'package:sqflite/sqflite.dart' as sqflite; // added
part 'local_database.g.dart';

@Database(version: 1, entities: [DebtModel, ClientData])
abstract class AppLocalDatabase extends FloorDatabase {
  ClientDao get clientDao;
  DebtDao get debtDao;
}