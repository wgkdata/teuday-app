import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _answersCollection = _firestore.collection('answers');

class AnswersService {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAnswers() {
    return _answersCollection.snapshots();
  }

  // static Future<void> updateAnswer({
  //   required String question,
  //   required String answer,
  //   required String id,
  // }) async {
  //   DocumentReference answer = _answersCollection.doc(id);
  //
  //   Map<String, dynamic> data = {
  //     'question': question,
  //     'answer': answer,
  //   };
  //
  //   await answer
  //       .update(data)
  //       .whenComplete(() => print('Nota atualizada'))
  //       .catchError((e) => print(e));
  // }

  static Future<void> addAnswer({
    required String question,
    required String answ,
    required String? userInfo,
    required String year

  }) async {
    DocumentReference answer = _answersCollection.doc();

    Map<String, dynamic> data = {
      'question': question,
      'answ': answ,
      'userInfo': userInfo,
      'year': year
    };

    await answer
        .set(data)
        .whenComplete(() => print('Resposta atualizada'))
        .catchError((e) => print(e));
  }

//   static Future<void> deleteAnswer({required String id}) async {
//     DocumentReference answer = _answersCollection.doc(id);
//     await answer
//         .delete()
//         .whenComplete(() => print('Resposta removida'))
//         .catchError((e) => print(e));
//   }
}