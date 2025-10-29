/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/single_product_review_controller.dart';
import '../util/theme.dart';
import '../env.dart';
import '../widget/elevated_button.dart';
import '../widget/star_rating.dart';

class SingleProductReviewScreen extends StatefulWidget {
  const SingleProductReviewScreen({super.key});

  @override
  State<SingleProductReviewScreen> createState() => _SingleProductReviewScreenState();
}

class _SingleProductReviewScreenState extends State<SingleProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleProductReviewController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
            elevation: 0,
            centerTitle: true,
            title: Text('Single Product Review'.tr, style: ThemeProvider.titleStyle),
          ),
          body: value.apiCalled == false
              ? const Center(child: CircularProgressIndicator(color: ThemeProvider.appColor))
              : SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Container(
                      width: double.infinity,
                      decoration: myBoxDecoration(),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: FadeInImage(
                              image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.cover.toString()}'),
                              placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset('assets/images/notfound.png', fit: BoxFit.cover);
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(value.name.toString(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontFamily: 'medium', color: ThemeProvider.blackColor)),
                          const SizedBox(height: 16),
                          Text(
                            'Please rate the quality of product for the order'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16, fontFamily: 'medium', color: ThemeProvider.blackColor),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [StarRating(rating: value.rate, onRatingChanged: (rating) => value.saveRating(rating), color: ThemeProvider.secondaryAppColor)],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Your comments and suggesstions help us improve the service quality better!'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14, fontFamily: 'medium', color: ThemeProvider.greyColor),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: myBoxDecoration(),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CupertinoTextField(cursorColor: ThemeProvider.appColor, controller: value.notesEditor, placeholder: 'Write Notes'.tr, maxLines: 4),
                          ),
                          const SizedBox(height: 20),
                          MyElevatedButton(
                            onPressed: () => value.saveReview(),
                            color: ThemeProvider.appColor,
                            height: 45,
                            width: double.infinity,
                            child: Text('Add Review'.tr, style: const TextStyle(letterSpacing: 1, fontSize: 16, color: ThemeProvider.whiteColor, fontFamily: 'bold')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
