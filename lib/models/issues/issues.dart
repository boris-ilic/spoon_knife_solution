import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/issues/issues_edges.dart';


class Issues extends Equatable {
  int? totalCount;
  List<IssuesEdges>? issuesEdges;

  Issues({this.totalCount, this.issuesEdges});

  Issues.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['edges'] != null) {
      issuesEdges = <IssuesEdges>[];
      json['edges'].forEach((v) {
        issuesEdges!.add(IssuesEdges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (issuesEdges != null) {
      data['issuesEdges'] = issuesEdges!.map((v) => v.toJson()).toList();
    }
    return data;
  }

   @override
  List<Object?> get props => [totalCount, issuesEdges];
}
