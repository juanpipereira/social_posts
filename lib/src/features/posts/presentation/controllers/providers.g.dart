// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsDataSourceHash() => r'dd283205eb9320bdff951c9183392646a375b037';

/// See also [postsDataSource].
@ProviderFor(postsDataSource)
final postsDataSourceProvider = AutoDisposeProvider<IPostsDataSource>.internal(
  postsDataSource,
  name: r'postsDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postsDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsDataSourceRef = AutoDisposeProviderRef<IPostsDataSource>;
String _$postsRepositoryHash() => r'fa77def76c360ec60763ee4d2521f48e06dd7b83';

/// See also [postsRepository].
@ProviderFor(postsRepository)
final postsRepositoryProvider = AutoDisposeProvider<IPostsRepository>.internal(
  postsRepository,
  name: r'postsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsRepositoryRef = AutoDisposeProviderRef<IPostsRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
