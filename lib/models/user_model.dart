// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    int id;
    String name;
    String email;
    String website;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.website,
    });

    UserModel copyWith({
        int? id,
        String? name,
        String? email,
        String? website,
    }) => 
        UserModel(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            website: website ?? this.website,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "website": website,
    };
}
