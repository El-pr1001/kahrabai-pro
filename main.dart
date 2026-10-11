import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(KahrabaiProApp());

class KahrabaiProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home: MainNavigation(),
    );
  }
}

class Product {
  String name; String category; double retail; double wholesale;
  Product({required this.name, required this.category, required this.retail, required this.wholesale});
  Map toJson() => {'name':name,'category':category,'retail':retail,'wholesale':wholesale};
  static Product fromJson(Map j) => Product(name:j['name'], category:j['category'], retail:(j['retail'] as num).toDouble(), wholesale:(j['wholesale'] as num).toDouble());
}

const govData = {
 "القاهرة": ["حلوان","المعادي","مدينة نصر","مصر الجديدة"],
 "الجيزة": ["الدقي","الهرم","6 أكتوبر","الشيخ زايد"],
 "الإسكندرية": ["المنتزه","سيدي جابر","العجمي"],
 "سوهاج": ["سوهاج","طما","طهطا","المراغة","جرجا","البلينا","المنشأة","أخميم"],
 "الدقهلية": ["المنصورة","طلخا","ميت غمر"],
 "الشرقية": ["الزقازيق","بلبيس","العاشر من رمضان"],
};

class MainNavigation extends StatefulWidget { @override _MainNavigationState createState()=>_MainNavigationState(); }
class _MainNavigationState extends State<MainNavigation> {
  int index=0;
  List<Widget> screens=[HomeMain(), OrdersScreen(), AccountScreen()];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color(0xFF0A2342), borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, elevation:0, currentIndex:index, onTap:(i)=>setState(()=>index=i),
          selectedItemColor: Color(0xFFFFC107), unselectedItemColor: Colors.white70, type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home), label:"الرئيسية"),
            BottomNavigationBarItem(icon:Icon(Icons.receipt_long), label:"الطلبات"),
            BottomNavigationBarItem(icon:Icon(Icons.person), label:"الحساب"),
          ]
        ),
      )
    );
  }
}

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Color(0xFF0A2342),
      body: SafeArea(child: Column(children:[
        Padding(padding: EdgeInsets.all(16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[SizedBox(width:24), Text("الرئيسية", style:TextStyle(color:Colors.white, fontSize:26, fontWeight:FontWeight.bold)), Icon(Icons.more_horiz, color:Colors.white)])),
        Expanded(child: Padding(padding: EdgeInsets.all(16), child: Column(children:[
          Expanded(child: Row(children:[
            _buildCard(context, "طلب خدمة", Icons.request_page, Colors.white, Colors.black, (){ Navigator.push(context, MaterialPageRoute(builder:(_)=>RequestServiceScreen())); }),
            SizedBox(width:12),
            _buildCard(context, "كهربائيون قرييون", Icons.work, Color(0xFFFFC107), Colors.black, (){ Navigator.push(context, MaterialPageRoute(builder:(_)=>NearbyElectricians())); }),
          ])),
          SizedBox(height:12),
          Expanded(child: Row(children:[
            _buildCard(context, "خدمات الطوارئ", Icons.chat_bubble, Color(0xFF2EC4B6), Colors.black, (){}),
            SizedBox(width:12),
            _buildCard(context, "تتبع الطلب", Icons.location_on, Color(0xFFFF9F1C), Colors.black, (){}),
          ])),
          SizedBox(height:12),
          Expanded(child: Row(children:[
            _buildCard(context, "عروض الفنيين", Icons.local_offer, Colors.white, Colors.black, (){ Navigator.push(context, MaterialPageRoute(builder:(_)=>StoreScreen())); }),
            SizedBox(width:12),
            _buildCard(context, "التقييمات", Icons.star, Colors.white, Colors.black, (){}),
          ])),
          SizedBox(height:20),
          SizedBox(width: double.infinity, height:55, child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), shape: StadiumBorder()), onPressed:(){}, icon: Icon(Icons.phone, color:Colors.black), label: Text("اتصل بالفني", style:TextStyle(color:Colors.black, fontSize:16, fontWeight:FontWeight.bold)))),
          SizedBox(height:10),
        ]))),
      ])),
    );
  }
  Widget _buildCard(BuildContext ctx, String title, IconData icon, Color bg, Color txtColor, VoidCallback tap){
    return Expanded(child: GestureDetector(onTap:tap, child: Container(decoration: BoxDecoration(color:bg, borderRadius: BorderRadius.circular(18)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[Icon(icon, size:40), SizedBox(height:10), Text(title, textAlign:TextAlign.center, style:TextStyle(fontWeight:FontWeight.bold, color:txtColor))]))));
  }
}

class RequestServiceScreen extends StatefulWidget { @override _RequestState createState()=>_RequestState(); }
class _RequestState extends State<RequestServiceScreen> {
  String problemType="كهرباء منزلية"; String gov="القاهرة"; String markaz="حلوان"; String budget="اختر الميزانية"; String orange="01281721320"; String ipa="@yourIPA"; String pay="orange";
  List<String> problems=["كهرباء منزلية","تأسيس شقة","عطل طارئ","تركيب نجف وليد","لوحة مفاتيح"];
  List<String> budgets=["100 - 250 جنيه","250 - 500 جنيه","500 - 1000 جنيه","أكثر من 1000"];
  @override
  void initState(){ super.initState(); _loadPay(); }
  Future<void> _loadPay() async { final p=await SharedPreferences.getInstance(); setState((){ orange=p.getString('orange')??orange; ipa=p.getString('ipa')??ipa; }); }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF2EC4B6),
      body: Column(children:[
        SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[GestureDetector(onTap:()=>Navigator.pop(context), child:Icon(Icons.arrow_back_ios, color:Colors.black)), Text("طلب خدمة", style:TextStyle(fontSize:24, fontWeight:FontWeight.bold)), Icon(Icons.person_outline) ]))),
        Expanded(child: Container(decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))), padding: EdgeInsets.all(20), child: ListView(children:[
          Text("اختر نوع المشكلة", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          DropdownButtonFormField(value:problemType, items: problems.map((e)=>DropdownMenuItem(value:e, child:Text(e))).toList(), onChanged:(v)=>setState(()=>problemType=v!), decoration: _dec()),
          SizedBox(height:16),
          Text("الموقع", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          DropdownButtonFormField(value:gov, items: govData.keys.map((e)=>DropdownMenuItem(value:e, child:Text(e))).toList(), onChanged:(v){ setState((){ gov=v!; markaz=(govData[gov] as List).first; }); }, decoration: _dec().copyWith(hintText:"المحافظة")),
          SizedBox(height:8),
          DropdownButtonFormField(value:markaz, items: (govData[gov] as List).map((e)=>DropdownMenuItem(value:e as String, child:Text(e))).toList(), onChanged:(v)=>setState(()=>markaz=v!), decoration: _dec().copyWith(hintText:"المركز")),
          SizedBox(height:16),
          Text("الموعد المناسب", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          TextFormField(decoration: _dec().copyWith(hintText:"اختر الموعد - مثال: اليوم 5 مساء")),
          SizedBox(height:16),
          Text("الميزانية التقريبية", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          DropdownButtonFormField(items: budgets.map((e)=>DropdownMenuItem(value:e, child:Text(e))).toList(), onChanged:(v)=>setState(()=>budget=v!), decoration: _dec().copyWith(hintText:"اختر الميزانية")),
          SizedBox(height:16),
          Text("طريقة الدفع", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          RadioListTile(value:"orange", groupValue:pay, onChanged:(v)=>setState(()=>pay=v!), title:Text("أورنج كاش - $orange")),
          RadioListTile(value:"insta", groupValue:pay, onChanged:(v)=>setState(()=>pay=v!), title:Text("انستا باي - $ipa")),
          SizedBox(height:16),
          Text("اضف صوراً أو فيديو", style:TextStyle(fontWeight:FontWeight.bold)), SizedBox(height:8),
          Row(children:[
            Container(width:80, height:80, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color:Colors.grey.shade300)),
            SizedBox(width:10),
            Container(width:80, height:80, decoration: BoxDecoration(border: Border.all(color:Colors.grey.shade300), borderRadius: BorderRadius.circular(15)), child: Icon(Icons.camera_alt)),
            SizedBox(width:10),
            Container(width:80, height:80, decoration: BoxDecoration(color:Color(0xFFFFC107), borderRadius: BorderRadius.circular(15)), child: Icon(Icons.person_search)),
          ]),
          SizedBox(height:20),
          SizedBox(height:55, width:double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A2342), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))), onPressed:(){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("تم إرسال طلبك - $gov - $markaz - الدفع: $pay"))); }, child: Text("إرسال الطلب", style:TextStyle(color:Colors.white, fontSize:16)))),
        ]))),
      ]),
    );
  }
  InputDecoration _dec(){ return InputDecoration(filled:true, fillColor: Colors.grey.shade100, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none), contentPadding: EdgeInsets.symmetric(horizontal:16, vertical:14)); }
}

class NearbyElectricians extends StatelessWidget { @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title:Text("كهربائيون قريبيون")), body: Center(child:Text("خريطة أقرب الفنيين"))); } }
class StoreScreen extends StatefulWidget { @override _StoreState createState()=>_StoreState(); }
class _StoreState extends State<StoreScreen> {
  List<Product> products=[]; @override void initState(){ super.initState(); load(); }
  Future<void> load() async { final p=await SharedPreferences.getInstance(); String? js=p.getString('products'); if(js!=null) setState(()=>products=(jsonDecode(js) as List).map((e)=>Product.fromJson(e)).toList()); else setState(()=>products=[Product(name:"لفة سلك 2مم سويدي", category:"أسلاك", retail:750, wholesale:680)]); }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title:Text("المعرض - عروض الفنيين")), body: GridView.builder(padding: EdgeInsets.all(12), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), itemCount: products.length, itemBuilder:(ctx,i){ var pr=products[i]; return Card(child: Column(children:[Icon(Icons.electrical_services, size:40), Text(pr.name), Text("قطاعي ${pr.retail}ج")]));})); }
}
class OrdersScreen extends StatelessWidget { @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title:Text("الطلبات")), body: Center(child:Text("قائمة طلباتك"))); } }
class AccountScreen extends StatefulWidget { @override _AccState createState()=>_AccState(); }
class _AccState extends State<AccountScreen> {
  TextEditingController orangeC=TextEditingController(text:"01281721320"); TextEditingController ipaC=TextEditingController(text:"@yourIPA");
  @override void initState(){ super.initState(); load(); }
  Future<void> load() async { final p=await SharedPreferences.getInstance(); setState((){ orangeC.text=p.getString('orange')??"01281721320"; ipaC.text=p.getString('ipa')??"@yourIPA"; }); }
  @override Widget build(BuildContext c){ return Scaffold(appBar: AppBar(title:Text("الحساب - أدمن")), body: Padding(padding: EdgeInsets.all(16), child: Column(children:[TextField(controller:orangeC, decoration: InputDecoration(labelText:"رقم أورنج كاش")), TextField(controller:ipaC, decoration: InputDecoration(labelText:"عنوان انستا باي @")), SizedBox(height:20), ElevatedButton(onPressed:() async { final p=await SharedPreferences.getInstance(); p.setString('orange', orangeC.text); p.setString('ipa', ipaC.text); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("تم الحفظ"))); }, child: Text("حفظ"))]))); }
}
