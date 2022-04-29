import 'package:latihan/enums/enum_customer_review.dart';
import 'package:riverpod/riverpod.dart';

final customerReviewProvider =
    StateProvider<EnumCustomerReview>((ref) => EnumCustomerReview.four);
