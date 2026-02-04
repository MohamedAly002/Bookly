import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit=GetIt.instance;
void setupServiceLocator(){
  getit.registerSingleton<ApiServices>(ApiServices(Dio()));
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl( getit.get<ApiServices>()));
}