import 'package:flutter/material.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/models/user_model.dart';
import 'package:musicbox/models/albums_model.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final UserModel currentUser = UserModel.modelUsers[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          const Text(
            "Playlist gần đây",
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
          const Text(
            "Cài đặt",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 12),

          _buildSettingItem(Icons.notifications, "Thông báo"),
          _buildSettingItem(Icons.download, "Tải xuống"),
          _buildSettingItem(Icons.lock, "Quyền riêng tư"),
          _buildSettingItem(Icons.help_outline, "Trợ giúp"),
          _buildSettingItem(Icons.language, "Ngôn ngữ", trailing: "Tiếng Việt"),
          const SizedBox(height: 24),
          _buildLogoutButton(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
                  child: const Text(
                    "Chỉnh sửa",
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
                  "Năm ${album.year}",
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

  Widget _buildSettingItem(IconData icon, String title, {String? trailing}) {
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

          if (trailing != null)
            Text(trailing, style: const TextStyle(color: Color(MyColor.grey))),

          const SizedBox(width: 6),

          const Icon(Icons.chevron_right, color: Color(MyColor.grey)),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
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
    );
  }
}
