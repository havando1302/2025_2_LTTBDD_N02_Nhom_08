import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/models/user_model.dart';
import 'package:musicbox/models/albums_model.dart';
import 'package:go_router/go_router.dart';
import 'package:musicbox/translates/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:musicbox/providers/app_provider.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final UserModel currentUser = UserModel.modelUsers[1];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildDeveloperInfoWid(),
          const SizedBox(height: 24),
          Text(
            t.playlist,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 12),
          ...AlbumModel.mockAlbums
              .take(3)
              .map((album) => _buildAlbumItem(album)),
          const SizedBox(height: 24),
          Text(
            t.settings,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingItem(Icons.notifications, t.notifications),
          _buildSettingItem(Icons.download, t.downloads),
          _buildSettingItem(Icons.lock, t.privacy),
          _buildSettingItem(Icons.help_outline, t.help),
          _buildLanguageItem(),
          const SizedBox(height: 24),
          _buildLogoutButton(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final t = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(MyColor.pr4), Color(MyColor.pr5)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: Color(MyColor.white),
            child: Text(
              currentUser.name.substring(0, 1),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(MyColor.black),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(MyColor.white),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Premium Member",
                  style: TextStyle(color: Color(MyColor.se4)),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(MyColor.white).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    t.edit,
                    style: TextStyle(fontSize: 12, color: Color(MyColor.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumItem(AlbumModel album) {
    final t = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(MyColor.pr3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              album.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(MyColor.white),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${t.year} ${album.year}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(MyColor.grey),
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Color(MyColor.grey)),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Color(MyColor.pr3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(MyColor.pr4)),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(MyColor.white),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem() {
    final localeProvider = context.watch<LocaleProvider>();
    final t = AppLocalizations.of(context)!;
    String language = localeProvider.locale.languageCode == 'vi'
        ? "Tiếng Việt"
        : "English";

    return GestureDetector(
      onTap: () {
        _showLanguage();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Color(MyColor.pr3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.language, color: Color(MyColor.pr4)),
            const SizedBox(width: 12),

            Expanded(
              child: Text(
                t.language,
                style: TextStyle(
                  color: Color(MyColor.white),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Text(language, style: const TextStyle(color: Color(MyColor.grey))),

            const SizedBox(width: 6),

            const Icon(Icons.chevron_right, color: Color(MyColor.grey)),
          ],
        ),
      ),
    );
  }

  void _showLanguage() {
    final t = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(MyColor.pr2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),

            Text(
              t.chooseLanguage,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(MyColor.white),
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: Image.asset(
                'assets/icons/vn.png',
                width: 24,
                height: 24,
              ),
              title: Text(
                t.vietnamese,
                style: TextStyle(color: Color(MyColor.white)),
              ),
              onTap: () {
                context.read<LocaleProvider>().setLocale(const Locale('vi'));
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Image.asset(
                'assets/icons/en.png',
                width: 24,
                height: 24,
              ),
              title: Text(
                t.english,
                style: TextStyle(color: Color(MyColor.white)),
              ),
              onTap: () {
                context.read<LocaleProvider>().setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        context.goNamed('login');
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Color(MyColor.red)),
        ),
        child: Center(
          child: Text(
            "Đăng xuất",
            style: TextStyle(
              color: Color(MyColor.red),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperInfoWid() {
    final t = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(MyColor.pr4), Color(MyColor.pr5)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.developerInfo,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),

          SizedBox(height: 12),

          Row(
            children: [
              Text(
                t.member1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(MyColor.white),
                ),
              ),
              Text(
                ":  Hà Văn Đô",
                style: TextStyle(color: Color(MyColor.grey), fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                t.studentId,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(MyColor.white),
                ),
              ),
              Text(
                ":  23010406",
                style: TextStyle(color: Color(MyColor.grey), fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 8),

          Row(
            children: [
              Text(
                t.member2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(MyColor.white),
                ),
              ),
              Text(
                ":  Nguyễn Quang Thọ",
                style: TextStyle(color: Color(MyColor.grey), fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                t.studentId,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(MyColor.white),
                ),
              ),
              Text(
                ":  23010162",
                style: TextStyle(color: Color(MyColor.grey), fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 12),

          Row(
            children: [
              Text(
                t.supervisor,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(MyColor.white),
                ),
              ),
              Text(
                ":  ThS. Nguyễn Xuân Quế",
                style: TextStyle(color: Color(MyColor.grey), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
