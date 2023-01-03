// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$$AppRouter extends RootStackRouter {
  _$$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MainRoute()),
      );
    },
    DetailedPage.name: (routeData) {
      final args = routeData.argsAs<DetailedPageArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DetailedRoute(
          key: args.key,
          repository: args.repository,
          index: args.index,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainPage.name,
          path: '/',
        ),
        RouteConfig(
          DetailedPage.name,
          path: '/detailed-route',
        ),
      ];
}

/// generated route for
/// [MainRoute]
class MainPage extends PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [DetailedRoute]
class DetailedPage extends PageRouteInfo<DetailedPageArgs> {
  DetailedPage({
    Key? key,
    required GithubRepositoryModel repository,
    required int index,
  }) : super(
          DetailedPage.name,
          path: '/detailed-route',
          args: DetailedPageArgs(
            key: key,
            repository: repository,
            index: index,
          ),
        );

  static const String name = 'DetailedPage';
}

class DetailedPageArgs {
  const DetailedPageArgs({
    this.key,
    required this.repository,
    required this.index,
  });

  final Key? key;

  final GithubRepositoryModel repository;

  final int index;

  @override
  String toString() {
    return 'DetailedPageArgs{key: $key, repository: $repository, index: $index}';
  }
}
