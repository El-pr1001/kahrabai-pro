import 'package:flutter/material.dart';

void main() => runApp(const KahrabaiApp());

class KahrabaiApp extends StatelessWidget {
  const KahrabaiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class AppData {
  static const orangeCash = '01281721320';
  static const instapay = 'kahrabai@instapay';
  static const Map<String, List<String>> govCenters = {
    'القاهرة': ['حلوان','المعادي','مدينة نصر','مصر الجديدة','المرج','شبرا','حلوان','السلام','المطرية','عين شمس','التبين','15 مايو'],
    'الجيزة': ['الجيزة','الدقي','العجوزة','الهرم','فيصل','6 أكتوبر','الشيخ زايد','البدرشين','الحوامدية'],
    'الإسكندرية': ['المنتزه','شرق','وسط','غرب','الجمرك','العجمي','برج العرب','العامرية'],
    'سوهاج': ['سوهاج','أخميم','البلينا','المراغة','المنشأة','دار السلام','جرجا','جهينة','ساقلتة','طما','طهطا','العسيرات'],
    'أسيوط': ['أسيوط','ديروط','منفلوط','القوصية','أبنوب','أبو تيج','الغنايم','ساحل سليم','البداري','صدفا','الفتح'],
    'قنا': ['قنا','أبو تشت','نجع حمادي','دشنا','الوقف','قفط','نقادة','فرشوط','قوص'],
    'الأقصر': ['الأقصر','القرنة','البياضية','الزينية','أرمنت','إسنا','الطود'],
    'أسوان': ['أسوان','دراو','كوم أمبو','نصر النوبة','إدفو'],
    'المنيا': ['المنيا','العدوة','مغاغة','بني مزار','مطاي','سمالوط','المنيا الجديدة','ملوي','أبو قرقاص','دير مواس'],
    'بني سويف': ['بني سويف','الواسطى','ناصر','إهناسيا','ببا','سمسطا','الفشن'],
    'الفيوم': ['الفيوم','سنورس','إطسا','طامية','أبشواي','يوسف الصديق'],
    'الدقهلية': ['المنصورة','طلخا','ميت غمر','دكرنس','أجا','منية النصر','السنبلاوين','الكردي','بني عبيد','المنزلة','تمي الأمديد','الجمالية','شربين','المطرية','بلقاس','ميت سلسيل','جمصة'],
    'الشرقية': ['الزقازيق','العاشر من رمضان','منيا القمح','بلبيس','مشتول السوق','القنايات','أبو حماد','القرين','ههيا','أبو كبير','فاقوس','الصالحية','الإبراهيمية','ديرب نجم','كفر صقر','أولاد صقر','الحسينية'],
    'الغربية': ['طنطا','المحلة الكبرى','كفر الزيات','زفتى','السنطة','قطور','بسيون','سمنود'],
    'المنوفية': ['شبين الكوم','منوف','أشمون','الباجور','قويسنا','بركة السبع','تلا','الشهداء','السادات'],
    'القليوبية': ['بنها','قليوب','شبرا الخيمة','القناطر الخيرية','الخانكة','كفر شكر','طوخ','العبور','الخصوص'],
    'البحيرة': ['دمنهور','كفر الدوار','رشيد','إدكو','أبو المطامير','أبو حمص','الدلنجات','المحمودية','الرحمانية','إيتاي البارود','حوش عيسى','شبراخيت','كوم حمادة','بدر','وادي النطرون'],
    'كفر الشيخ': ['كفر الشيخ','دسوق','فوه','مطوبس','البرلس','بلطيم','الحامول','بيلا','الرياض','سيدي سالم','قلين'],
    'دمياط': ['دمياط','دمياط الجديدة','رأس البر','فارسكور','الزرقا','السرو','كفر سعد','كفر البطيخ'],
    'بورسعيد': ['بورسعيد','بور فؤاد','الزهور','الضواحي','العرب','المناخ','الشرق','الجنوب'],
    'الإسماعيلية': ['الإسماعيلية','فايد','القنطرة شرق','القنطرة غرب','التل الكبير','أبو صوير','القصاصين'],
    'السويس': ['السويس','الأربعين','عتاقة','الجناين','فيصل'],
    'البحر الأحمر': ['الغردقة','رأس غارب','سفاجا','القصير','مرسى علم','الشلاتين','حلايب'],
    'الوادي الجديد': ['الخارجة','باريس','الداخلة','الفرافرة','بلاط'],
    'مطروح': ['مرسى مطروح','الحمام','العلمين','الضبعة','النجيلة','سيدي براني','السلوم','سيوة'],
    'شمال سيناء': ['العريش','الشيخ زويد','رفح','بئر العبد','الحسنة','نخل'],
    'جنوب سيناء': ['الطور','شرم الشيخ','دهب','نويبع','طابا','سانت كاترين','أبو رديس','أبو زنيمة','رأس سدر'],
  };
}

class Product {
  String category; String name; String company; String spec;
  double wholesale; double retail;
  Product({required this.category, required this.name, required this.company, required this.spec, required this.wholesale, required this.retail});
}

class OrderModel {
  String type; String status; String date; String details;
  OrderModel({required this.type, required this.status, required this.date, required this.details});
}

class ProductRepo {
  static List<Product> products = [
    Product(category: 'أسلاك وكابلات', name: 'سلك 1.5 مم', company: 'السويدي', spec: '1.5 مم - 100م', wholesale: 610, retail: 680),
    Product(category: 'أسلاك وكابلات', name: 'سلك 2 مم', company: 'السويدي', spec: '2 مم - 100م', wholesale: 845, retail: 920),
    Product(category: 'أسلاك وكابلات', name: 'سلك 3 مم', company: 'السويدي', spec: '3 مم - 100م', wholesale: 1200, retail: 1350),
    Product(category: 'أسلاك وكابلات', name: 'سلك 4 مم', company: 'السويدي', spec: '4 مم - 100م', wholesale: 2015, retail: 2200),
    Product(category: 'أسلاك وكابلات', name: 'سلك 6 مم', company: 'السويدي', spec: '6 مم - 100م', wholesale: 3580, retail: 3800),
    Product(category: 'أسلاك وكابلات', name: 'سلك 10 مم', company: 'السويدي', spec: '10 مم - 50م', wholesale: 7905, retail: 8300),
    Product(category: 'أسلاك وكابلات', name: 'سلك 16 مم', company: 'السويدي', spec: '16 مم - 50م', wholesale: 9990, retail: 10500),
    Product(category: 'أسلاك وكابلات', name: 'سلك 2 مم', company: 'سمارت', spec: '2 مم', wholesale: 480, retail: 580),
    Product(category: 'أسلاك وكابلات', name: 'سلك 4 مم', company: 'سمارت', spec: '4 مم', wholesale: 900, retail: 1050),
    Product(category: 'مفاتيح وبرايز', name: 'مفتاح مفرد', company: 'سانشي', spec: 'أبيض بيانو', wholesale: 18, retail: 25),
    Product(category: 'مفاتيح وبرايز', name: 'مفتاح مجوز', company: 'سانشي', spec: 'بيانو', wholesale: 25, retail: 35),
    Product(category: 'مفاتيح وبرايز', name: 'بريزة قوى 16A', company: 'سانشي', spec: '16 أمبير', wholesale: 28, retail: 38),
    Product(category: 'مفاتيح وبرايز', name: 'وش مجوز', company: 'فينوس', spec: 'أبيض', wholesale: 15, retail: 22),
    Product(category: 'لوحات وقواطع', name: 'قاطع 10A', company: 'شنايدر', spec: 'أحادي 6KA', wholesale: 65, retail: 85),
    Product(category: 'لوحات وقواطع', name: 'قاطع 32A', company: 'ABB', spec: 'ثنائي', wholesale: 140, retail: 170),
    Product(category: 'لوحات وقواطع', name: 'لوحة 12 خط', company: 'فينوس', spec: 'صاج', wholesale: 350, retail: 450),
    Product(category: 'لوحات وقواطع', name: 'لوحة 24 خط', company: 'السويدي', spec: 'بلاستيك', wholesale: 650, retail: 800),
    Product(category: 'كشافات وليد', name: 'لمبة 9 وات', company: 'فينوس', spec: 'ليد أبيض', wholesale: 35, retail: 50),
    Product(category: 'كشافات وليد', name: 'سبوت 7 وات', company: 'اليوس', spec: 'ورم', wholesale: 28, retail: 40),
    Product(category: 'كشافات وليد', name: 'كشاف 50 وات', company: 'فينوس', spec: 'IP65 خارجي', wholesale: 320, retail: 400),
    Product(category: 'كشافات وليد', name: 'نجفة 3 ذراع', company: 'كريستال', spec: 'مودرن', wholesale: 850, retail: 1100),
    Product(category: 'كشافات وليد', name: 'أبليك حائط', company: 'مورا', spec: 'ديكور', wholesale: 180, retail: 250),
    Product(category: 'خراطيم ومواسير', name: 'خرطوم 16 مم', company: 'مصطفى محمود', spec: '45م سوستة', wholesale: 45, retail: 60),
    Product(category: 'تأسيس شقة كاملة', name: 'باكدج 100م', company: 'سويدي+سانشي', spec: 'شامل', wholesale: 18500, retail: 21000),
    Product(category: 'تأسيس شقة كاملة', name: 'باكدج 150م', company: 'سويدي+فينوس', spec: 'شامل', wholesale: 26500, retail: 29500),
  ];
  static List<OrderModel> orders = [
    OrderModel(type: 'طلب خدمة - كهرباء منزلية', status: 'قيد التنفيذ', date: '2026-10-10', details: 'عطل لوحة - مدينة نصر'),
  ];
}

class LoginPage extends StatefulWidget { const LoginPage({super.key}); @override State<LoginPage> createState() => _LoginPageState(); }
class _LoginPageState extends State<LoginPage> {
  String gov = 'القاهرة'; String center = 'مدينة نصر';
  final nameCtrl = TextEditingController(); final phoneCtrl = TextEditingController();
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF0A1931),
      body: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24),
        child: Column(children: [
          const Icon(Icons.electrical_services, color: Color(0xFFFFC93C), size: 70),
          const Text('كهربائي برو', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(28)),
            child: Column(children: [
              TextField(controller: nameCtrl, decoration: _dec('الاسم')),
              const SizedBox(height: 12),
              TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: _dec('الموبايل')),
              const SizedBox(height: 12),
              DropdownButtonFormField(value: gov, decoration: _dec('المحافظة'),
                items: AppData.govCenters.keys.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v){setState((){gov=v!; center=AppData.govCenters[gov]!.first;});}),
              const SizedBox(height: 12),
              DropdownButtonFormField(value: AppData.govCenters[gov]!.contains(center)?center:AppData.govCenters[gov]!.first, decoration: _dec('المركز'),
                items: AppData.govCenters[gov]!.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (v)=>setState(()=>center=v!)),
              const SizedBox(height: 20),
              SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFC93C), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MainShell(userName: nameCtrl.text.isEmpty?'ضيف':nameCtrl.text, gov: gov, center: center, phone: phoneCtrl.text)));},
                child: const Text('دخول', style: TextStyle(color: Color(0xFF0A1931), fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              const SizedBox(height: 8),
              Text('أورنج كاش ${AppData.orangeCash}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ]),
          ),
        ]),
      )),
    );
  }
  InputDecoration _dec(String l)=>InputDecoration(labelText: l, filled: true, fillColor: const Color(0xFFF3F3F3), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none));
}

class MainShell extends StatefulWidget {
  final String userName,gov,center,phone;
  const MainShell({super.key,required this.userName,required this.gov,required this.center,required this.phone});
  @override State<MainShell> createState()=>_MainShellState();
}
class _MainShellState extends State<MainShell> {
  int idx=0;
  @override Widget build(BuildContext context){
    final pages=[HomeScreen(userName: widget.userName), const OrdersScreen(), AccountScreen(name: widget.userName,gov: widget.gov,center: widget.center,phone: widget.phone)];
    return Scaffold(backgroundColor: const Color(0xFF0A1931), body: pages[idx],
      bottomNavigationBar: Container(decoration: const BoxDecoration(color: Color(0xFF152642), borderRadius: BorderRadius.vertical(top: Radius.circular(24))), padding: const EdgeInsets.only(top:8,bottom:12),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children:[
          _nav(0,Icons.home,'الرئيسية'), _nav(1,Icons.inventory_2_outlined,'الطلبات'), _nav(2,Icons.person,'الحساب'),
        ]),
      ),
    );
  }
  Widget _nav(int i, IconData ic, String t){bool sel=idx==i; return GestureDetector(onTap: ()=>setState(()=>idx=i), child: Column(children:[Icon(ic,color: sel?const Color(0xFFFFC93C):Colors.white54, size:28), Text(t,style: TextStyle(color: sel?const Color(0xFFFFC93C):Colors.white54, fontSize:12))]));}
}

class HomeScreen extends StatelessWidget {
  final String userName; const HomeScreen({super.key,required this.userName});
  @override Widget build(BuildContext context){
    return SafeArea(child: Column(children:[
      Padding(padding: const EdgeInsets.all(20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[
        const Text('الرئيسية', style: TextStyle(color: Colors.white, fontSize:24, fontWeight: FontWeight.bold)),
        Text('أهلا $userName', style: const TextStyle(color: Colors.white70)),
      ])),
      Expanded(child: Container(decoration: const BoxDecoration(color: Color(0xFFF5F0FF), borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
        child: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Column(children:[
          GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing:14, crossAxisSpacing:14, childAspectRatio:1.05, children:[
            _card(context,'طلب خدمة',Icons.assignment_outlined,Colors.white,(){Navigator.push(context,MaterialPageRoute(builder: (_)=>const RequestServicePage()));}),
            _card(context,'المعرض 3D',Icons.view_in_ar,const Color(0xFF162447),(){Navigator.push(context,MaterialPageRoute(builder: (_)=>GalleryPage()));},txt: Colors.white),
            _card(context,'خدمات الطوارئ',Icons.chat_bubble_outline,const Color(0xFF00E5CC),(){}),
            _card(context,'تتبع الطلب',Icons.location_on_outlined,const Color(0xFFFF9F45),(){Navigator.push(context,MaterialPageRoute(builder: (_)=>const OrdersScreen(showAppBar:true)));}),
            _card(context,'عروض الفنيين',Icons.local_offer_outlined,Colors.white,(){}),
            _card(context,'التقييمات',Icons.star_outline,Colors.white,(){}),
          ]),
          const SizedBox(height:90),
        ])),
      )),
    ]));
  }
  Widget _card(BuildContext c,String t,IconData ic,Color bg,VoidCallback tap,{Color txt=const Color(0xFF0A1931)}){
    return GestureDetector(onTap: tap, child: Container(decoration: BoxDecoration(color:bg, borderRadius: BorderRadius.circular(20)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[Icon(ic,size:40,color:txt), const SizedBox(height:10), Text(t,style: TextStyle(color:txt,fontWeight: FontWeight.bold))])));
  }
}

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});
  final cats=[
    {'title':'أسلاك وكابلات (سويدي - سمارت)','icon':'⚡','cat':'أسلاك وكابلات'},
    {'title':'مفاتيح وبرايز (سانشي - فينوس)','icon':'🔌','cat':'مفاتيح وبرايز'},
    {'title':'كشافات وليد','icon':'💡','cat':'كشافات وليد'},
    {'title':'لوحات وقواطع','icon':'⚙️','cat':'لوحات وقواطع'},
    {'title':'خراطيم ومواسير','icon':'🧰','cat':'خراطيم ومواسير'},
    {'title':'تأسيس شقة كاملة','icon':'🏗️','cat':'تأسيس شقة كاملة'},
  ];
  @override Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: const Text('المعرض'), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: ()=>Navigator.pop(context))),
      body: GridView.builder(padding: const EdgeInsets.all(16), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing:14,mainAxisSpacing:14,childAspectRatio:0.9), itemCount:cats.length,
        itemBuilder: (cc,i){return GestureDetector(onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (_)=>CategoryProductsPage(category: cats[i]['cat']!, title: cats[i]['title']!))),
          child: Container(decoration: BoxDecoration(color: const Color(0xFF162447), borderRadius: BorderRadius.circular(22)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
              Text(cats[i]['icon']!, style: const TextStyle(fontSize:48)),
              const SizedBox(height:12),
              Padding(padding: const EdgeInsets.symmetric(horizontal:8), child: Text(cats[i]['title']!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:13))),
            ]),
          ),
        );},
      ),
    );
  }
}

class CategoryProductsPage extends StatefulWidget {final String category,title; const CategoryProductsPage({super.key,required this.category,required this.title}); @override State<CategoryProductsPage> createState()=>_CatState();}
class _CatState extends State<CategoryProductsPage> {
  @override Widget build(BuildContext context){
    var list=ProductRepo.products.where((p)=>p.category==widget.category).toList();
    return Scaffold(appBar: AppBar(title: Text(widget.title, style: const TextStyle(fontSize:14)), backgroundColor: const Color(0xFF0A1931), foregroundColor: Colors.white),
      floatingActionButton: FloatingActionButton.extended(backgroundColor: const Color(0xFFFFC93C), onPressed: ()=>_add(), icon: const Icon(Icons.add, color: Color(0xFF0A1931)), label: const Text('اضافة منتج', style: TextStyle(color: Color(0xFF0A1931), fontWeight: FontWeight.bold))),
      body: ListView.builder(padding: const EdgeInsets.all(12), itemCount:list.length, itemBuilder: (cc,i){
        var p=list[i];
        return Card(child: ListTile(
          title: Text('${p.name} - ${p.company}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize:14)),
          subtitle: Text('${p.spec} - جملة:${p.wholesale} - قطاعي:${p.retail}'),
          trailing: IconButton(icon: const Icon(Icons.add_shopping_cart, color: Color(0xFF0A1931)),
            onPressed: (){ProductRepo.orders.add(OrderModel(type: 'منتج ${p.name}', status: 'جديد', date: DateTime.now().toString().substring(0,10), details: p.company)); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('أضيف للطلبات')));} ),
        ));
      }),
    );
  }
  void _add(){
    final n=TextEditingController(); final comp=TextEditingController(text:'السويدي'); final spec=TextEditingController(); final w=TextEditingController(); final r=TextEditingController();
    showDialog(context: context, builder: (_)=>AlertDialog(title: Text('اضافة في ${widget.category}'),
      content: SingleChildScrollView(child: Column(children:[
        TextField(controller: n, decoration: const InputDecoration(labelText:'اسم المنتج')),
        TextField(controller: comp, decoration: const InputDecoration(labelText:'الشركة')),
        TextField(controller: spec, decoration: const InputDecoration(labelText:'المواصفة')),
        TextField(controller: w, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText:'جملة')),
        TextField(controller: r, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText:'قطاعي')),
      ])),
      actions:[TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('الغاء')),
        ElevatedButton(onPressed: (){setState(()=>ProductRepo.products.add(Product(category: widget.category, name: n.text, company: comp.text, spec: spec.text, wholesale: double.tryParse(w.text)??0, retail: double.tryParse(r.text)??0))); Navigator.pop(context);}, child: const Text('حفظ')),
      ],
    ));
  }
}

class RequestServicePage extends StatefulWidget {const RequestServicePage({super.key}); @override State<RequestServicePage> createState()=>_ReqState();}
class _ReqState extends State<RequestServicePage> {String type='كهرباء منزلية'; @override Widget build(BuildContext context){
  return Scaffold(appBar: AppBar(title: const Text('طلب خدمة')),
    body: Padding(padding: const EdgeInsets.all(20), child: Column(children:[
      DropdownButtonFormField(value: type, items: ['كهرباء منزلية','تأسيس شقة','صيانة أعطال','تركيب نجف'].map((e)=>DropdownMenuItem(value:e, child: Text(e))).toList(), onChanged: (v)=>setState(()=>type=v!)),
      const SizedBox(height:20),
      TextField(decoration: InputDecoration(hintText:'الموقع', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
      const SizedBox(height:20),
      SizedBox(width: double.infinity, height:56, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0A1931)),
        onPressed: (){ProductRepo.orders.add(OrderModel(type: 'خدمة $type', status: 'جديد', date: DateTime.now().toString().substring(0,10), details: 'طلب جديد')); Navigator.pop(context);},
        child: const Text('ارسال', style: TextStyle(color: Colors.white)),
      )),
    ])),
  );
}}

class OrdersScreen extends StatelessWidget {final bool showAppBar; const OrdersScreen({super.key,this.showAppBar=false}); @override Widget build(BuildContext context){
  return Scaffold(backgroundColor: const Color(0xFFF5F0FF), appBar: showAppBar?AppBar(title: const Text('الطلبات'), backgroundColor: const Color(0xFF0A1931), foregroundColor: Colors.white):null,
    body: SafeArea(child: Column(children:[
      if(!showAppBar) const Padding(padding: EdgeInsets.all(20), child: Align(alignment: Alignment.centerRight, child: Text('الطلبات', style: TextStyle(fontSize:26, fontWeight: FontWeight.bold)))),
      Expanded(child: Container(decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: ListView.builder(padding: const EdgeInsets.all(16), itemCount: ProductRepo.orders.length, itemBuilder: (cc,i){
          var o=ProductRepo.orders[i]; return Card(child: ListTile(title: Text(o.type, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${o.details} - ${o.date}'), trailing: Text(o.status)));
        }),
      )),
    ])),
  );
}}

class AccountScreen extends StatelessWidget {final String name,gov,center,phone; const AccountScreen({super.key,required this.name,required this.gov,required this.center,required this.phone}); @override Widget build(BuildContext context){
  return SafeArea(child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
    const Text('الحساب', style: TextStyle(color: Colors.white, fontSize:26, fontWeight: FontWeight.bold)), const SizedBox(height:20),
    Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children:[
        CircleAvatar(radius:40, backgroundColor: const Color(0xFFFFC93C), child: Text(name.isEmpty?'ض':name[0], style: const TextStyle(fontSize:32, fontWeight: FontWeight.bold, color: Color(0xFF0A1931)))),
        const SizedBox(height:12), Text(name, style: const TextStyle(fontSize:18, fontWeight: FontWeight.bold)), Text('$gov - $center'), const Divider(),
        ListTile(leading: const Icon(Icons.phone), title: Text(phone.isEmpty?'غير مسجل':phone), subtitle: const Text('الموبايل')),
        ListTile(leading: const Icon(Icons.payment), title: Text(AppData.orangeCash), subtitle: const Text('أورنج كاش 01281721320')),
        ListTile(leading: const Icon(Icons.account_balance_wallet), title: Text(AppData.instapay), subtitle: const Text('انستا باي')),
      ]),
    ),
  ])));
}}