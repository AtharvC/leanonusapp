import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'setupDatabase.g.dart';

// this will generate a table called "users" for us. The rows of that table will
// be represented by a class called "Todo".
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  IntColumn get category => integer().nullable()();
}

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.
@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Users, Categories])
class MyDatabase extends _$MyDatabase {
    // we tell the database where to store the data with this constructor
    MyDatabase() : super(_openConnection());

    // you should bump this number whenever you change or add a table definition.
    // Migrations are covered later in the documentation.
    @override
    int get schemaVersion => 1;

    Future<List<User>> getUsers() async {
      return await select(users).get();
    }

    Future<User> getUser(int id) async {
      return await (select(users)..where((tbl) => tbl.id.equals(id))).getSingle();
    }

    Future<bool> updateUser(UsersCompanion entity) async {
      return await update(users).replace(entity);
    }

    Future<int> insertUser(UsersCompanion entity) async {
      return await into(users).insert(entity);
    }

    Future<int> deleteUser(int id) async {
      return await (delete(users)..where((tbl) => tbl.id.equals(id))).go();
    }
  }

  LazyDatabase _openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
}