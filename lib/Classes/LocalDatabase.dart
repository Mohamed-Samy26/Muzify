import 'package:sqflite/sqflite.dart';
//

class LocalDatabase {

  static late Database database;
  static List<Data> data =[];
  // create Database
  // create Table
  // open Database
  // insert into Database
  // get from Database
  // update
  // delete

  static Future<void> creatDatabase() async {
    database = await openDatabase('test.db', version: 1,
        onCreate: (database, version) {
      print("Database is created !!");
      database
          .execute('CREATE TABLE Test (email text PRIMARY KEY, password text)')
          .then((value) {
            print('TABLE IS CREATED !!');
            LocalDatabase.insertDatabase('admin', 'admin');
          }).
          catchError((error){
            print(error.toString());
          });
        },

        onOpen: (database){
          print ('Database is open !!');
          insertDatabase('admin', 'admin');
          getData(database);
        }

    );


  }

  static void getData(Database database){
    database.rawQuery(
        'SELECT * FROM Test'
    ).
    then((value) {
      for (var element in value) {
        data.add(Data(
          email: element['email'] as String,
          password: element['password'] as String,
        ));
      }
    }).catchError((error){
      print(error.toString());
    });
  }


  static Future<void> insertDatabase(String email , String password)async{
    database.rawInsert(
        'INSERT INTO Test (email, password) VALUES ( ?,? )',[email,password]
    ).
    then((value) {
      print("Record $value is inserted !!");
    }).catchError((error){
      print ( error.toString());
    });
  }

  static void updateDatabase(String email, String password, int id){
    database.rawUpdate(
        'update table Test set email = ?, password =?  where id = ?',[email,password,id]
    ).
    then((value){
      print(value);
    }).
    catchError((error){
      print(error.toString());
    });


  }

  static void deleteDatabase(int id){
    database.rawDelete(
        'DELETE Test WHERE id = ?' ,[id]
    ).then((value){
      print(value);
    }).catchError((error){
      print(error.toString());
    });
  }

}

class Data {
  final String email;
  final String password;

  Data({required this.email,required this.password});
}