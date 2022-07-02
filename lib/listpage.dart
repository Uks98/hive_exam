import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/hive.dart';
import 'package:untitled1/userList.dart';
import 'package:untitled1/userList_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}
final hiveBox = WHive();
final inputBox = Hive.box<InputForm>('inputBox');
final users = inputBox.values.toList();
List<InputForm> userList = [];
class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UserListPage(
                    inputForm: InputForm(id: 0, name: "", memo: "",memoList: userList),
                  ),
                ),
              ).then((list) {
            setState(() {
            users.add(list);
            });
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("하이브연습"),
      ),
      body: ValueListenableBuilder(
        valueListenable: inputBox.listenable(),
        builder: (context,Box<InputForm> box,_) {
          return Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Expanded(
                    child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          print(users);
                          return ListTile(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserListPage(
                                inputForm: InputForm(id: hiveBox.newId, name: users[index].name, memo:users[index].memo, memoList: userList),
                              )));
                            },
                            title: Text(users[index].name),
                            subtitle: Text(users[index].memo),
                          );
                        }))
              ],
            ),
          );
        }
      ),
    );
  }
}
