// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImagePosterModel {
  String imagePath;
  ImagePosterModel({
    required this.imagePath,
  });
}

List<String> listOfPosterImages = [
  ('assets/images/m1.jpg'),
  ('assets/images/m2.jpeg'),
  ('assets/images/m3.jpg'),
  ('assets/images/m4.jpg'),
  ('assets/images/m5.jpeg'),
  ('assets/images/m6.jpeg'),
  ('assets/images/m7.jpeg'),
  ('assets/images/m8.jpeg'),
  ('assets/images/m8.jpg'),
];

List<ImagePosterModel> listOfPoster = [
  ImagePosterModel(imagePath: 'assets/images/m1.jpg'),
  ImagePosterModel(imagePath: 'assets/images/m2.jpeg'),
  ImagePosterModel(imagePath: 'assets/images/m3.jpg'),
  ImagePosterModel(imagePath: 'assets/images/m4.jpg'),
  ImagePosterModel(imagePath: 'assets/images/m5.jpeg'),
  ImagePosterModel(imagePath: 'assets/images/m6.jpeg'),
  ImagePosterModel(imagePath: 'assets/images/m7.jpeg'),
  ImagePosterModel(imagePath: 'assets/images/m8.jpg'),
  ImagePosterModel(imagePath: 'assets/images/m8.jpg'),
];
