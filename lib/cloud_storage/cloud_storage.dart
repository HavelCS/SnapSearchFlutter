import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CloudStorage{
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
     Future<String> uploadImage(XFile image, String childname, bool isPost, String id) async {
    Reference ref =
        firebaseStorage.ref().child(childname).child(id);

    if (isPost == true) {
      String uid = const Uuid().v1();
      ref = ref.child(uid);
    }
    await ref.putFile(File(image.path));
    return await ref.getDownloadURL();
  }

}