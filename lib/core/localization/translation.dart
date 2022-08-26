import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'continue': 'إكمال',
          'choose language': 'إختر اللغة',
          '1': 'اختر المنتج',
          '2':  'لدينا أكثر من 100 ألف منتج ، اختر\n منتجك من متجرنا \n التجارة الإلكترونية.',
        },
        'en': {
          'continue': 'Continue',
          'choose language': 'Choose Language',
          '1': 'Choose Language',
          '2':'We Have a 100k+ Products,Choose\nYour product from our\nE-commerce shop.'
             ,
        },
      };
}
