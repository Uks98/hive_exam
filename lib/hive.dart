import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/userList.dart';


class WHive{
  Box<InputForm>? _inputForm;

  //getter 접근 제어자 사용해서 _inputForm 접근
  Box<InputForm> get inputForm {
    _inputForm ??= Hive.box<InputForm>(HiveBox.InputForm);
    return _inputForm!;
  }
  Future<void> initializeHive()async{
    await Hive.initFlutter();
    Hive.registerAdapter<InputForm>(InputFormAdapter());
    await Hive.openBox<InputForm>(HiveBox.InputForm);
  }
  void addInputForm(InputForm inputForms) async {
    int key = await inputForm.add(inputForms);

    log('[addInputForm] add (key:$key) $inputForm');
    log('result ${inputForm.values.toList()}');
  }
  void updateInputForm({
    required int key,
    required InputForm inputFormDetail,
  }) async {
    //동일한 키 값일떄는 put은 업데이트를 수행한다
    await inputForm.put(key, inputFormDetail);

    log('[updateMedicine] update (key:$key) $inputForm');
  }
  int get newId {
    final lastId = inputForm.values.isEmpty ? 0 : inputForm.values.last.id; //빈 리스트에는 last 값이 없기때문에 상항연산자 처리
    return lastId + 1;
  }
}

class HiveBox{
  static const String InputForm = "inputBox";
}

