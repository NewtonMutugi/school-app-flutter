class User {
  int id;
  String firstName = "";
  String lastName = "";
  String email = "";
  // String password;
  // String confirmPassword;
  String authenticationToken = "";

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      // required this.password,
      // required this.confirmPassword,
      required this.authenticationToken});

  static fromJson(Map<String, dynamic> json) {
    int id = json['id'];
    String firstName = json['firstName'];
    String lastName = json['lastName'];
    String email = json['email'];
    // password = json['password'];
    // confirmPassword = json['confirmPassword'];
    String authenticationToken = json['authenticationToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    // data['password'] = password;
    // data['confirmPassword'] = confirmPassword;
    data['authenticationToken'] = authenticationToken;
    return data;
  }
}
