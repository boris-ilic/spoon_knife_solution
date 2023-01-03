import 'package:equatable/equatable.dart';

class Author extends Equatable {
  String? avatarUrl;
  String? login;

  Author({this.avatarUrl, this.login});

  Author.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatarUrl'] = avatarUrl;
    data['login'] = login;
    return data;
  }

   @override
  List<Object?> get props => [avatarUrl, login];
}
