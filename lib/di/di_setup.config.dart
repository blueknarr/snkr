// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:snkr/data/api/event_api_impl.dart' as _i3;
import 'package:snkr/data/api/product_api_impl.dart' as _i7;
import 'package:snkr/data/api/upcoming_api_impl.dart' as _i10;
import 'package:snkr/data/repository/event_repository_impl.dart' as _i5;
import 'package:snkr/data/repository/product_repository_impl.dart' as _i9;
import 'package:snkr/data/repository/upcoming_repository_impl.dart' as _i12;
import 'package:snkr/domain/repository/event_repostitory.dart' as _i4;
import 'package:snkr/domain/repository/product_repository.dart' as _i8;
import 'package:snkr/domain/repository/upcoming_repository.dart' as _i11;
import 'package:snkr/domain/use_case/get_event_use_case.dart' as _i6;
import 'package:snkr/domain/use_case/get_products_use_case.dart' as _i13;
import 'package:snkr/domain/use_case/get_upcoming_use_case.dart' as _i14;
import 'package:snkr/presentation/main/main_view_model.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.EventApiImpl>(_i3.EventApiImpl());
    gh.singleton<_i4.EventRepository>(
        _i5.EventRepositoryImpl(gh<_i3.EventApiImpl>()));
    gh.singleton<_i6.GetEventUseCase>(
        _i6.GetEventUseCase(gh<_i4.EventRepository>()));
    gh.singleton<_i7.ProductApiImpl>(_i7.ProductApiImpl());
    gh.singleton<_i8.ProductRepository>(
        _i9.ProductRepositoryImpl(gh<_i7.ProductApiImpl>()));
    gh.singleton<_i10.UpcomingApiImpl>(_i10.UpcomingApiImpl());
    gh.singleton<_i11.UpcomingRepository>(
        _i12.UpcomingRepositoryImpl(gh<_i10.UpcomingApiImpl>()));
    gh.singleton<_i13.GetProductsUseCase>(
        _i13.GetProductsUseCase(gh<_i8.ProductRepository>()));
    gh.singleton<_i14.GetUpcomingUseCase>(
        _i14.GetUpcomingUseCase(gh<_i11.UpcomingRepository>()));
    gh.singleton<_i15.MainViewModel>(_i15.MainViewModel(
      gh<_i13.GetProductsUseCase>(),
      gh<_i6.GetEventUseCase>(),
      gh<_i14.GetUpcomingUseCase>(),
    ));
    return this;
  }
}
