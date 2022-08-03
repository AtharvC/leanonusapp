import 'package:flutter/material.dart';
import 'package:leanonusapp/db/setupDatabase.dart';

void main() {
  runApp(const ChapterPage());
}

class ChapterPage extends StatefulWidget {
  const ChapterPage({Key? key}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  late MyDatabase _db;
  @override
  void initState() {
    super.initState();

    _db = MyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: _db.getUsers(),
        builder: (context, snapshot) {
          final List<User>? users = snapshot.data;

          if(snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if(users != null) {
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: Column(
                      children: [
                        Text(user.id.toString()),
                        Text(user.name.toString()),
                        Text(user.category.toString()),
                      ],
                    ),
                  );
            });
          }

          return const Text('No data found');
        },
      ),
    );
  }
}
