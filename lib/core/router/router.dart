import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:snkr/data/api/product_api_impl.dart';
import 'package:snkr/data/repository/product_repository_impl.dart';
import 'package:snkr/domain/use_case/get_products_use_case.dart';

import 'package:snkr/presentation/main/main_screen.dart';
import 'package:snkr/presentation/main/main_view_model.dart';

import '../../presentation/discover/discover_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetProductsUseCase(
              ProductRepositoryImpl(
                ProductApiImpl(),
              ),
            ),
          ),
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/discover',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(
            GetProductsUseCase(
              ProductRepositoryImpl(
                ProductApiImpl(),
              ),
            ),
          ),
          child: const DiscoverScreen(),
        );
      },
    ),
  ],
);
