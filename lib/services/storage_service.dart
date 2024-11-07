import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadImage(String userId) async {
    try {
      // Pick image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;

      // Create file reference
      final String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${path.basename(image.path)}';
      final Reference ref =
          _storage.ref().child('cocktail_images/$userId/$fileName');

      // Upload file
      final UploadTask uploadTask = ref.putFile(File(image.path));
      final TaskSnapshot taskSnapshot = await uploadTask;

      // Get download URL
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }
}
