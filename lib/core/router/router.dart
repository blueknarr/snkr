import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:snkr/data/api/event_api_impl.dart';
import 'package:snkr/data/api/product_api_impl.dart';
import 'package:snkr/data/repository/event_repository_impl.dart';
import 'package:snkr/data/repository/product_repository_impl.dart';
import 'package:snkr/domain/use_case/get_event_use_case.dart';
import 'package:snkr/domain/use_case/get_products_use_case.dart';

import 'package:snkr/presentation/main/main_screen.dart';
import 'package:snkr/presentation/main/main_state.dart';
import 'package:snkr/presentation/main/main_view_model.dart';

import '../../domain/model/product.dart';
import '../../presentation/discover/discover_screen.dart';
import '../../presentation/discover/discover_view_model.dart';

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
          create: (_) => DiscoverViewModel(
            GetEventUseCase(
              EventRepositoryImpl(
                EventApiImpl(),
              ),
            ),
          ),
          child: DiscoverScreen(products: state.extra as List<Product>),
        );
      },
    ),
  ],
);
