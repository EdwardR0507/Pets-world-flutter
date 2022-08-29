import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function()? onTap;
  const CustomCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      child: Column(children: [
        GestureDetector(
            onLongPress: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
                      opacity: animation,
                      child: PreviewImage(image: image),
                    ),
                  ),
                ),
            child: Image.network(image, fit: BoxFit.cover)),
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 20)),
          subtitle: Text(
            description,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: onTap,
        ),
      ]),
    );
  }
}

class PreviewImage extends StatelessWidget {
  const PreviewImage({required this.image, Key? key}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Material(
        color: Colors.black.withOpacity(0.3),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 1.0, end: 0.0),
          builder: (_, __, child) {
            return child!;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: Get.width * 0.8,
                  child: InteractiveViewer(
                    maxScale: 5,
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
