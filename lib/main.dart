import 'package:flutter/material.dart';
void main() => runApp(const KahrabaiApp());
class KahrabaiApp extends StatelessWidget {
  const KahrabaiApp({super.key});
  @override Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
class AppData {
  static const orangeCash = '01281721320';
  static const instapay = 'kahrabai@instapay';
  static const Map<String, List<String>> govCenters = {
    'القاهرة': ['حلوان','المعادي','مدينة نصر','مصر الجديدة','المرج','شبرا'],
    'الجيزة': ['الجيزة','الدقي','الهرم','فيصل','6 أكتوبر'],
    'الإسكندرية': ['المنتزه','شرق','وسط','العجمي'],
    'سوهاج': ['سوهاج','أخميم','البلينا','جرجا','طهطا'],
    'أسيوط': ['أسيوط','ديروط','منفلوط'],
    'قنا': ['قنا','نجع حمادي','دشنا'],
    'الأقصر': ['الأقصر','إسنا'],
    'أسوان': ['أسوان','كوم أمبو','إدفو'],
    'المنيا': ['المنيا','ملوي'],
    'الدقهلية': ['المنصورة','طلخا','ميت غمر'],
    'الشرقية': ['الزقازيق','العاشر','بلبيس'],
    'الغربية': ['طنطا','المحلة'],
    'المنوفية': ['شبين الكوم','منوف'],
    'القليوبية': ['بنها','شبرا الخيمة'],
    'البحيرة': ['دمنهور','كفر الدوار'],
    'كفر الشيخ': ['كفر الشيخ','دسوق'],
    'دمياط': ['دمياط','رأس البر'],
    'بورسعيد': ['بورسعيد','بور فؤاد'],
    'الإسماعيلية': ['الإسماعيلية','فايد'],
    'السويس': ['السويس','الأربعين'],
    'البحر الأحمر': ['الغردقة','سفاجا'],
    'الوادي الجديد': ['الخارجة','الداخلة'],
    'مطروح': ['مرسى مطروح','العلمين'],
    'شمال سيناء': ['العريش','رفح'],
    'جنوب سيناء': ['الطور','شرم الشيخ'],
  };
}
class Product {String category;String name;String company;String spec;double wholesale;double retail;Product({required this.category,required this.name,required this.company,required this.spec,required this.wholesale,required this.retail});}
class OrderModel {String type;String status;String date;String details;OrderModel({required this.type,required this.status,required this.date,required this.details});}
class ProductRepo {
  static List<Product> products = [
    Product(category: 'أسلاك وكابلات', name: 'سلك 1.5 مم', company: 'السويدي', spec: '1.5 مم - 100م', wholesale: 610, retail: 680),
    Product(category: 'أسلاك وكابلات', name: 'سلك 2 مم', company: 'السويدي', spec: '2 مم', wholesale: 845, retail: 920),
    Product(category: 'أسلاك وكابلات', name: 'سلك 4 مم', company: 'السويدي', spec: '4 مم', wholesale: 2015, retail: 2200),
    Product(category: 'أسلاك وكابلات', name: 'سلك 6 مم', company: 'السويدي', spec: '6 مم', wholesale: 3580, retail: 3800),
    Product(category: 'أسلاك وكابلات', name: 'سلك 10 مم', company: 'السويدي', spec: '10 مم', wholesale: 7905, retail: 8300),
    Product(category: 'أسلاك وكابلات', name: 'سلك 16 مم', company: 'السويدي', spec: '16 مم', wholesale: 9990, retail: 10500),
    Product(category: 'مفاتيح وبرايز', name: 'مفتاح مفرد', company: 'سانشي', spec: 'بيانو', wholesale: 18, retail: 25),
    Product(category: 'لوحات وقواطع', name: 'قاطع 10A', company: 'شنايدر', spec: 'أحادي', wholesale: 65, retail: 85),
    Product(category: 'كشافات وليد', name: 'لمبة 9 وات', company: 'فينوس', spec: 'ليد', wholesale: 35, retail: 50),
    Product(category: 'خراطيم ومواسير', name: 'خرطوم 16', company: 'مصطفى محمود', spec: '45م', wholesale: 45, retail: 60),
    Product(category: 'تأسيس شقة كاملة', name: 'باكدج 100م', company: 'سويدي+سانشي', spec: 'شامل', wholesale: 18500, retail: 21000),
  ];
  static List<OrderModel> orders = [OrderModel(type: 'طلب خدمة', status: 'قيد التنفيذ', date: '2026-10-10', details: 'مدينة نصر')];
}
