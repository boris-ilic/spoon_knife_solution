import 'package:spoon_knife_solution/models/author.dart';
import 'package:spoon_knife_solution/models/comments/comments.dart';

class IssueNode {
  String? title;
  String? bodyText;
  Comments? comments;
  Author? author;


  IssueNode({this.title, this.bodyText, this.comments, this.author, });

  IssueNode.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    bodyText = json['bodyText'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    comments =
        json['comments'] != null ? Comments.fromJson(json['comments']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['bodyText'] = bodyText;
    if (comments != null) {
      data['comments'] = comments!.toJson();
    }
    return data;
  }

}