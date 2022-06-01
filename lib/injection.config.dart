// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i4;
import 'application/auth/phone_number_sign_in/phone_number_sign_in_cubit.dart'
    as _i10;
import 'application/maps/maps_cubit.dart' as _i9;
import 'domain/auth/i_auth_service.dart' as _i7;
import 'infrastructure/auth/firebase_auth_service.dart' as _i8;
import 'infrastructure/core/injectable_module.dart' as _i11;
import 'presentation/routes/router.gr.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.AppRouter>(injectableModule.appRouter);
  gh.lazySingleton<_i4.AuthCubit>(() => _i4.AuthCubit());
  gh.lazySingleton<_i5.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i6.FirebaseFirestore>(() => injectableModule.firestore);
  gh.lazySingleton<_i7.IAuthService>(() => _i8.FirebaseAuthService(
      get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.factory<_i9.MapsCubit>(() => _i9.MapsCubit(get<_i4.AuthCubit>()));
  gh.factory<_i10.PhoneNumberSignInCubit>(() => _i10.PhoneNumberSignInCubit());
  return get;
}

class _$InjectableModule extends _i11.InjectableModule {}
