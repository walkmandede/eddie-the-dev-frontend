import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eddie_the_dev_frontend/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<DocumentReference> saveADocument({required String collectionId, required Map<String, dynamic> data}) async {
    return await FirebaseFirestore.instance.collection(collectionId).add(data);
  }

  Future<QuerySnapshot> getDocuments({required String collectionId}) async {
    return await FirebaseFirestore.instance.collection(collectionId).get();
  }
}
