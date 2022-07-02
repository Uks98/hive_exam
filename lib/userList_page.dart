import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled1/userList.dart';

import 'hive.dart';

class UserListPage extends StatefulWidget {
  UserListPage({Key? key, required this.inputForm}) : super(key: key);
  InputForm inputForm;

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  final users = <InputForm>[];
  final hiveBox2 = WHive();

  final inputBox2 = Hive.box<InputForm>('inputBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.inputForm.name;
    memoController.text = widget.inputForm.memo;
  }

  @override
  void dispose() {
    nameController.dispose();
    memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text('name'),
                ),
              ),
              TextField(
                controller: memoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('age'),
                ),
              ),
              ElevatedButton(
                onPressed: () {

                  List<InputForm> list = [];
                  hiveBox2.addInputForm(
                      InputForm(
                      id: hiveBox2.newId,
                      name: nameController.text,
                      memo: memoController.text,
                      memoList: list));
                  Navigator.of(context).pop(widget.inputForm);
                  setState(() {});
                },
                child: const Text('add'),
              ),
              ElevatedButton(
                  onPressed: () {
                    int id = 0;
                    if(inputBox2.isNotEmpty){
                      final prevItem = inputBox2.getAt(inputBox2.length -1);
                      if(prevItem != null){
                        id = prevItem.id +1;
                      }
                    }
                    List<InputForm> lists = [];
                    hiveBox2.updateInputForm(
                        key:  id,
                        inputFormDetail: InputForm(
                            id: hiveBox2.newId,
                            name: nameController.text,
                            memo: memoController.text,
                            memoList: lists));
                    Navigator.of(context).pop();
                  },
                  child: Text("수정"))
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
