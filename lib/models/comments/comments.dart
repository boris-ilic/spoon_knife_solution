import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/comments/comments_edge.dart';

class Comments extends Equatable {
  List<CommentsEdges>? commentsEdges;

  Comments({this.commentsEdges});

  Comments.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      commentsEdges = <CommentsEdges>[];
      json['edges'].forEach((v) {
        commentsEdges!.add(CommentsEdges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commentsEdges != null) {
      data['edges'] = commentsEdges!.map((v) => v.toJson()).toList();
    }
    return data;
  }

   @override
  List<Object?> get props => [commentsEdges];
}
