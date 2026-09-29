import 'package:flutter/material.dart';

void main() => runApp(KahrabaiProApp());

// ===== لوحة التحكم - الأسعار اللي انت تتحكم فيها =====
class PricingControl {
  static Map<String, int> prices = {
    'فني': 100,
    'مهندس': 250,
    'شركة': 500,
  };
  static Map<String, int> areaPrices = {
    'القاهرة': 100,
    'شبرا الخيمة': 100,
    'قنا': 100,
    'الضبعة': 100,
    'المونوريل': 100,
    'العاصمة': 100,
  };
  static double commission = 15;
  static double emergencyMultiplier = 2.0;
}

class KahrabaiProApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A2342),
        scaffoldBackgroundColor: Color(0xFFF5F7FA),
      ),
      home: LoginScreen(),
    );
  }
}

// 1 - تسجيل الدخول - 4 أنواع
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'زبون';
  List<String> roles = ['زبون', 'فني', 'مهندس', 'شركة مقاولات'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(color: Color(0xFF0A2342), borderRadius: BorderRadius.circular(20)),
              child: Text('كهربائي برو ⚡', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Text('مرحباً بك!', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text('اختر نوع الحساب', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 15),
            Wrap(
              spacing: 8,
              children: roles.map((r) => ChoiceChip(
                label: Text(r),
                selected: selectedRole == r,
                selectedColor: Color(0xFFFFC107),
                onSelected: (v) => setState(() => selectedRole = r),
              )).toList(),
            ),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'رقم الهاتف', border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone))),
            SizedBox(height: 12),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'كلمة المرور', border: OutlineInputBorder())),
            SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), padding: EdgeInsets.all(16)),
              onPressed: () {
                if (selectedRole == 'زبون') {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SubscriptionScreen(role: selectedRole)));
                }
              },
              child: Text('تسجيل الدخول كـ $selectedRole', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
            )),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdminPanel())), child: Text('دخول كـ مالك التطبيق (لوحة التحكم)', style: TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }
}

// 2 - الرئيسية
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('كهربائي برو'), backgroundColor: Color(0xFF0A2342), foregroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12,
          children: [
            HomeCard(icon: Icons.home, title: 'طلب منزلي', color: Colors.orange, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceRequestScreen(type: 'منزلية')))),
            HomeCard(icon: Icons.factory, title: 'طلب صناعي', color: Colors.blue, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceRequestScreen(type: 'صناعية')))),
            HomeCard(icon: Icons.location_on, title: 'كهربائيون قريبون', color: Colors.green, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MapScreen()))),
            HomeCard(icon: Icons.warning, title: 'طوارئ (ضعف السعر)', color: Colors.red, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ServiceRequestScreen(type: 'طوارئ - السعر x${PricingControl.emergencyMultiplier}')))),
            HomeCard(icon: Icons.local_offer, title: 'عروض الفنيين', color: Colors.purple, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OffersScreen()))),
            HomeCard(icon: Icons.track_changes, title: 'تتبع الطلب', color: Colors.teal, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
class HomeCard extends StatelessWidget {
  final IconData icon; final String title; final Color color; final VoidCallback onTap;
  HomeCard({required this.icon, required this.title, required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 40, color: color), SizedBox(height: 8), Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)) ])));
  }
}

// 3 - طلب خدمة
class ServiceRequestScreen extends StatelessWidget {
  final String type;
  ServiceRequestScreen({required this.type});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('طلب $type')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(maxLines: 4, decoration: InputDecoration(hintText: 'اكتب وصف المشكلة...', border: OutlineInputBorder(), labelText: 'وصف المشكلة ($type)')),
            SizedBox(height: 12),
            ListTile(leading: Icon(Icons.location_on, color: Colors.red), title: Text('الموقع الحالي'), subtitle: Text('المعادي، القاهرة - ${PricingControl.areaPrices['القاهرة']}ج سعر المنطقة')),
            SizedBox(height: 12),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), padding: EdgeInsets.all(16)), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MapScreen())), child: Text('ابحث عن فنيين قريبين', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}

// 4 - الخريطة
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('أقرب الفنيين - على الخريطة')),
      body: Column(
        children: [
          Container(height: 250, color: Colors.grey[300], child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.map, size: 80, color: Colors.grey[600]), Text('الخريطة - 3 فنيين قريبين')] ))),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                TechTile(name: 'أحمد محمود - فني', distance: '1.2 كم', rating: '4.8', price: '${PricingControl.prices['فني']}ج/شهر', active: true),
                TechTile(name: 'م. سامي حسن - مهندس', distance: '0.8 كم', rating: '4.9', price: '${PricingControl.prices['مهندس']}ج/شهر', active: true),
                TechTile(name: 'شركة النور للمقاولات', distance: '2.1 كم', rating: '5.0', price: '${PricingControl.prices['شركة']}ج/شهر', active: false),
                SizedBox(height: 10),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107)), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OffersScreen())), child: Text('شوف عروض الأسعار', style: TextStyle(color: Colors.black))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class TechTile extends StatelessWidget {
  final String name, distance, rating, price; final bool active;
  TechTile({required this.name, required this.distance, required this.rating, required this.price, required this.active});
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text(name), subtitle: Text('$distance - $rating ★ - $price'), trailing: Icon(active ? Icons.check_circle : Icons.cancel, color: active ? Colors.green : Colors.red)));
  }
}

// 5 - عروض الفنيين
class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('عروض الفنيين - طلب #1258')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          OfferCard(name: 'أحمد محمود', type: 'فني', price: '250 جنيه للصيانة', time: 'وصول 30 دقيقة - ضمان 30 يوم', subPrice: PricingControl.prices['فني']),
          OfferCard(name: 'م. سامي حسن', type: 'مهندس', price: '400 جنيه للصيانة', time: 'وصول 20 دقيقة - ضمان 60 يوم', subPrice: PricingControl.prices['مهندس']),
        ],
      ),
    );
  }
}
class OfferCard extends StatelessWidget {
  final String name, type, price, time; final int? subPrice;
  OfferCard({required this.name, required this.type, required this.price, required this.time, this.subPrice});
  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.only(bottom: 12), child: Padding(padding: EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [CircleAvatar(child: Text(type[0])), SizedBox(width: 10), Text(name, style: TextStyle(fontWeight: FontWeight.bold)), Spacer(), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFFFFC107), borderRadius: BorderRadius.circular(10)), child: Text(price))]), SizedBox(height: 6), Text('$time (اشتراكه $subPrice ج)'), SizedBox(height: 8), SizedBox(width: double.infinity, child: OutlinedButton(onPressed: (){}, child: Text('قبول العرض'))) ])));
  }
}

// 6 - الاشتراك
class SubscriptionScreen extends StatelessWidget {
  final String role;
  SubscriptionScreen({required this.role});
  @override
  Widget build(BuildContext context) {
    int price = role.contains('فني') ? PricingControl.prices['فني']! : role.contains('مهندس') ? PricingControl.prices['مهندس']! : PricingControl.prices['شركة']!;
    return Scaffold(
      appBar: AppBar(title: Text('اشتراك $role')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(Icons.card_membership, size: 80, color: Color(0xFF0A2342)),
            SizedBox(height: 20),
            Text('اشتراك $role', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('ادفع $price جنيه / شهر عشان تظهر للعملاء', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Container(padding: EdgeInsets.all(12), color: Color(0xFFFFF8E1), child: Text('حول فودافون كاش على الرقم اللي هيبعتهولك المالك، وبعدها هيديك كود تفعيل تدخله هنا')),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: 'كود التفعيل من المالك', border: OutlineInputBorder())),
            SizedBox(height: 20),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFC107), padding: EdgeInsets.all(16)), onPressed: (){}, child: Text('تفعيل الحساب', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}

// 7 - لوحة تحكم المالك
class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}
class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('لوحة تحكم المالك - جرجس'), backgroundColor: Color(0xFF0A2342), foregroundColor: Colors.white),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('تعديل أسعار الاشتراكات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...PricingControl.prices.entries.map((e) => Card(child: ListTile(title: Text(e.key), trailing: SizedBox(width: 100, child: TextFormField(initialValue: e.value.toString(), decoration: InputDecoration(labelText: 'جنيه', suffixText: '/شهر'), onChanged: (v) => setState(() => PricingControl.prices[e.key] = int.tryParse(v) ?? e.value)))))).toList(),
          Divider(),
          Text('تعديل سعر كل منطقة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...PricingControl.areaPrices.entries.map((e) => Card(child: ListTile(title: Text(e.key), trailing: SizedBox(width: 100, child: TextFormField(initialValue: e.value.toString(), onChanged: (v) => setState(() => PricingControl.areaPrices[e.key] = int.tryParse(v) ?? e.value)))))).toList(),
          Divider(),
          Text('الفنيين', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SwitchListTile(title: Text('أحمد محمود - فني'), subtitle: Text('100ج - الضبعة'), value: true, onChanged: (v){}),
          SwitchListTile(title: Text('م. سامي حسن - مهندس'), subtitle: Text('250ج - المونوريل'), value: true, onChanged: (v){}),
          SizedBox(height: 20),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A2342), foregroundColor: Colors.white, padding: EdgeInsets.all(16)), onPressed: (){ ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم حفظ الأسعار الجديدة!'))); }, child: Text('حفظ كل التعديلات - هتتطبق فوراً')),
        ],
      ),
    );
  }
}
