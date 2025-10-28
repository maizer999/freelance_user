// ignore_for_file: public_member_api_docs, sort_constructors_first
class TitleSubtitleModel {
  final String title;
  final String? subTitle;
  final bool translate;

  TitleSubtitleModel(
      {required this.title, this.subTitle, this.translate = true});

  @override
  bool operator ==(covariant TitleSubtitleModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.subTitle == subTitle;
  }

  @override
  int get hashCode => title.hashCode ^ subTitle.hashCode;
}
