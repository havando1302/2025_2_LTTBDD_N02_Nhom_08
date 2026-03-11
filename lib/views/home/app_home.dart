import 'package:flutter/material.dart';
import 'package:musicbox/models/songs_model.dart';
import 'package:musicbox/models/albums_model.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/translates/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCountry = 'Tất cả';

  List<SongModel> get filteredSongs {
    if (selectedCountry == 'Tất cả') {
      return SongModel.mockSongs;
    } else if (selectedCountry == 'Việt Nam') {
      return SongModel.mockSongs
          .where((song) => song.country == 'Việt Nam')
          .toList();
    } else {
      return SongModel.mockSongs
          .where((song) => song.country != 'Việt Nam')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final topSongs = SongModel.mockSongs.take(5).toList();
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Những album nổi bật.
          Text(
            t.collection,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AlbumModel.mockAlbums.length,
              itemBuilder: (context, index) {
                final album = AlbumModel.mockAlbums[index];

                return Container(
                  width: 140,
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          album.imageUrl,
                          height: 120,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        album.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(MyColor.white),
                        ),
                      ),
                      Text(
                        "${t.year} ${album.year}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(MyColor.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Những bài hát gợi ý cho người dùng.
          Text(
            t.recommendedForYou,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 8),

          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: SongModel.mockSongs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final song = SongModel.mockSongs[index];

              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(MyColor.pr3),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        song.imageUrl,
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
                            song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(MyColor.white),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            song.country,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(MyColor.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                      tooltip: 'Thêm vào yêu thích',
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: _showMenu,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // Những bài hát lọt vào top bảng xếp hạng.
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(MyColor.se1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.topChart,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(MyColor.white),
                  ),
                ),
                const SizedBox(height: 10),

                ...List.generate(topSongs.length, (index) {
                  final song = topSongs[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(MyColor.pr3),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '#${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(MyColor.pr4),
                          ),
                        ),

                        const SizedBox(width: 12),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            song.imageUrl,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(MyColor.white),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Icon(Icons.play_arrow, color: Color(MyColor.white)),
                      ],
                    ),
                  );
                }),

                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      t.seeAll,
                      style: TextStyle(color: Color(MyColor.pr4)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Những bài hát mới phát hành theo quốc gia.
          Text(
            t.newRelease,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(MyColor.white),
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [t.all, t.vietnam, t.international].map((title) {
              final isSelected = selectedCountry == title;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCountry = title;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: isSelected
                        ? Color(MyColor.pr4)
                        : Color(MyColor.white),
                    foregroundColor: isSelected
                        ? Color(MyColor.white)
                        : Color(MyColor.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? Colors.transparent
                            : Color(MyColor.grey),
                      ),
                    ),
                  ),
                  child: Text(title),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredSongs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final song = filteredSongs[index];

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(MyColor.pr3),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        song.imageUrl,
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
                            song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(MyColor.white),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            song.country,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(MyColor.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.play_arrow, color: Color(MyColor.white)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showMenu() {
    final t = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(MyColor.pr1),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),

                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                SizedBox(height: 10),

                ListTile(
                  leading: Icon(Icons.share_outlined, color: Colors.white),
                  title: Text(t.share, style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.diamond_outlined, color: Colors.white),
                  title: Text(
                    t.premiumMusic,
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "Premium",
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.favorite_border, color: Colors.white),
                  title: Text(
                    t.addToFavoriteSongs,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.playlist_add, color: Colors.white),
                  title: Text(
                    t.addToPlaylist,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.queue_music, color: Colors.white),
                  title: Text(
                    t.addToQueue,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.radio, color: Colors.white),
                  title: Text(
                    t.goToRadio,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.album_outlined, color: Colors.white),
                  title: Text(
                    t.goToAlbum,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.person_outline, color: Colors.white),
                  title: Text(
                    t.goToArtist,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.event, color: Colors.white),
                  title: Text(
                    t.goToArtistConcert,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: Icon(Icons.music_note_outlined, color: Colors.white),
                  title: Text(
                    t.songCredits,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
