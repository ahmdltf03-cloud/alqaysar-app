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
      title: 'القيصر للسفريات والسياحة وتخليص جميع المعاملات',
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

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.amber, width: 2),
                  color: Colors.black54,
                ),
                child: const Icon(
                  Icons.airplanemode_active,
                  size: 70,
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
              const SizedBox(height: 20),
              const Text(
                'مرحباً بكم في عالم السفريات وعالم السياحة وتخليص المعاملات وخدمات الحج والعمرة المتكاملة في القيصر للسفريات والسياحة وتخليص جميع المعاملات وخدمات الحج والعمرة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone, color: Colors.amber, size: 18),
                  const SizedBox(width: 8),
                  const Text('770169070 - 773606048',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text(
                    'دخول إلى التطبيق والخدمات',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  Future<void> _openWhatsApp(String phone) async {
    final uri = Uri.parse("https://wa.me/$phone");
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Text(
                    'خدمات الحج والعمرة والسفريات المتكاملة',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'نحن نلبي كافة احتياجاتكم في السفر، حجز الرحلات البرية والجوية، وتخليص المعاملات الرسمية بكل موثوقية واحترافية.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(color: Colors.white24, height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () => _makePhoneCall('770169070'),
                        icon: const Icon(Icons.phone, color: Colors.amber),
                        label: const Text('770169070',
                            style: TextStyle(color: Colors.white)),
                      ),
                      TextButton.icon(
                        onPressed: () => _makePhoneCall('773606048'),
                        icon: const Icon(Icons.phone, color: Colors.amber),
                        label: const Text('773606048',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'أقسام الخدمات',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                ServiceCard(
                  title: 'النقل البري والرحلات',
                  icon: Icons.directions_bus,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BusBookingScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'حجوزات الطيران',
                  icon: Icons.flight,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlightsScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'تخليص المعاملات',
                  icon: Icons.assignment,
                  onTap: () {
                    _showInfoDialog(context, 'تخليص المعاملات',
                        'نقوم بتخليص كافة المعاملات الرسمية والتأشيرات بدقة وسرعة عالية.');
                  },
                ),
                ServiceCard(
                  title: 'الحج والعمرة',
                  icon: Icons.mosque,
                  onTap: () {
                    _showInfoDialog(context, 'خدمات الحج والعمرة',
                        'برامج متكاملة ومميزة لخدمة ضيوف الرحمن بكل راحة وطمأنينة.');
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _openWhatsApp('967770169070'),
                icon: const Icon(Icons.chat),
                label: const Text('تواصل معنا عبر واتساب',
                    style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: Text(title, style: const TextStyle(color: Colors.amber)),
        content: Text(content, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap})
      : super(key: key);

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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class BusBookingScreen extends StatelessWidget {
  const BusBookingScreen({Key? key}) : super(key: key);

  final List<String> yemeniGovernorates = const [
    'صنعاء',
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
    'بيضاء'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('النقل البري والرحلات',
            style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('المحافظات اليمنية المتاحة للرحلات:',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...yemeniGovernorates.map((city) => Card(
                color: const Color(0xFF1E1E1E),
                child: ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.amber),
                  title: Text(city, style: const TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.white54),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم اختيار الرحلة من/إلى: $city')),
                    );
                  },
                ),
              )),
          const SizedBox(height: 20),
          const Text('مدن المملكة العربية السعودية:',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...saudiCities.map((city) => Card(
                color: const Color(0xFF1E1E1E),
                child: ListTile(
                  leading: const Icon(Icons.location_city, color: Colors.amber),
                  title: Text(city, style: const TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.white54),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم اختيار الوجهة في السعودية: $city')),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({Key? key}) : super(key: key);

  final List<String> yemeniAirports = const [
    'مطار صنعاء الدولي (SAH)',
    'مطار عدن الدولي (ADE)',
    'مطار سيئون الدولي (GXF)',
    'مطار الريان الدولي بالمكلا (RIY)',
    'مطار الغيضة الدولي بالمهرة (AAY)',
    'مطار سقطرى (SCT)',
    'مطار تعز (TAI)',
    'مطار عتق بشبوة (AXK)',
    'مطار بيحان (BHN)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('حجوزات الطيران والمطارات',
            style: TextStyle(color: Colors.amber)),
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('المطارات اليمنية المعتمدة:',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...yemeniAirports.map((airport) => Card(
                color: const Color(0xFF1E1E1E),
                child: ListTile(
                  leading: const Icon(Icons.flight_takeoff, color: Colors.amber),
                  title:
                      Text(airport, style: const TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.white54),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تم اختيار المطار: $airport')),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
