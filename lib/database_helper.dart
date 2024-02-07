import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dataBaseName = 'diaryApplicationDB.db';
  static const dataBaseVersion = 15;
  static const dataBaseDiaryTable = '_diaryTable';
  static const dataBaseBasicInfoTable = '_basicInfo';
  static const dataBaseMedicalInfoTable = '_medicalInfo';
  static const dataBaseEmployInfoTable = '_employInfo';

  //diarytable
  static const columnId = '_id';
  static const columnTitle = '_title';
  static const columnDescription = '_description';
  static const columnDateTime = '_dateTime';

  //basic information table
  static const columnBasicName = '_basicName';
  static const columnBasicPhone = '_basicPhone';
  static const columnBasicDOB = '_basicdob';
  static const columnBasicAge = '_basicAge';
  static const columnBasicAddress = '_basicAddress';
  static const columnBasicCity = '_basicCity';
  static const columnBasicState = '_basicState';
  static const columnBasicZIP = '_basicZip';
  static const columnBasicLicense = '_basicLicense';
  static const columnBasicContact = '_basicContact';
  static const columnBasicBloodGroup = '_basicBloodGroup';

  //medical information table
  static const columnMedicalName = '_medicalName';
  static const columnMedicalAddress = '_medicalAddress';
  static const columnMedicalCity = '_medicalCity';
  static const columnMedicalState = '_medicalState';
  static const columnMedicalZIP = '_medicalZip';
  static const columnMedicalPhone = '_medicalPhone';
  static const columnMedicalEmail = '_medicalEmail';
  static const columnMedicalPolicy = '_medicalPolicy';
  static const columnMedicalInsurance = '_medicalInsurance';

  //employ information table
  static const columnEmployName = '_employName';
  static const columnEmployCity = '_employCity';
  static const columnEmployState = '_employState';
  static const columnEmployAddress = '_employAddress';
  static const columnEmployZIP = '_employZip';
  static const columnEmployPhone = '_employPhone';
  static const columnEmployEmail = '_employEmail';

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, dataBaseName);

    _db = await openDatabase(
      path,
      version: dataBaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
      CREATE TABLE $dataBaseDiaryTable (
      $columnId INTEGER PRIMARY KEY,
      $columnTitle TEXT,
      $columnDescription TEXT,
      $columnDateTime TEXT
      )
   ''');
    await database.execute('''
      CREATE TABLE $dataBaseBasicInfoTable (
      $columnId INTEGER PRIMARY KEY,
      $columnBasicName TEXT,
      $columnBasicPhone TEXT,
      $columnBasicDOB TEXT,
      $columnBasicAge TEXT,
      $columnBasicAddress TEXT,
      $columnBasicCity TEXT,
      $columnBasicState TEXT,
      $columnBasicZIP TEXT,
      $columnBasicLicense TEXT,
      $columnBasicContact TEXT,
      $columnBasicBloodGroup TEXT
      )
   ''');
    await database.execute('''
      CREATE TABLE $dataBaseMedicalInfoTable (
      $columnId INTEGER PRIMARY KEY,
      $columnMedicalName TEXT,
      $columnMedicalAddress TEXT,
      $columnMedicalCity TEXT,
      $columnMedicalState TEXT,
      $columnMedicalZIP TEXT,
      $columnMedicalPhone TEXT,
      $columnMedicalEmail TEXT,
      $columnMedicalPolicy TEXT,
      $columnMedicalInsurance TEXT
      )
   ''');
    await database.execute('''
      CREATE TABLE $dataBaseEmployInfoTable (
      $columnId INTEGER PRIMARY KEY,
      $columnEmployName TEXT,
      $columnEmployAddress TEXT,
      $columnEmployCity TEXT,
      $columnEmployState TEXT,
      $columnEmployZIP TEXT,
      $columnEmployPhone TEXT,
      $columnEmployEmail TEXT
      )
   ''');
  }

  Future _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('DROP TABLE $dataBaseDiaryTable');
    await database.execute('DROP TABLE $dataBaseBasicInfoTable');
    await database.execute('DROP TABLE $dataBaseMedicalInfoTable');
    await database.execute('DROP TABLE $dataBaseEmployInfoTable');
    _onCreate(database, newVersion);
  }

//insert
  Future<int> insertDiaryDetails(
      Map<String, dynamic> row, String tableName) async {
    return await _db.insert(tableName, row);
  }

//display
  Future<List<Map<String, dynamic>>> getDiaryDetails(String tableName) async {
    return await _db.query(tableName);
  }

//update
  Future<int> updateDiaryDetails(
      Map<String, dynamic> row, String tableName) async {
    int id = row[columnId];
    return await _db.update(
      tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  //delete
  Future<int> deleteDiaryDetails(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
