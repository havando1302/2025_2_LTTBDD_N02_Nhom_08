class AlbumModel {
  final String id;
  final String title;
  final String artistId;
  final String imageUrl;
  final int year;

  AlbumModel({
    required this.id,
    required this.title,
    required this.artistId,
    required this.imageUrl,
    required this.year,
  });

  // Dữ liệu album mẫu
  static List<AlbumModel> mockAlbums = [
    AlbumModel(
      id: 'al1',
      title: 'Sky Tour',
      artistId: 'a1',
      imageUrl: 'assets/images/albums/skytour.jpg',
      year: 2020,
    ),
    AlbumModel(
      id: 'al2',
      title: 'Album Đen Vâu',
      artistId: 'a2',
      imageUrl: 'assets/images/albums/albdenvau.jpg',
      year: 2019,
    ),
    AlbumModel(
      id: 'al3',
      title: 'Tâm 9',
      artistId: 'a3',
      imageUrl: 'assets/images/albums/tam9.jpg',
      year: 2017,
    ),
    AlbumModel(
      id: 'al4',
      title: 'TOP Nhạc US',
      artistId: 'various',
      imageUrl: 'assets/images/albums/topus.jpg',
      year: 2017,
    ),
  ];
}
