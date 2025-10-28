import 'package:flutter_riverpod/flutter_riverpod.dart';
final isSubmittingProvider = StateProvider((ref) => false);
final isLoadingProvider = StateProvider<bool>((ref) => false);
final isApproveProvider = StateProvider<bool>((ref) => false);
final isRejectProvider = StateProvider<bool>((ref) => false);

