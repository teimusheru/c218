import 'package:cloud_firestore/cloud_firestore.dart';



String? getCardId() {
  FirebaseFirestore.instance
      .collection('users')
      .doc('chat')
      .get()
      .then((value) {
    return value['my_cards'][0];
  }).catchError((error) => print("Failed to add user: $error"));
}

Future<String> getDisplayName(String cardId) async {
  DocumentReference card =
      FirebaseFirestore.instance.collection('cards').doc(cardId);
  final String displayName = await card.get().then((DocumentSnapshot res) {
    final data = res.data() as Map<String, dynamic>;
    return data['account']['profiles']['name'];
  }).catchError((error) {
    print("Failed to add user: $error");
    return 'Cannot get name';
  });
  return displayName;
}

Future<DocumentSnapshot> getCard(String cardId) async {
  DocumentReference card =
      FirebaseFirestore.instance.collection('cards').doc(cardId);
  final DocumentSnapshot res = await card.get().catchError((error) {
    print("Failed to add user: $error");
  });
  return res;
}
