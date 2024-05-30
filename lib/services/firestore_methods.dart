import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ghumakkad_2/models/blog_model.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(Uint8List file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    
    Reference ref = _storage.ref().child('blogs/$fileName.jpg');
    print("HII");
    print(ref);

    String id = const Uuid().v1();
    ref = ref.child(id);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

    String downloadUrl = await snapshot.ref.getDownloadURL();
    print("HEREE");
    print(downloadUrl);

    return downloadUrl;
  }

  //upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String title,
    String authorName,
  ) async {
    String res = "Some error occured";
    try {
      String photoUrl = await uploadImageToStorage(file);

      print("DOWNLOAD");
      print(photoUrl);

      String postId = const Uuid().v1();
      Blog blog = Blog(
        description: description,
        title: title,
        authorName: authorName,
        postId: postId,
        postUrl: photoUrl,
      );

      _fireStore.collection('blogs').doc(postId).set(blog.toJson());
      res = "success";
    } catch (err) {
      print(err);
      res = err.toString();
    }
    return res;
  }

  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection("blogs")
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("blogs").get();
  }
}
