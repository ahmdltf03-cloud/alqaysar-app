import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const AlQaysarApp());
}

class AlQaysarApp extends StatelessWidget {
  const AlQaysarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'القيصر للسفريات والسياحة',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // في حال لم تتوفر الصورة مؤقتاً سيظهر تصميم نصي فاخر، وعند توفرها ستظهر بكامل رونقها
            Image.asset(
              'assets/images/logo.png',
              width: 240,
              height: 240,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Column(
                  children: const [
                    Icon(Icons.flight_takeoff, size: 80, color: Colors.amber),
                    SizedBox(height: 16),
                    Text(
                      'القيصر للسفريات والسياحة',
                      style: TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'وتخليص جميع المعاملات',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mainCategories = [
      {
        'title': 'حجز التذاكر ورحلات العمرة',
        'icon': Icons.flight_takeoff,
        'sub': [
          'رحلات النقل البري الدولي عبر شركات النقل',
          'رحلات النقل البري المحلي بين المحافظات',
          'حجز تذاكر سفر دولي عبر سيارات حديثة',
          'حجز تذاكر الطيران المحلية والدولية',
          'رحلات العمرة وزوار بيت الله الحرام'
        ]
      },
      {
        'title': 'تخليص المعاملات والتأشيرات',
        'icon': Icons.description,
        'sub': [
          'تأشيرات السفر والعمل (الرسوم والإجراءات)',
          'خدمات الإقامات والتجديد',
          'توثيق العقود والشهادات الرسمية',
          'المعاملات المرورية ورخص القيادة'
        ]
      },
      {
        'title': 'خدمات التخليص في الجهات الحكومية',
        'icon': Icons.account_balance,
        'sub': [
          'مكتب العمل والشؤون الاجتماعية',
          'مصلحة الأحوال المدنية والجوازات',
          'الغرفة التجارية والصناعية',
          'مكاتب الضرائب والواجبات',
          'الموانئ والمنافذ الجمركية',
          'مشاوير إنجاز المعاملات الطارئة',
          'تأجير السيارات الفاخرة والباصات'
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القيصر للسفريات والسياحة',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: mainCategories.length,
          itemBuilder: (context, index) {
            final cat = mainCategories[index];
            return Card(
              color: const Color(0xFF1E1E1E),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.amber, width: 0.8),
              ),
              child: ExpansionTile(
                iconColor: Colors.amber,
                collapsedIconColor: Colors.amber,
                leading: Icon(cat['icon'], color: Colors.amber, size: 28),
                title: Text(
                  cat['title'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                children: (cat['sub'] as List<String>).map((subItem) {
                  return ListTile(
                    title: Text(
                      subItem,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    leading: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 12),
                    onTap: () {
                      // تفاعل الخدمة الفرعية
                    },
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
