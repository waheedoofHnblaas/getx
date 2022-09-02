class CategoriesModel {
  String? _categoriesId;
  String? _categoriesName;
  String? _categoriesNameAr;
  String? _categoriesDatetime;
  String? _categoriesImage;

  CategoriesModel(
      {String? categoriesId,
        String? categoriesName,
        String? categoriesNameAr,
        String? categoriesDatetime,
        String? categoriesImage}) {
    if (categoriesId != null) {
      this._categoriesId = categoriesId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (categoriesNameAr != null) {
      this._categoriesNameAr = categoriesNameAr;
    }
    if (categoriesDatetime != null) {
      this._categoriesDatetime = categoriesDatetime;
    }
    if (categoriesImage != null) {
      this._categoriesImage = categoriesImage;
    }
  }

  String? get categoriesId => _categoriesId;
  set categoriesId(String? categoriesId) => _categoriesId = categoriesId;
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get categoriesNameAr => _categoriesNameAr;
  set categoriesNameAr(String? categoriesNameAr) =>
      _categoriesNameAr = categoriesNameAr;
  String? get categoriesDatetime => _categoriesDatetime;
  set categoriesDatetime(String? categoriesDatetime) =>
      _categoriesDatetime = categoriesDatetime;
  String? get categoriesImage => _categoriesImage;
  set categoriesImage(String? categoriesImage) =>
      _categoriesImage = categoriesImage;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    _categoriesId = json['categories_id'];
    _categoriesName = json['categories_name'];
    _categoriesNameAr = json['categories_name_ar'];
    _categoriesDatetime = json['categories_datetime'];
    _categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this._categoriesId;
    data['categories_name'] = this._categoriesName;
    data['categories_name_ar'] = this._categoriesNameAr;
    data['categories_datetime'] = this._categoriesDatetime;
    data['categories_image'] = this._categoriesImage;
    return data;
  }
}