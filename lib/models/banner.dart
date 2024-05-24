class BannerAd {
  final String? id;
  final String? detail;
  final String? image;
  final DateTime? createdAt;

  BannerAd({
    required this.id,
    required this.detail,
    required this.image,
    required this.createdAt,
  });

  static BannerAd fromJson(Map<String, dynamic> json) {
    return BannerAd(
      id: json["_id"],
      detail: json["detail"],
      image: json["image"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<dynamic, Object?> toJson(){
    return {
      id:id,
      detail:detail,
      image:image,
      createdAt: createdAt!.toIso8601String(),
    };
  }
}
