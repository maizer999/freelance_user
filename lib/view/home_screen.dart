import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widget/navbar.dart';
import '../helper/router.dart';
import '../util/theme.dart';
import '../env.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (value) {
        return Scaffold(
          drawer: const NavBar(),
          backgroundColor: ThemeProvider.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
            elevation: 0,
            centerTitle: false,
            title: GestureDetector(
              onTap: () => Get.toNamed(AppRouter.getChooseLocationRoute()),
              child: Text(
                value.title.toString(),
                overflow: TextOverflow.ellipsis,
                style: ThemeProvider.titleStyle,
              ),
            ),
          ),
          body: value.apiCalled == false
              ? _buildLoadingSkeleton(context)
              : _buildContent(context, value),
        );
      },
    );
  }

  Widget _buildLoadingSkeleton(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          SkeletonParagraph(
            style: SkeletonParagraphStyle(
              lines: 2,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                randomLength: true,
                height: 30,
                borderRadius: BorderRadius.circular(8),
                minLength: MediaQuery.of(context).size.width / 2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SkeletonLine(
              style: SkeletonLineStyle(
                  height: 50,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 12),
          SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  width: double.infinity,
                  minHeight: MediaQuery.of(context).size.height / 8,
                  maxHeight: MediaQuery.of(context).size.height / 3)),
          const SizedBox(height: 12),
          SkeletonLine(
              style: SkeletonLineStyle(
                  height: 30,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 12),
          Row(
            children: [
              SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 110, height: MediaQuery.of(context).size.height / 8)),
              const SizedBox(width: 12),
              SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 110, height: MediaQuery.of(context).size.height / 8)),
              const SizedBox(width: 12),
              SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 110, height: MediaQuery.of(context).size.height / 8)),
            ],
          ),
          const SizedBox(height: 12),
          SkeletonLine(
              style: SkeletonLineStyle(
                  height: 30,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(8))),
          const SizedBox(height: 12),
          Row(
            children: [
              SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 160, height: MediaQuery.of(context).size.height / 5)),
              const SizedBox(width: 12),
              SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: 160, height: MediaQuery.of(context).size.height / 5)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, HomeController value) {
    if (value.haveData == false) {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset("assets/images/no-data.png",
                height: 80, width: 80, fit: BoxFit.cover),
            const SizedBox(height: 30),
            Text(
              'No Data Found Near You!'.tr,
              style: const TextStyle(fontFamily: 'bold'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          /// Banner Section
          if (value.bannersList.isNotEmpty)
            Container(
              width: double.infinity,
              height: 140,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0),
                items: value.bannersList.map<Widget>(
                      (item) => GestureDetector(
                    onTap: () =>
                        value.onBannerClick(item.type as int, item.value.toString()),
                    child: Container(
                      width: double.infinity,
                      height: 140,

                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 300,
                          margin: const EdgeInsets.only(bottom: 40),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(150, 0, 0, 0)),
                          child: Text(
                            item.title.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),

          const SizedBox(height: 16),

          /// Category List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: value.categoryList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              double itemHeight = MediaQuery.of(context).size.height / 4.5;
              var category = value.categoryList[i];

              return GestureDetector(
                onTap: () =>
                    value.onCategory(category.id as int, category.name.toString()),
                child: Container(
                  height: itemHeight,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage(
                          image: NetworkImage(
                            '${Environments.apiBaseURL}storage/images/${category.cover}',
                          ),
                          placeholder:
                          const AssetImage("assets/images/placeholder.jpeg"),
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/notfound.png',
                                width: 100, height: 100, fit: BoxFit.cover);
                          },
                          height: itemHeight * 0.8,
                          width: itemHeight * 0.8,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          category.name.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'NotoKufiArabic',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF0D47A1),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  BoxDecoration _squareImage(String val) {
    return BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('${Environments.apiBaseURL}storage/images/$val'),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
