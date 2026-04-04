// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/Home/api/data_sources/home_remote_data_source_imp.dart'
    as _i688;
import '../../features/Home/data/data_sources/home_remote_data_source_contract.dart'
    as _i337;
import '../../features/Home/data/repo/home_repo_impl.dart' as _i759;
import '../../features/Home/domain/repo/home_repo_contract.dart' as _i797;
import '../../features/Home/domain/use_cases/get_featured_books_use_case.dart'
    as _i894;
import '../../features/Home/domain/use_cases/get_newest_books_use_case.dart'
    as _i1048;
import '../../features/Home/domain/use_cases/get_similar_books_use_case.dart'
    as _i771;
import '../../features/Home/presentation/view_model/books_details_cubit/books_details_cubit.dart'
    as _i582;
import '../../features/Home/presentation/view_model/home_cubit/home_cubit.dart'
    as _i461;
import '../../features/Search/api/data_sources/search_remote_data_source_impl.dart'
    as _i1023;
import '../../features/Search/data/data_sources/search_remote_data_source_contract.dart'
    as _i272;
import '../../features/Search/data/repo/search_repo_impl.dart' as _i10;
import '../../features/Search/domain/repo/search_repo_contract.dart' as _i47;
import '../../features/Search/domain/use_cases/search_use_case.dart' as _i1013;
import '../../features/Search/presentation/view_model/search_cubit.dart'
    as _i693;
import '../api_client/books_api_client.dart' as _i562;
import '../dio/dio_module.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i562.BooksApiClient>(
        () => _i562.BooksApiClient(gh<_i361.Dio>()));
    gh.factory<_i272.SearchRemoteDataSourceContract>(
        () => _i1023.SearchRemoteDataSourceImpl(gh<_i562.BooksApiClient>()));
    gh.factory<_i337.HomeRemoteDataSourceContract>(
        () => _i688.HomeRemoteDataSourceImp(gh<_i562.BooksApiClient>()));
    gh.factory<_i797.HomeRepoContract>(
        () => _i759.HomeRepoImpl(gh<_i337.HomeRemoteDataSourceContract>()));
    gh.factory<_i47.SearchRepoContract>(() => _i10.SearchRepoImpl(
        searchRemoteDataSourceContract:
            gh<_i272.SearchRemoteDataSourceContract>()));
    gh.factory<_i894.GetFeaturedBooksUseCase>(
        () => _i894.GetFeaturedBooksUseCase(gh<_i797.HomeRepoContract>()));
    gh.factory<_i1048.GetNewestBooksUseCase>(
        () => _i1048.GetNewestBooksUseCase(gh<_i797.HomeRepoContract>()));
    gh.factory<_i771.GetSimilarBooksUseCase>(
        () => _i771.GetSimilarBooksUseCase(gh<_i797.HomeRepoContract>()));
    gh.factory<_i1013.SearchUseCase>(() => _i1013.SearchUseCase(
        searchRepoContract: gh<_i47.SearchRepoContract>()));
    gh.factory<_i461.HomeCubit>(() => _i461.HomeCubit(
          gh<_i894.GetFeaturedBooksUseCase>(),
          gh<_i1048.GetNewestBooksUseCase>(),
        ));
    gh.factory<_i582.BooksDetailsCubit>(
        () => _i582.BooksDetailsCubit(gh<_i771.GetSimilarBooksUseCase>()));
    gh.factory<_i693.SearchCubit>(
        () => _i693.SearchCubit(gh<_i1013.SearchUseCase>()));
    return this;
  }
}

class _$DioModule extends _i977.DioModule {}
