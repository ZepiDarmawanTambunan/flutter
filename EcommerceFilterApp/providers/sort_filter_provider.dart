import 'package:latihan/enums/enum_sort_by.dart';
import 'package:riverpod/riverpod.dart';

final sortFilterProvider =
    StateProvider<EnumSortBy>((ref) => EnumSortBy.recommended);
