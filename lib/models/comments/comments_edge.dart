import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/comments/comment_node.dart';

class CommentsEdges extends Equatable {
  CommentNode? commentNode;

  CommentsEdges({this.commentNode});

  CommentsEdges.fromJson(Map<String, dynamic> json) {
    commentNode =
        json['node'] != null ? CommentNode.fromJson(json['node']) : null;

        
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (commentNode != null) {
      data['node'] = commentNode!.toJson();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [commentNode];
}