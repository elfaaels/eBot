import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PathProviderUtils {
  Future<String> saveImage(File imageFile) async {
    // Get the application's document directory
    final directory = await getApplicationDocumentsDirectory();

    // Create a path to save the image
    final path = '${directory.path}/my_saved_image.jpg';

    // Save the image to the path
    final savedImage = await imageFile.copy(path);

    return savedImage.path; // Return the saved image path
  }
}
