import 'dart:io';
import 'package:octokit/octokit.dart';
import 'package:spoon_knife_solution/graphql_queries.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';

class GralhqlService {
  GithubRepositoryModel repository = GithubRepositoryModel();
  GithubClient client = GithubClient(token: "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");

  Future<GithubRepositoryModel> getGraphqlRepository() async {
    repository = GithubRepositoryModel();
    var response = await client.rawQuery(queryDefinition: GraphqlQueries.getRepository);
    repository = GithubRepositoryModel.fromJson(response["repository"]);
    return repository;
  }

  var sysEnv = Platform.environment;
  // var token = sysEnv["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"];
  // String token = "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";

}
