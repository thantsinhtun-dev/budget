class UserEntity {
  final String name;
  final String email;
  final String image;
  final String phoneNumber;
  final String uid;
  final String token;
  bool isDarkMode;
  bool autoSync;

  UserEntity({
    required this.name,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.uid,
    required this.token,
    this.isDarkMode = false,
    this.autoSync = false,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        name: json["name"],
        email: json["email"],
        image: json["image"],
        phoneNumber: json["phoneNumber"],
        uid: json["uid"],
        token: json["token"],
        isDarkMode: json["isDarkMode"],
        autoSync: json["autoSync"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
        "phoneNumber": phoneNumber,
        "uid": uid,
        "token": token,
        "isDarkMode": isDarkMode,
        "autoSync": autoSync,
      };

  @override
  String toString() {
    return "name : ${name} , email : ${email}, image : ${image}, phoneNumber : ${phoneNumber}, uid : ${uid}, token : ${token}";
  }
}
