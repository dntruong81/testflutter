import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dog_model.dart';

late Future<Database> database;

Future<Database> get getDatabase async {
  Future<Database>? _database;
  if (_database != null) return _database;

  // if _database is null we instantiate it
  _database = makeDB();
  return _database;
}
Future<Database> makeDB() async {
  Future<Database> _database = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    //getDatabasesPath(): hàm lấy đường dẫn đến thư mục CSDL
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1,
  );
  return (_database);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    database = getDatabase;
    // TODO: implement createState
    return MyHomePageStage();
  }
}

class MyHomePageStage extends State<MyHomePage> {
  int idValue = 0;
  String nameValue ='';
  int ageValue = 0;

  TextEditingController controllerID = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();

  late List<Dog> listDog;
  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 43,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      appBar: AppBar(
        title: Text('Quan ly thu cung (PET)'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Nhap thong tin thu cung (PET):',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,width: 20,),
            TextField(
              controller: controllerID,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Id:'),

            ),
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name:'),
            ),
            TextField(
              controller: controllerAge,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Age:'),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      idValue = int.parse(controllerID.text);
                      nameValue= controllerName.text;
                      ageValue = int.parse(controllerAge.text);
                      fido = Dog(
                        id: idValue,
                        name: nameValue,
                        age: ageValue,
                      );
                      await insertDog(fido);
                      controllerID.text ='';
                      controllerName.text = '';
                      controllerAge.text = '';
                      setState(() {

                      });
                    },
                    child: Text('Them')),
                ElevatedButton(
                    onPressed: () async {
                      idValue = int.parse(controllerID.text);
                      fido = Dog(
                        id: idValue,
                        name: nameValue,
                        age: ageValue,
                      );
                      print('Delete ID: ${fido.id}');
                      await deleteDog(fido.id);
                      controllerID.text ='';
                      setState(() {

                      });
                    },
                    child: Text('Xoa')
                ),
                ElevatedButton(
                    onPressed: () async {
                      idValue = int.parse(controllerID.text);
                      nameValue= controllerName.text;
                      ageValue = int.parse(controllerAge.text);
                      fido = Dog(
                        id: idValue,
                        name: nameValue,
                        age: ageValue,
                      );
                      print('Update ID: ${fido.id}');
                      await updateDog(fido);
                      controllerID.text ='';
                      controllerName.text = '';
                      controllerAge.text = '';
                      setState(() {

                      });
                    },
                    child: Text('Sua')
                )
              ],
            ),
            SizedBox(height: 20,width: 20,),
            Text('Danh sach thu cung (PET) trong nha:'),
            SizedBox(height: 20,width: 20,),

            FutureBuilder(
                future:  dogs(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.hasError){
                    return  Text('Co loi: ${snapshot.hasError}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData){
                    listDog = snapshot.data;
                    print ('So pha tu CSDL: ${listDog.length}');
                    return ListView.builder(
                        shrinkWrap: true ,
                        itemCount: listDog.length,
                        itemBuilder: (BuildContext context,int i)
                        {
                          Dog _dog = Dog(id:listDog[i].id,name: listDog[i].name,age: listDog[i].age );
                          return Card(child: Text('STT: ${_dog.id} ' ' Ten:  ${_dog.name} ' ' Tuoi:  ${_dog.age}'));
                        }
                    );

                  }
                  return Container(child: Text('done'),);
                }
            )

          ],
        ),
      ),
    );
  }
}

// Define a function that inserts dogs into the database
Future<void> insertDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the dogs from the dogs table.
Future<List<Dog>> dogs() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all the dogs.
  final List<Map<String, Object?>> dogMaps = await db.query('dogs');

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
    'id': id as int,
    'name': name as String,
    'age': age as int,
    } in dogMaps)
      Dog(id: id, name: name, age: age),
  ];
}

Future<void> updateDog(Dog dog) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'dogs',
    dog.toMap(),
    // Ensure that the Dog has a matching id.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'dogs',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}
