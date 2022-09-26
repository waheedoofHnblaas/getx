class ItemsModel {
  String? itemsId;
  String? itemsCat;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDatetime;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDatetime;
  String? categoriesImage;

  ItemsModel(
      {this.itemsId,
        this.itemsCat,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDatetime,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesDatetime,
        this.categoriesImage});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsCat = json['items_cat'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatetime = json['categories_datetime'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_cat'] = this.itemsCat;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDatetime;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_datetime'] = this.categoriesDatetime;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}