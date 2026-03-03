class ArtistModel {
  final String id;
  final String name;
  final String imageUrl;
  final String bio;

  ArtistModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bio,
  });

  // Dữ liệu nghệ sĩ mẫu
  static List<ArtistModel> mockArtists = [
    ArtistModel(
      id: 'a1',
      name: 'Sơn Tùng M-TP',
      imageUrl: 'assets/images/artists/sontung.jpg',
      bio: 'Ca sĩ, nhạc sĩ nổi tiếng Việt Nam.',
    ),
    ArtistModel(
      id: 'a2',
      name: 'Đen Vâu',
      imageUrl: 'assets/images/artists/denvau.jpg',
      bio: 'Rapper với lời nhạc sâu sắc.',
    ),
    ArtistModel(
      id: 'a3',
      name: 'Mỹ Tâm',
      imageUrl: 'assets/images/artists/mytam.jpg',
      bio: 'Nữ ca sĩ pop hàng đầu Việt Nam.',
    ),
    ArtistModel(
      id: 'a4',
      name: 'The Weeknd',
      imageUrl: 'assets/images/artists/theweeknd.jpg',
      bio:
          'The Weeknd (tên thật Abel Makkonen Tesfaye) là ca sĩ, nhạc sĩ và nhà sản xuất âm nhạc người Canada. Anh nổi tiếng toàn cầu với phong cách R&B/Pop hiện đại, giọng hát đặc trưng và hàng loạt bản hit như Blinding Lights, Starboy, Save Your Tears.',
    ),
    ArtistModel(
      id: 'a5',
      name: 'Ali Gatie',
      imageUrl: 'assets/images/artists/aligatie.jpg',
      bio:
          'Ali Gatie là ca sĩ và nhạc sĩ người Canada, nổi tiếng với những bản ballad Pop/R&B giàu cảm xúc. Anh được biết đến rộng rãi qua ca khúc Until You, cùng các bài hát như It’s You, Moonlight và What If I Told You That I Love You.',
    ),
  ];
}
