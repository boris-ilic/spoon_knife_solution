import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';

class DetailedRoute extends StatelessWidget {
  static const String name = 'DetailedRoute';
  final GithubRepositoryModel repository;
  final int index;

  const DetailedRoute(
      {super.key, required this.repository, required this.index});

  @override
  Widget build(BuildContext context) {
    final issue = repository.issues!.issuesEdges![index].issueNode!;

    return Scaffold(
      appBar: AppBar(
        title: Text("${issue.title}"),
        leading: InkWell(
            onTap: () {
              context.router.pop();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                      "${issue.author!.login} opened this issue on ${issue.comments!.commentsEdges!.first.commentNode!.createdAt.toString().substring(0, 11)}"),
                ],
              ),
            ),
            const Divider(
              height: 3,
              thickness: 2,
            ),
            ListView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: issue.comments!.commentsEdges!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: issue
                                                  .comments!
                                                  .commentsEdges![index]
                                                  .commentNode!
                                                  .author!
                                                  .avatarUrl ??
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCqT2AO6KDSDiB6TVwiHUxkVpwSARvzD4uJaRfeLz_w&s',
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      Text(
                                        "${issue.comments!.commentsEdges![index].commentNode!.author!.login.toString().length > 18 
                                        ? issue.comments!.commentsEdges![index].commentNode!.author!.login!.substring(0, 18) 
                                        : issue.comments!.commentsEdges![index].commentNode!.author!.login}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Created at: ${issue.comments!.commentsEdges![index].commentNode!.createdAt.toString().substring(0, 11)}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(issue.comments!.commentsEdges![index]
                                      .commentNode!.bodyText ??
                                  ''),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
