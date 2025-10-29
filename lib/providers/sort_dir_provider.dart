import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortDir {
  asc("ASC", 1),
  desc("DESC", 2);

  final String name;
  final int id;
  const SortDir(this.name, this.id);
}

final sortDirProvider = StateProvider.autoDispose<SortDir>(
  (ref) {
    return SortDir.desc;
  },
  name: "sortDirProvider",
);
