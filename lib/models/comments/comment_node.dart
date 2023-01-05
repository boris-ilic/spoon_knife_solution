import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:spoon_knife_solution/models/author.dart';

class CommentNode extends Equatable {
  Author? author;
  String? bodyText;
  String? body;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  CommentNode({this.author, this.bodyText, this.body, this.createdAt, this.updatedAt,});

  CommentNode.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    bodyText = json['bodyText'];
    body = json['body'];
    createdAt = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse((json['createdAt'] as String))));
    updatedAt = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse((json['updatedAt'] as String))));
  }

   @override
  List<Object?> get props => [author, bodyText, body, createdAt, updatedAt];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['bodyText'] = bodyText;
    return data;
  }
}