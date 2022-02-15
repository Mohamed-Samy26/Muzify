import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/model.dart';
import '../Models/model.dart';

/// table name UserInfo
/// database path userInfo.db
class LocalDatabase {
  static late Database database;
  static List<UserData> userdata = [];

  static Future<void> createDatabase() async {
    database = await openDatabase('userInfo.db', version: 1,
        onCreate: (database, version) {
      print("Database is created");
      // to create table in database
      database
          .execute(
              'CREATE TABLE UserInfo(email text PRIMARY KEY ,password text)')
          .then((value) {
        print("table is created");
      }).catchError((error) {
        print(error.toString());
      });
    },

        //  open database
        onOpen: (database) {
      print("DataBase is opened");
      getUserData(database);
    });
  }

  static void getUserData(Database database) {
    database.rawQuery('SELECT * FROM UserInfo').then((value) {
      value.forEach((element) {
        userdata.add(UserData(
          /*id: element['id'] as int,*/
          email: element['email'] as String,
          password: element['password'] as String,
        ));
      });
      /*print(userdata[0].id);*/
      print(userdata[0].email);
      print(userdata[0].password);
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<void> insertIntoDatabase(String email, String password) async {
    database.rawInsert('INSERT INTO UserInfo (email, password) VALUES (?,?)',
        [email, password]).then((value) {
      print("Record $value is inserted");
    }).catchError((error) {
      print(error.toString());
    });
  }

  static void updateUserPassword(String email, String password /*, int id*/) {
    database
        .rawUpdate('update table UserInfo set  password =?  where email = ?', [
      password,
      email /*, id*/
    ]).then((value) {
      print(value);
    }).catchError((error) {
      print(error.toString());
    });
  }

  static void deleteDatabase(String email) {
    database
        .rawDelete('DELETE UserInfo WHERE email = ?', [email]).then((value) {
      print(value);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
