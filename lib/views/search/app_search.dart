import 'package:flutter/material.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/translates/app_localizations.dart';

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

  List<SongModel> searchResults = [];

  void addRecent(String value) {
    if (value.trim().isEmpty) return;

    setState(() {
      recentSearch.remove(value);
      recentSearch.insert(0, value);
    });
  }

  void searchSong(String query) {
    final results = SongModel.mockSongs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),

            if (searchController.text.isEmpty) ...[
              const SizedBox(height: 20),
              _title(t.recentSearch),
              const SizedBox(height: 10),
              _recentList(),
              const SizedBox(height: 20),
              _title(t.popularSong),
              const SizedBox(height: 10),
              Expanded(child: _popularSongs()),
            ] else ...[
              const SizedBox(height: 20),
              _title(t.resultSearch),
              const SizedBox(height: 10),
              Expanded(child: _searchResult()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    final t = AppLocalizations.of(context)!;
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
                onChanged: (value) {
                  searchSong(value);
                },
                onSubmitted: (value) {
                  addRecent(value);
                },
                decoration: InputDecoration(
                  hintText: t.hintSearch,
                  hintStyle: const TextStyle(color: Colors.white70),
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
        return _songItem(song);
      },
    );
  }

  Widget _searchResult() {
    final t = AppLocalizations.of(context)!;
    if (searchResults.isEmpty) {
      return Center(
        child: Text(t.notResult, style: const TextStyle(color: Colors.white)),
      );
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final song = searchResults[index];
        return _songItem(song);
      },
    );
  }

  Widget _songItem(SongModel song) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color(MyColor.pr5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          print(song.title);
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            song.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          song.title,
          style: const TextStyle(
            color: Color(MyColor.white),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          song.country,
          style: const TextStyle(color: Color(MyColor.grey)),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.play_circle_fill, color: Color(MyColor.white)),
          onPressed: () {
            print("Play ${song.title}");
          },
        ),
      ),
    );
  }
}
