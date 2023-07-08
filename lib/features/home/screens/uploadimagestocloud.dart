import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagesToCloud extends StatefulWidget {
  const UploadImagesToCloud({super.key});

  @override
  State<UploadImagesToCloud> createState() => _UploadImagesToCloudState();
}

class _UploadImagesToCloudState extends State<UploadImagesToCloud> {
  XFile? _image;
   selectImage() async {
    var im = await ImagePicker().pickImage(source: ImageSource.camera);
    // Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

@override
  void initState() {
    
    super.initState();
    selectImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
      body: Center(
        child: Text("Upload Images"),
      ),
    );
  }
}