import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/issues/issue_node.dart';

class IssuesEdges extends Equatable {
  IssueNode? issueNode;

  IssuesEdges({this.issueNode});

  IssuesEdges.fromJson(Map<String, dynamic> json) {
    issueNode = json['node'] != null ? IssueNode.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (issueNode != null) {
      data['node'] = issueNode!.toJson();
    }
    return data;
  }

   @override
  List<Object?> get props => [issueNode];
}
