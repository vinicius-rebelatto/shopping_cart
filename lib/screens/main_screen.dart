//lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'package:shopping_cart/screens/shopping_list_screen.dart';

import 'add_product_screen.dart';
import 'not_found_screen.dart';

class AppRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<RouteSettings> _routes = [const RouteSettings(name: '/')];

  void push(String routeName) {
    _routes.add(RouteSettings(name: routeName));
    notifyListeners();
  }

  void pop() {
    if (_routes.length > 1) {
      _routes.removeLast();
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('MainPage'),
          child: _buildScaffold(context, _getPage(_routes.last)),)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        pop();
        return true;
      },
    );
  }

  Widget _buildScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        foregroundColor: Colors.white,
        title: const Text("Lista de compras"),
      ),
      body: body,
      floatingActionButton: _routes.last.name == '/'
        ? FloatingActionButton(
          onPressed: () => push('/'),
          child: const Icon(Icons.add),
      )
      : null,
    );
  }

  Widget _getPage(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return const ShoppingListScreen();
      /*case '/add':
        return const AddProductScreen();*/
      default:
        return const NotFoundScreen();
    }
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    _routes = configuration;
    notifyListeners();
  }
}

extension AppRouterExtension on BuildContext {
  AppRouter get router => Router.of(this).routerDelegate as AppRouter;
}
