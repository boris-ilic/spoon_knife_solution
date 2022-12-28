
Implement a small Flutter mobile application which consumes RESTful APIs and displays returned data in a master-detail fashion.

The application should use further described github open APIs. In your implementation take advantage of the project: https://github.com/octocat/Spoon-Knife/ . This project was meant to provide an example for forking a repository on GitHub. However it is as well perfect for our purpose because it has a set of issues which had been added by users: https://github.com/octocat/Spoon-Knife/issues . Some of these issues have comments associated with them: https://github.com/octocat/Spoon-Knife/issues/108 .

Your application should present the following data:
1) Issue list view (master view) - a list of issues for the user octocat for repository Spoon-Knife. 'List repository issues' API is documented here: 
https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
Please present only 10 first issues retured by the api which have some comments.
2) Comments for a specific issue (detail view) - a list of comments associated with a specific issue. 'List issue comments' API is documented here:
https://docs.github.com/en/rest/issues/comments?apiVersion=2022-11-28#list-issue-comments

As mentioned before github APIs are open and therefore some level of protection is put on them. They have rate limits which are as low as 60 requests per IP address per API path per hour and reasonably spactious for authenticated users 5000 requests per user per API path per hour.

Rate limits can be displayed using curl -I option:
curl -I https://api.github.com/repos/octocat/Spoon-Knife/issues
> HTTP/2 200
...
> x-ratelimit-limit: 60
> x-ratelimit-remaining: 59

The easiest way to take advantage of authenticated user rate-limit is to use personal access token: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token Please according to instruction mentioned in the link create "(classic)" private access token. We want to use it only for authentication to extend the rate limit so no additional permissions have to be checked.

After token is created you can use it as bearer token as described in this paragraph: https://docs.github.com/en/rest/overview/resources-in-the-rest-api?apiVersion=2022-11-28#oauth2-token-sent-in-a-header
curl -I -H "Authorization: Bearer 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" https://api.github.com/repos/octocat/Spoon-Knife/issues
> HTTP/2 200
...
x-ratelimit-limit: 5000
x-ratelimit-remaining: 4999

In your application please store a token in a secrets file which you can add to git ignore to avoid committing it to the repository.  Please mention how to create the secret file, so that other users running the application can create their own secrets file. Use the token for all the calls performed by the application.
