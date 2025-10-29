/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/handyman_profile_controller.dart';
import '../controller/search_controller.dart';
import '../env.dart';
import '../helper/router.dart';
import '../util/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSearchController>(
      builder: (value) {
        return Scaffold(
          backgroundColor: ThemeProvider.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
            elevation: 0,
            centerTitle: true,
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Colors.transparent,
              child: Container(
                decoration: myBoxDecoration(),
                child: TextField(
                  controller: value.searchController,
                  onChanged: value.searchProducts,
                  style: const TextStyle(fontSize: 16, fontFamily: 'medium'),
                  cursorColor: ThemeProvider.appColor,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    iconColor: ThemeProvider.appColor,
                    hintText: 'Search Here'.tr,
                    hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                ),
              ),
            ),
          ),
          body: value.isEmpty.isFalse && value.result.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i in value.result)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: InkWell(
                            onTap: () {
                              Get.delete<HandymanProfileController>(force: true);
                              Get.toNamed(AppRouter.getHandymanProfileRoute(), arguments: [i.uid, i.name]);
                            },
                            child: ListTile(
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(minWidth: 44, minHeight: 44, maxWidth: 64, maxHeight: 64),
                                child: FadeInImage(
                                  image: NetworkImage('${Environments.apiBaseURL}storage/images/${i.cover}'),
                                  placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                                  imageErrorBuilder: (context, error, stackTrace) {
                                    return Image.asset('assets/images/notfound.png', fit: BoxFit.fitWidth);
                                  },
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              title: Text(i.name.toString(), style: const TextStyle(fontSize: 10.0)),
                            ),
                          ),
                        )
                    ],
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
