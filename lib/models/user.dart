class User {
  String? email;
  String? status;

  User({
    this.email,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'email': email,
      'status': status,
    };
    return data;
  }
}
