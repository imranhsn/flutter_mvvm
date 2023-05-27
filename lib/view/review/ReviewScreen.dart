import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/notification/NotificationMain.dart';
import '../../res/style/TextStyles.dart';
import '../widget/RadioSlider.dart';

class ReviewScreen extends StatefulWidget {
  static final String id = "review_screen";

  final NotificationModel? notificationData;

  ReviewScreen(this.notificationData);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<File> _selectedImages = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImages.add(File(pickedImage.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  Widget _buildReviewImages() {
    return Column(
      children: List.generate(_selectedImages.length, (index) {
        return Stack(
          children: [
            Container(
              child: ClipRRect(
                child: Image.file(
                  _selectedImages[index],
                  height: 158,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 16,
                  ),
                  onPressed: () => _removeImage(index),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Add Review", style: TextStyles.appTitle),
                        Text("Choose at least 4 pictures.",
                            style: TextStyles.body),
                        RadioSlider(),
                        SizedBox(height: 10),
                        Text(
                          "Review",
                          style: TextStyles.title
                              .copyWith(color: Color(0xff3c3c43)),
                        ),
                        SizedBox(height: 10),
                        Container(
                          color: Color(0xffebebf5),
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "\"${widget.notificationData!.description.toString()}\"",
                            style: TextStyles.title,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: _pickImage,
                          child: Image.asset("assets/images/img_picker.png"),
                        ),
                        _buildReviewImages(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 50,
                width: 104,
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 50,
              width: 104,
              decoration: BoxDecoration(
                color: Color(0xff0057ff),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
