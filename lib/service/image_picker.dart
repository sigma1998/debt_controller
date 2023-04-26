import 'package:image_picker/image_picker.dart';

pickImage() async {
  ImagePicker picker = ImagePicker();
  final file = await picker.pickImage(source: ImageSource.gallery);
  if(file == null) return null;
  return file.path;
}