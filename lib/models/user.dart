class User {
  int? id;
  String? name;
  String? email;
  String? token;
  String? role;
  

  User({
    this.id,
    this.name,
    this.email,
    this.token,
    this.role,
    
  });

  //function to convert json data user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      token: json['token'],
      role: json['user']['role'],
      
    );
  }
}
