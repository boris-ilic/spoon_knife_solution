import 'package:equatable/equatable.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';

class Response extends Equatable {
  GithubRepositoryModel? repository;

  Response({this.repository});

  Response.fromJson(Map<String, dynamic> json) {
    repository = json['repository'] != null
        ? GithubRepositoryModel.fromJson(json['repository'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (repository != null) {
      data['repository'] = repository!.toJson();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [repository];
}
