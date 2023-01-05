import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spoon_knife_solution/colors.dart';
import 'package:spoon_knife_solution/models/github_repository_model.dart';

class GqlIssueCard extends StatelessWidget {
  final GithubRepositoryModel repository;

  final int index;
  final Function onPress;

  const GqlIssueCard(
      {required this.repository,
      required this.onPress,
      super.key,
      required this.index});

  @override
  Widget build(BuildContext context) {
    if (repository.issues!.issuesEdges![index].issueNode!.comments!
        .commentsEdges!.isEmpty) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 9,
          decoration: BoxDecoration(
              color: Palette.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: repository.issues!.issuesEdges![index].issueNode!.author
                      ?.avatarUrl ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxCqT2AO6KDSDiB6TVwiHUxkVpwSARvzD4uJaRfeLz_w&s',
              imageBuilder: (context, imageProvider) => Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            title: Text(
                "Title: ${repository.issues!.issuesEdges![index].issueNode!.title}"),
            subtitle: Text(
                "Author: ${repository.issues!.issuesEdges![index].issueNode!.author?.login}"),
            trailing: SizedBox(
              width: 100,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.mode_comment,
                        color: Colors.black87,
                        size: 40,
                      ),
                      Positioned(
                        top: 10,
                        left: 17,
                        child: Text(
                          repository.issues!.issuesEdges![index].issueNode!
                              .comments!.commentsEdges!.length
                              .toString(),
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              onPress();
            },
          ),
        ),
      );
    }
  }
}
