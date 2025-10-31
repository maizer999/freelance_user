import 'package:flutter/material.dart';
import '../helper/router.dart';
import '../util/theme.dart';
import 'package:get/get.dart';
import '../env.dart';
import '../widget/navbar.dart';
import '../controller/account_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (value) {
        return Scaffold(
          drawer: const NavBar(),
          backgroundColor: ThemeProvider.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            iconTheme: const IconThemeData(color: ThemeProvider.whiteColor),
            elevation: 0,
            centerTitle: true,
            title: Text('My Account'.tr, style: ThemeProvider.titleStyle),
            actions: [
              value.login == true
                  ? TextButton(
                style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.only(left: 6)
                ),
                onPressed: () => value.onEditProfile(),
                child: Text('Edit'.tr, style: const TextStyle(color: ThemeProvider.whiteColor, fontFamily: 'medium', fontSize: 14)),
              )
                  : const SizedBox()
            ],
          ),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(height: 16),
                value.login == true
                    ? Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
                  ),
                  width: 100,
                  height: 100,
                  child: FadeInImage(
                    image: NetworkImage('${Environments.apiBaseURL}storage/images/${value.cover.toString()}'),
                    placeholder: const AssetImage("assets/images/placeholder.jpeg"),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/notfound.png', fit: BoxFit.cover, height: 100, width: 100);
                    },
                    fit: BoxFit.cover,
                  ),
                )
                    : const SizedBox(),
                SizedBox(height: value.login == true ? 10 : 0),
                value.login == true ? heading2('${value.firstName.toString()} ${value.lastName.toString()}') : const SizedBox(),
                SizedBox(height: value.login == true ? 2 : 0),
                value.login == true ? lightText(value.email.toString()) : const SizedBox(),
                SizedBox(height: value.login == true ? 16 : 0),

                // Card Styles with Rounded Corners and Shadows
                if (value.login == false)
                  _buildAccountOption(
                      icon: Icons.login_outlined,
                      title: 'Login / Register',
                      onTap: () => value.onLogin()
                  ),
                if (value.login == true)
                  ...[
                    _buildAccountOption(
                      icon: Icons.file_present_outlined,
                      title: 'Product History',
                      onTap: () => value.onProductHistory(),
                    ),
                    _buildAccountOption(
                      icon: Icons.favorite_outline,
                      title: 'Favorite',
                      onTap: () => value.onFavorite(),
                    ),
                    _buildAccountOption(
                      icon: Icons.location_on_outlined,
                      title: 'Your Address',
                      onTap: () => value.onAddress(),
                    ),
                    _buildAccountOption(
                      icon: Icons.support_agent_outlined,
                      title: 'Inbox',
                      onTap: () => value.onChat(),
                    ),
                    _buildAccountOption(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Wallet',
                      onTap: () => Get.toNamed(AppRouter.getWalletRoute()),
                    ),
                    _buildAccountOption(
                      icon: Icons.insert_invitation_outlined,
                      title: 'Refer & Earn',
                      onTap: () => Get.toNamed(AppRouter.getReferRoute()),
                    ),
                    _buildAccountOption(
                      icon: Icons.language_outlined,
                      title: 'Language',
                      onTap: () => value.onLanguage(),
                    ),
                    _buildAccountOption(
                      icon: Icons.lock_outline,
                      title: 'Change Password',
                      onTap: () => Get.toNamed(AppRouter.getForgotPasswordRoute()),
                    ),
                    _buildAccountOption(
                      icon: Icons.contact_mail_outlined,
                      title: 'Contact Us',
                      onTap: () => value.onContactUs(),
                    ),
                    _buildAccountOption(
                      icon: Icons.flag_outlined,
                      title: 'FAQs',
                      onTap: () => value.onAppPages('Frequently Asked Questions'.tr, '5'),
                    ),
                    _buildAccountOption(
                      icon: Icons.help_outline,
                      title: 'Help',
                      onTap: () => value.onAppPages('Help'.tr, '6'),
                    ),
                    _buildAccountOption(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Terms & Conditions',
                      onTap: () => value.onAppPages('Terms & Conditions'.tr, '3'),
                    ),
                    _buildAccountOption(
                      icon: Icons.lock_open_outlined,
                      title: 'Privacy Policy',
                      onTap: () => value.onAppPages('Privacy Policy'.tr, '2'),
                    ),
                    _buildAccountOption(
                      icon: Icons.logout_outlined,
                      title: 'Logout',
                      onTap: () => value.logout(),
                    ),
                  ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountOption({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      elevation: 4, // Adding shadow to each card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Round corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 8), // Spacing between cards
      child: ListTile(
        onTap: onTap,
        visualDensity: const VisualDensity(vertical: -3),
        leading: Icon(icon),
        minLeadingWidth: 0,
        title: heading4(title.tr),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
