import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AlQaysarApp());
}

class AlQaysarApp extends StatelessWidget {
  const AlQaysarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'القيصر للسفريات والسياحة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF121212),
        fontFamily: 'Cairo',
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const WelcomeScreen(),
    );
  }
}

// شاشة الترحيب الفخمة
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String serviceName) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في الاستفسار عن خدمة: $serviceName");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // شعار القيصر (رمز تعبيري فخم يعبر عن الشعار)
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 3),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const Icon(
                  Icons.verified,
                  size: 65,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'القيصر للسفريات والسياحة\nوتخليص جميع المعاملات',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              // النص الترحيبي الرسمي
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: const Text(
                  'مرحباً بكم في عالم السفريات وعالم السياحة وتخليص المعاملات وخدمات الحج والعمرة المتكاملة في القيصر للسفريات والسياحة وتخليص جميع المعاملات وخدمات الحج والعمرة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // العنوان وأرقام التواصل في الواجهة الرئيسية لزيادة الثقة
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.amber, size: 18),
                  SizedBox(width: 5),
                  Text('الجمهورية اليمنية - خدمات متكاملة',
                      style: TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_in_talk, color: Colors.amber, size: 18),
                  SizedBox(width: 5),
                  Text('770169070 - 773606048',
                      style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text(
                    'دخول إلى قائمة الخدمات الرئيسية',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// الشاشة الرئيسية للتطبيق وقائمة الخدمات
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String serviceName) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في حجز أو الاستفسار عن خدمة: $serviceName");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'القيصر للسفريات والسياحة',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم الموافقات الأمنية المميز قبل المربعات الرئيسية
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecurityApprovalsScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2C2200), Color(0xFF1E1E1E)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber, width: 1.5),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.security, color: Colors.amber, size: 35),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'قسم استخراج الموافقات الأمنية',
                            style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'اضغط هنا لمعرفة الدول التي تتطلب موافقات امنية (مثل مصر وغيرها) وطلبها فوراً.',
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'أقسام الخدمات الشاملة',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // الشبكة الرئيسية للأقسام
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
              children: [
                ServiceCard(
                  title: 'النقل البري والسيارات',
                  icon: Icons.directions_bus,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusBookingScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'حجوزات الطيران',
                  icon: Icons.flight,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FlightsScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'الجوازات والبطاقات',
                  icon: Icons.badge,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PassportsScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'أقسام التأشيرات',
                  icon: Icons.description,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VisasMainScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _openWhatsApp('الخدمات العامة والاستفسار الشامل'),
                icon: const Icon(Icons.chat),
                label: const Text('تواصل معنا مباشرة عبر واتساب', style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber.withOpacity(0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.amber),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. شاشة النقل البري والسيارات مع المحافظات اليمنية والخطوط الرئيسية ومدن السعودية والتاريخ
class BusBookingScreen extends StatefulWidget {
  const BusBookingScreen({Key? key}) : super(key: key);

  @override
  State<BusBookingScreen> createState() => _BusBookingScreenState();
}

class _BusBookingScreenState extends State<BusBookingScreen> {
  String? selectedFrom;
  String? selectedTo;
  DateTime selectedDate = DateTime.now();

  final List<String> yemeniLocations = const [
    'صنعاء',
    'معبر',
    'رصابه',
    'رداع',
    'عفار',
    'يريم',
    'عدن',
    'تعز',
    'الحديدة',
    'إب',
    'ذمار',
    'صعدة',
    'عمران',
    'حجة',
    'المحويت',
    'ريمة',
    'الضالع',
    'لحج',
    'أبين',
    'شبوة',
    'حضرموت',
    'المهرة (الغيضة)',
    'سقطرى',
    'مارب',
    'الجوف',
    'البيضاء'
  ];

  final List<String> saudiCities = const [
    'الرياض',
    'جدة',
    'مكة المكرمة',
    'المدينة المنورة',
    'الدمام',
    'الخبر',
    'الطائف',
    'تبوك',
    'أبها',
    'خميس مشيط',
    'بريدة',
    'حائل',
    'نجران',
    'جازان',
    'الجبيل',
    'ينبع',
    'عرعر',
    'سكاكا',
    'الباحة',
    'الخرج'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.amber,
              onPrimary: Colors.black,
              surface: Color(0xFF1E1E1E),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _bookViaWhatsApp() async {
    if (selectedFrom == null || selectedTo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء اختيار نقطة الانطلاق والوجهة المطلوبة')),
      );
      return;
    }
    final String dateStr = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في حجز رحلة برية/سيارات:\n- من: $selectedFrom\n- إلى: $selectedTo\n- تاريخ الرحلة: $dateStr");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final String dateStr = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('النقل البري والسيارات والرحلات', style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('اختر محطة الانطلاق (المحافظات والخطوط الرئيسية):', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              hint: const Text('اختر نقطة الانطلاق', style: TextStyle(color: Colors.white54)),
              value: selectedFrom,
              items: yemeniLocations.map((loc) => DropdownMenuItem(value: loc, child: Text(loc))).toList(),
              onChanged: (val) => setState(() => selectedFrom = val),
            ),
            const SizedBox(height: 20),
            const Text('اختر وجهة الوصول (مدن السعودية وباقي المناطق):', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              hint: const Text('اختر الوجهة المطلوبة', style: TextStyle(color: Colors.white54)),
              value: selectedTo,
              items: [...yemeniLocations, ...saudiCities].map((loc) => DropdownMenuItem(value: loc, child: Text(loc))).toList(),
              onChanged: (val) => setState(() => selectedTo = val),
            ),
            const SizedBox(height: 20),
            const Text('اختر تاريخ الرحلة:', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('تاريخ الرحلة: $dateStr', style: const TextStyle(color: Colors.white, fontSize: 15)),
                    const Icon(Icons.calendar_today, color: Colors.amber),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _bookViaWhatsApp,
                icon: const Icon(Icons.send),
                label: const Text('إرسال طلب الحجز عبر الواتساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. شاشة حجوزات الطيران (المطارات اليمنية + مدن السعودية ومسقط ودبي والدول)
class FlightsScreen extends StatefulWidget {
  const FlightsScreen({Key? key}) : super(key: key);

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  String? selectedAirport;
  String? selectedDestination;

  final List<String> yemeniAirports = const [
    'مطار صنعاء الدولي',
    'مطار عدن الدولي',
    'مطار سيئون الدولي',
    'مطار الريان الدولي بالمكلا',
    'مطار الغيضة الدولي بالمهرة',
    'مطار سقطرى الدولي',
    'مطار تعز',
    'مطار عتق بشبوة',
    'مطار بيحان'
  ];

  final List<String> flightDestinations = const [
    'المملكة العربية السعودية (جميع المدن)',
    'سلطنة عمان (مسقط وباقي المدن)',
    'دبي والإمارات العربية المتحدة',
    'جمهورية مصر العربية (القاهرة)',
    'المملكة الأردنية الهاشمية (عمان)',
    'الهند',
    'دول أخرى متاحة'
  ];

  Future<void> _bookFlightWhatsApp() async {
    if (selectedAirport == null || selectedDestination == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء اختيار مطار المغادرة ووجهة الوصول')),
      );
      return;
    }
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في حجز تذكرة طيران:\n- من مطار: $selectedAirport\n- إلى وجهة: $selectedDestination");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('حجوزات الطيران والمطارات', style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('اختر مطار المغادرة في اليمن:', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              hint: const Text('اختر المطار', style: TextStyle(color: Colors.white54)),
              value: selectedAirport,
              items: yemeniAirports.map((apt) => DropdownMenuItem(value: apt, child: Text(apt))).toList(),
              onChanged: (val) => setState(() => selectedAirport = val),
            ),
            const SizedBox(height: 20),
            const Text('اختر وجهة الوصول المطلوبة:', style: TextStyle(color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              dropdownColor: const Color(0xFF1E1E1E),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              hint: const Text('اختر الوجهة', style: TextStyle(color: Colors.white54)),
              value: selectedDestination,
              items: flightDestinations.map((dest) => DropdownMenuItem(value: dest, child: Text(dest))).toList(),
              onChanged: (val) => setState(() => selectedDestination = val),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _bookFlightWhatsApp,
                icon: const Icon(Icons.send),
                label: const Text('إرسال طلب حجز الطيران للواتساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. شاشة جوازات السفر والبطاقات الإلكترونية
class PassportsScreen extends StatelessWidget {
  const PassportsScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String serviceName) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في طلب خدمة: $serviceName");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('جوازات السفر والبطاقات الإلكترونية', style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            tileColor: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Icons.book, color: Colors.amber),
            title: const Text('استخراج جواز سفر جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('إجراءات سريعة وموثوقة', style: TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
            onTap: () => _openWhatsApp('استخراج جواز سفر جديد'),
          ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Icons.update, color: Colors.amber),
            title: const Text('تجديد جواز السفر', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('تجديد وتمديد الصلاحية', style: TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
            onTap: () => _openWhatsApp('تجديد جواز السفر'),
          ),
          const SizedBox(height: 12),
          ListTile(
            tileColor: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Icons.credit_card, color: Colors.amber),
            title: const Text('البطاقات الشخصية الإلكترونية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: const Text('إصدار وتخليص البطاقات الشخصية', style: TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
            onTap: () => _openWhatsApp('استخراج البطاقة الشخصية الإلكترونية'),
          ),
        ],
      ),
    );
  }
}

// 4. قسم الموافقات الأمنية
class SecurityApprovalsScreen extends StatelessWidget {
  const SecurityApprovalsScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String country) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في الاستفسار أو طلب موافقة أمنية لدخول دولة: $country");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> countries = [
      {'name': 'جمهورية مصر العربية', 'desc': 'استخراج الموافقات الأمنية اللازمة لدخول مصر'},
      {'name': 'دول أخرى تتطلب موافقات', 'desc': 'استفسر عن أي دولة تحتاج ترخيص أمني أو موافقة'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('قسم الموافقات الأمنية', style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'الدول التي تتطلب موافقات أمنية مسبقة للدخول:',
            style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          ...countries.map((c) => Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const Icon(Icons.verified_user, color: Colors.amber),
                  title: Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(c['desc']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  trailing: const Icon(Icons.chat, color: Colors.green),
                  onTap: () => _openWhatsApp(c['name']!),
                ),
              )),
        ],
      ),
    );
  }
}

// 5. أقسام التأشيرات الرئيسية
class VisasMainScreen extends StatelessWidget {
  const VisasMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('أقسام التأشيرات الشاملة', style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          VisaCategoryTile(
            title: 'أولاً: تأشيرات المملكة العربية السعودية',
            icon: Icons.flag,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SaudiVisasScreen()));
            },
          ),
          VisaCategoryTile(
            title: 'ثانياً: تأشيرات سلطنة عمان',
            icon: Icons.landscape,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OmanVisasScreen()));
            },
          ),
          VisaCategoryTile(
            title: 'ثالثاً: تأشيرات سياحية حول العالم',
            icon: Icons.public,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldwideTourismVisasScreen()));
            },
          ),
          VisaCategoryTile(
            title: 'رابعاً: تأشيرات رجال الأعمال',
            icon: Icons.business_center,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BusinessVisasScreen()));
            },
          ),
          VisaCategoryTile(
            title: 'خامساً: التأشيرات العلاجية (الهند، الأردن، مصر وو...)',
            icon: Icons.local_hospital,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicalVisasScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class VisaCategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const VisaCategoryTile({Key? key, required this.title, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.amber),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.amber),
        onTap: onTap,
      ),
    );
  }
}

// تفاصيل تأشيرات السعودية
class SaudiVisasScreen extends StatelessWidget {
  const SaudiVisasScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String visaType) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في طلب تأشيرة سعودية: $visaType");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> visas = [
      'تأشيرات الحج والعمرة',
      'تأشيرات الزيارة العائلية',
      'تأشيرات العمل بأنواعها',
      'تأشيرات السياحة',
      'تأشيرات العلاج'
    ];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('تأشيرات المملكة العربية السعودية', style: TextStyle(color: Colors.amber)), iconTheme: const IconThemeData(color: Colors.amber)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: visas.map((v) => Card(
          color: const Color(0xFF1E1E1E),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(v, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.chat, color: Colors.green),
            onTap: () => _openWhatsApp(v),
          ),
        )).toList(),
      ),
    );
  }
}

// تفاصيل تأشيرات سلطنة عمان
class OmanVisasScreen extends StatelessWidget {
  const OmanVisasScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String visaType) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في طلب تأشيرة سلطنة عمان: $visaType");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> visas = [
      'تأشيرات استثمارية',
      'تأشيرات عبور',
      'تأشيرات سياحة',
      'تأشيرات علاجية',
      'جميع التأشيرات المتوفرة من اليمن إلى عمان'
    ];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('تأشيرات سلطنة عمان', style: TextStyle(color: Colors.amber)), iconTheme: const IconThemeData(color: Colors.amber)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: visas.map((v) => Card(
          color: const Color(0xFF1E1E1E),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            title: Text(v, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.chat, color: Colors.green),
            onTap: () => _openWhatsApp(v),
          ),
        )).toList(),
      ),
    );
  }
}

// تأشيرات سياحية حول العالم
class WorldwideTourismVisasScreen extends StatelessWidget {
  const WorldwideTourismVisasScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String visaType) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في الاستفسار عن: $visaType");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('تأشيرات سياحية حول العالم', style: TextStyle(color: Colors.amber)), iconTheme: const IconThemeData(color: Colors.amber)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('نوفر خدمات التأشيرات السياحية لمختلف دول العالم بكل سهولة. تواصل معنا لتحديد الدولة المطلوبة.', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () => _openWhatsApp('تأشيرات سياحية حول العالم (استفسار عام)'),
              icon: const Icon(Icons.chat),
              label: const Text('تحديد الدولة وطلب التأشيرة عبر الواتساب'),
            )
          ],
        ),
      ),
    );
  }
}

// تأشيرات رجال الأعمال
class BusinessVisasScreen extends StatelessWidget {
  const BusinessVisasScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String visaType) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في طلب تأشيرة رجال الأعمال: $visaType");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('تأشيرات رجال الأعمال', style: TextStyle(color: Colors.amber)), iconTheme: const IconThemeData(color: Colors.amber)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('خدمات خاصة لرجال الأعمال لتخليص وتأمين التأشيرات التجارية والمهنية بسرعة.', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              onPressed: () => _openWhatsApp('تأشيرات رجال الأعمال'),
              icon: const Icon(Icons.chat),
              label: const Text('طلب تأشيرة رجال الأعمال عبر الواتساب'),
            )
          ],
        ),
      ),
    );
  }
}

// التأشيرات العلاجية والدول المتوفرة
class MedicalVisasScreen extends StatelessWidget {
  const MedicalVisasScreen({Key? key}) : super(key: key);

  Future<void> _openWhatsApp(String country) async {
    final String message = Uri.encodeComponent("السلام عليكم، أرغب في طلب تأشيرة وترتيبات علاجية إلى دولة: $country");
    final uri = Uri.parse("https://wa.me/967770169070?text=$message");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> countries = ['الهند', 'المملكة الأردنية الهاشمية', 'جمهورية مصر العربية', 'دول علاجية أخرى'];
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('التأشيرات العلاجية والدول المتوفرة', style: TextStyle(color: Colors.amber)), iconTheme: const IconThemeData(color: Colors.amber)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('اختر دولة العلاج المطلوبة:', style: TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...countries.map((c) => Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: const Icon(Icons.local_hospital, color: Colors.amber),
              title: Text(c, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.chat, color: Colors.green),
              onTap: () => _openWhatsApp(c),
            ),
          )),
        ],
      ),
    );
  }
}
