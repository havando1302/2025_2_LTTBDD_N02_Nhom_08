class UserModel {
  final String id;
  final String email;
  final String password;
  final String name;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });

  //dữ liệu mẫu tài khoản đăng nhập
  static List<UserModel> modelUsers = [
    UserModel(
      id: '1',
      email: 'quangtho@gmail.com',
      password: '123456',
      name: 'Quang Thọ',
    ),
    UserModel(
      id: '2',
      email: 'doha@gmail.com',
      password: '123456',
      name: 'Hà Đô',
    ),
  ];
}
