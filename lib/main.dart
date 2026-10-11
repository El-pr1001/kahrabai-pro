import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,home:LoginScreen()));

class Product{
 String id,name,category,image;
 double gomla,etaai;
 Product({required this.id,required this.name,required this.category,required this.image,required this.gomla,required this.etaai});
}
class AppSettings{
 static String orangeCash='01281721320';
 static String instaPay='@gerges_insta';
 static List<String> govs=['القاهرة','الجيزة','الإسكندرية','الدقهلية','البحر الأحمر','البحيرة','الفيوم','الغربية','الإسماعيلية','المنوفية','المنيا','القليوبية','الوادي الجديد','السويس','اسوان','اسيوط','بني سويف','بورسعيد','دمياط','الشرقية','جنوب سيناء','كفر الشيخ','مطروح','الأقصر','قنا','شمال سيناء','سوهاج'];
 static Map<String,List<String>> centers={
   'سوهاج':['طما','طهطا','المراغة','ساقلتة','اخميم','المنشاة','جرجا','البلينا','دار السلام','جهينة'],
   'القاهرة':['حلوان','المعادي','مدينة نصر'],
   'قنا':['قنا','قوص','نقادة','دشنا','نجع حمادي'],
 };
 static List<Product> products=[
   Product(id:'1',name:'لفة سلك 2م سويدي أصلي',category:'أسلاك وكابلات (سويدي - سمارت)',image:'⚡',gomla:850,etaai:1050),
   Product(id:'2',name:'مفتاح سانشي شيك',category:'مفاتيح وبرايز (سانشي - فينوس)',image:'🔌',gomla:35,etaai:55),
   Product(id:'3',name:'كشاف ليد 50 وات',category:'كشافات وليد',image:'💡',gomla:180,etaai:250),
   Product(id:'4',name:'لوحة 12 خط فينوس',category:'لوحات وقواطع',image:'⚙️',gomla:320,etaai:450),
   Product(id:'5',name:'خرطوم سوستة 20م',category:'خراطيم ومواسير',image:'🧰',gomla:60,etaai:90),
   Product(id:'6',name:'باكدج تأسيس شقة 100م',category:'تأسيس شقة كاملة',image:'🏗️',gomla:8500,etaai:11000),
 ];
 static List<Product> cart=[];
}

// ... باقي الشاشات (Login + OwnerDash فيه إعدادات الدفع القابلة للتعديل + Store بكرت 3D بتنور + بحث + سلة + واتساب + إضافة منتج بدون Firebase)

class LoginScreen extends StatefulWidget{State<LoginScreen> createState()=>_L();}
class _L extends State<LoginScreen>{
 String sel='زبون';
 Widget build(BuildContext c)=>Scaffold(body:SingleChildScrollView(padding:EdgeInsets.all(20),child:Column(children:[
  SizedBox(height:60),Container(padding:EdgeInsets.all(16),decoration:BoxDecoration(color:Color(0xFF0A2342),borderRadius:BorderRadius.circular(20)),child:Text('كهربائي برو ⚡',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.bold))),
  Wrap(spacing:8,children:['زبون','فني','مهندس','شركة مقاولات'].map((t)=>ChoiceChip(label:Text(t),selected:sel==t,selectedColor:Colors.amber,onSelected:(v)=>setState(()=>sel=t))).toList()),
  SizedBox(height:20),SizedBox(width:double.infinity,height:50,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.amber),onPressed:(){Navigator.push(c,MaterialPageRoute(builder:(_)=>HomeScreen()));},child:Text('دخول كـ $sel'))),
  TextButton(onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>OwnerDash())),child:Text('دخول مالك التطبيق - جرجس')),
 ])));
}
class OwnerDash extends StatefulWidget{State<OwnerDash> createState()=>_O();}
class _O extends State<OwnerDash>{
 late TextEditingController o,i;void initState(){super.initState();o=TextEditingController(text:AppSettings.orangeCash);i=TextEditingController(text:AppSettings.instaPay);}
 Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('لوحة تحكم المالك')),body:ListView(padding:EdgeInsets.all(16),children:[
  Card(color:Colors.green.shade50,child:Padding(padding:EdgeInsets.all(12),child:Column(children:[
   Text('إعدادات الدفع - انت هتربطها بنفسك',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.green)),
   TextField(controller:o,decoration:InputDecoration(labelText:'رقم اورنج كاش 01281721320',prefixIcon:Icon(Icons.phone_android))),
   TextField(controller:i,decoration:InputDecoration(labelText:'عنوان انستا باي IPA @',prefixIcon:Icon(Icons.account_balance_wallet))),
   ElevatedButton(onPressed:(){AppSettings.orangeCash=o.text;AppSettings.instaPay=i.text;ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('تم الحفظ')));},child:Text('حفظ')),
  ]))),
  ElevatedButton.icon(icon:Icon(Icons.add),label:Text('إضافة منتج جديد من موبايلك بدون Firebase'),onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>AddProductScreen()))),
  ...AppSettings.products.map((p)=>Card(child:ListTile(leading:Text(p.image,style:TextStyle(fontSize:30)),title:Text(p.name),subtitle:Text('جملة ${p.gomla} - قطاعي ${p.etaai}')))).toList(),
 ]));
}
class AddProductScreen extends StatefulWidget{State<AddProductScreen> createState()=>_Add();}
class _Add extends State<AddProductScreen>{
 String cat='أسلاك وكابلات (سويدي - سمارت)';final nameCtrl=TextEditingController();final gomlaCtrl=TextEditingController();final etaaiCtrl=TextEditingController();
 Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('إضافة منتج بدون Firebase')),body:Padding(padding:EdgeInsets.all(16),child:Column(children:[
  DropdownButtonFormField(value:cat,items:['أسلاك وكابلات (سويدي - سمارت)','مفاتيح وبرايز (سانشي - فينوس)','كشافات وليد','لوحات وقواطع','خراطيم ومواسير','اكسسوارات','تأسيس شقة كاملة'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged:(v)=>setState(()=>cat=v as String)),
  TextField(controller:nameCtrl,decoration:InputDecoration(labelText:'اسم المنتج')),TextField(controller:gomlaCtrl,decoration:InputDecoration(labelText:'سعر الجملة')),TextField(controller:etaaiCtrl,decoration:InputDecoration(labelText:'سعر القطاعى')),
  SizedBox(height:20),ElevatedButton(onPressed:(){AppSettings.products.add(Product(id:DateTime.now().toString(),name:nameCtrl.text,category:cat,image:'📦',gomla:double.tryParse(gomlaCtrl.text)??0,etaai:double.tryParse(etaaiCtrl.text)??0));Navigator.pop(c);},child:Text('إضافة')),
 ])));
}
class HomeScreen extends StatelessWidget{
 Widget build(BuildContext c)=>Scaffold(backgroundColor:Color(0xFF0A2342),body:SafeArea(child:Column(children:[
  Padding(padding:EdgeInsets.all(20),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('الرئيسية',style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.bold)),IconButton(icon:Icon(Icons.shopping_cart,color:Colors.white),onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>CartScreen())))])),
  Expanded(child:Container(decoration:BoxDecoration(color:Color(0xFFF8F6FF),borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30))),child:GridView.count(crossAxisCount:2,padding:EdgeInsets.all(20),children:[
   _card(c,'طلب خدمة',()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>ReqScreen()))),_card(c,'المعرض 🔥',()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>StoreMainScreen()))),
  ]))),
 ])));
 Widget _card(BuildContext c,String t,VoidCallback tap)=>GestureDetector(onTap:tap,child:Container(margin:EdgeInsets.all(6),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(20)),child:Center(child:Text(t,style:TextStyle(fontWeight:FontWeight.bold)))));
}
class ReqScreen extends StatefulWidget{State<ReqScreen> createState()=>_Req();}
class _Req extends State<ReqScreen>{String? gov,center;Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('طلب خدمة')),body:Padding(padding:EdgeInsets.all(16),child:Column(children:[
 DropdownButtonFormField(value:gov,hint:Text('اختر المحافظة - 27 محافظة'),items:AppSettings.govs.map((g)=>DropdownMenuItem(value:g,child:Text(g))).toList(),onChanged:(v){setState((){gov=v as String;});}),
 if(gov!=null)DropdownButtonFormField(value:center,hint:Text('اختر المركز - يظهر أوتوماتيك'),items:(AppSettings.centers[gov]??['المركز الرئيسي']).map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged:(v)=>setState(()=>center=v as String)),
 ElevatedButton(onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>CartScreen())),child:Text('إرسال')),
])));}
class StoreMainScreen extends StatelessWidget{
 final cats=[{'name':'أسلاك وكابلات (سويدي - سمارت)','icon':'⚡'},{'name':'مفاتيح وبرايز (سانشي - فينوس)','icon':'🔌'},{'name':'كشافات وليد','icon':'💡'},{'name':'لوحات وقواطع','icon':'⚙️'},{'name':'خراطيم ومواسير','icon':'🧰'},{'name':'تأسيس شقة كاملة','icon':'🏗️'}];
 Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('المعرض - كروت 3D بتنور')),body:GridView.builder(padding:EdgeInsets.all(12),gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),itemCount:cats.length,itemBuilder:(ctx,i){var cat=cats[i];return GestureDetector(onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>ProductsListScreen(category:cat['name'] as String))),child:Container(margin:EdgeInsets.all(6),decoration:BoxDecoration(gradient:LinearGradient(colors:[Color(0xFF0A2342),Color(0xFF1E3A5F)]),borderRadius:BorderRadius.circular(20),boxShadow:[BoxShadow(color:Colors.amber.withOpacity(0.4),blurRadius:10)]),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Text(cat['icon'] as String,style:TextStyle(fontSize:50)),Text(cat['name'] as String,textAlign:TextAlign.center,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))])));}));
}
class ProductsListScreen extends StatelessWidget{
 final String category;ProductsListScreen({required this.category});
 Widget build(BuildContext c){
  var list=AppSettings.products.where((p)=>p.category==category).toList();
  return Scaffold(appBar:AppBar(title:Text(category)),body:ListView.builder(itemCount:list.length,itemBuilder:(ctx,i){var p=list[i];return Card(child:ListTile(leading:Text(p.image,style:TextStyle(fontSize:30)),title:Text(p.name),subtitle:Text('جملة ${p.gomla} - قطاعي ${p.etaai}'),trailing:IconButton(icon:Icon(Icons.add_shopping_cart),onPressed:(){AppSettings.cart.add(p);ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('اضيف للسلة')));} )));}));
 }
}
class CartScreen extends StatefulWidget{State<CartScreen> createState()=>_Cart();}
class _Cart extends State<CartScreen>{
 String method='orange';double get total=>AppSettings.cart.fold(0,(s,p)=>s+p.etaai);
 Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text('السلة - واتساب + دفع')),body:Column(children:[
  Expanded(child:ListView.builder(itemCount:AppSettings.cart.length,itemBuilder:(ctx,i){var p=AppSettings.cart[i];return ListTile(title:Text(p.name),subtitle:Text('قطاعي ${p.etaai} - جملة ${p.gomla}'),trailing:IconButton(icon:Icon(Icons.delete),onPressed:(){setState(()=>AppSettings.cart.removeAt(i));}));})),
  Padding(padding:EdgeInsets.all(16),child:Column(children:[
   Text('الإجمالي $total ج',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
   RadioListTile(value:'orange',groupValue:method,title:Text('اورنج كاش ${AppSettings.orangeCash}'),onChanged:(v)=>setState(()=>method=v!)),
   RadioListTile(value:'insta',groupValue:method,title:Text('انستا باي ${AppSettings.instaPay}'),subtitle:Text('يظهر IPA و QR Code'),onChanged:(v)=>setState(()=>method=v!)),
   if(method=='insta')Container(padding:EdgeInsets.all(8),color:Colors.purple.shade50,child:Column(children:[Text('IPA: ${AppSettings.instaPay}'),Icon(Icons.qr_code,size:80),Text('يحول ويرفع سكرين شوت ويجيلك إشعار طلب جديد مدفوع')])),
   ElevatedButton.icon(icon:Icon(Icons.upload),label:Text('رفع سكرين شوت التحويل'),onPressed:(){}),
   SizedBox(height:8),SizedBox(width:double.infinity,height:50,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.green),onPressed:(){},child:Text('طلب واتساب - ${AppSettings.cart.length} منتج',style:TextStyle(color:Colors.white)))),
  ])),
 ]));
}
