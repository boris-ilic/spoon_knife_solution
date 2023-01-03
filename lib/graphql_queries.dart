class GraphqlQueries {
  static const String getRepository = r'''
  query {
    repository(name: "Spoon-Knife", owner: "octocat") {
    description
    issues(first: 20) {
      edges {
        node {
          author {
            avatarUrl
            login
          }
          title
          bodyText
          comments(first: 100) {
            edges {
              node {
                author {
                  avatarUrl
                  login
                }
                createdAt
                updatedAt
                bodyText
                
              }
            }
          }
        }
      }
    }
    name
  }
  }

''';
}