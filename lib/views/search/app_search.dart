import 'package:flutter/material.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/constants/app_colors.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({super.key});

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  final TextEditingController searchController = TextEditingController();

  List<String> recentSearch = [
    "Sơn Tùng MTP",
    "MCK",
    "Vũ",
    "Cơn mưa ngang qua",
  ];

  void addRecent(String value) {
    if (value.trim().isEmpty) return;

    setState(() {
      recentSearch.remove(value);
      recentSearch.insert(0, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 20),
            _title("Tìm kiếm gần đây"),
            const SizedBox(height: 10),
            _recentList(),
            const SizedBox(height: 20),
            _title("Bài hát phổ biến"),
            const SizedBox(height: 10),
            Expanded(child: _popularSongs()),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        decoration: BoxDecoration(
          color: Color(MyColor.grey).withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(MyColor.white)),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: searchController,
                onSubmitted: (value) {
                  addRecent(value);
                },
                decoration: const InputDecoration(
                  hintText: "Tìm kiếm bài hát, nghệ sĩ, album",
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(MyColor.white),
        ),
      ),
    );
  }

  Widget _recentList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recentSearch.length,
      itemBuilder: (context, index) {
        final item = recentSearch[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(MyColor.pr5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.history, color: Color(MyColor.grey)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Color(MyColor.white),
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    recentSearch.removeAt(index);
                  });
                },
                child: const Icon(Icons.close, color: Color(MyColor.grey)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _popularSongs() {
    return ListView.builder(
      itemCount: SongModel.mockSongs.length,
      itemBuilder: (context, index) {
        final song = SongModel.mockSongs[index];
        return ListTile(title: Text(song.title));
      },
    );
  }
}
