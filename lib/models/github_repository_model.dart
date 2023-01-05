import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/issues/issues.dart';

class GithubRepositoryModel extends Equatable {
  String? description;
  String? name;
  Issues? issues;

  GithubRepositoryModel({this.description, this.name, this.issues});

  GithubRepositoryModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    issues = json['issues'] != null ? Issues.fromJson(json['issues']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['name'] = name;
    if (issues != null) {
      data['issues'] = issues!.toJson();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [ description, name, issues ];
}