import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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
            const Icon(Icons.flight_takeoff, size: 80, color: Colors.amber),
            const SizedBox(height: 16),
            const Text(
              'القيصر للسفريات والسياحة',
              style: TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'وتخليص جميع المعاملات',
              style: TextStyle(color: Colors.white70, fontSize: 16),
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

  void _showContactOptions(BuildContext context, String serviceName) {
    final String mainPhoneNumber = '967770169070';
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                serviceName,
                style: const TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                      final msg = Uri.encodeComponent('السلام عليكم، أرغب بالاستفسار/الحجز عن: "$serviceName". (قادم من تطبيق القيصر)');
                      final url = Uri.parse('https://wa.me/$mainPhoneNumber?text=$msg');
                      if (await canLaunchUrl(url)) await launchUrl(url, mode: LaunchMode.externalApplication);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    icon: const Icon(Icons.chat),
                    label: const Text('عبر واتساب'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                      final url = Uri(scheme: 'tel', path: '770169070');
                      if (await canLaunchUrl(url)) await launchUrl(url);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
                    icon: const Icon(Icons.phone),
                    label: const Text('اتصال مباشر'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القيصر للسفريات والسياحة - الإدارة العامة',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          _buildCategoryCard(
            context,
            'رحلات النقل البري الدولي والمحلي',
            Icons.directions_bus,
            [
              'رحلات الخطوط الرئيسية (معبر، رصابه، رداع، عفار، يريم وكافة المحافظات)',
              'حجز سيارات حديثة وباصات للسعودية وعمان',
              'جدولة مواعيد الرحلات اليومية وتاريخ السفر'
            ],
            const TransportSearchScreen(),
          ),
          _buildCategoryCard(
            context,
            'حجز تذاكر الطيران المحلية والدولية',
            Icons.flight,
            [
              'مطارات اليمن (مطار عدن، مطار الريان، مطار سيئون، مطار صنعاء)',
              'مطار مسقط، مطار دبي، ومطارات العالم المتاحة',
              'بحث حسب التاريخ واختيار وجهات السفر'
            ],
            const FlightSearchScreen(),
          ),
          _buildCategoryCard(
            context,
            'استخراج جوازات السفر والبطائق الإلكترونية',
            Icons.badge,
            [
              'إصدار وتجديد جوازات السفر الرسمية',
              'استخراج البطائق الشخصية الإلكترونية',
              'المتابعة الفورية للمعاملات الرسمية'
            ],
            null,
            isDirectService: true,
            serviceTitle: 'خدمة جوازات السفر والبطائق الإلكترونية'
          ),
          _buildCategoryCard(
            context,
            'قسم استخراج الموافقات الأمنية',
            Icons.security,
            [
              'الدول التي تتطلب موافقات أمنية (مثل: مصر وغيرها)',
              'تخليص وتوثيق الموافقات والأوراق اللازمة'
            ],
            const SecurityApprovalsScreen(),
          ),
          _buildCategoryCard(
            context,
            'أقسام التأشيرات الشاملة',
            Icons.book_online,
            [
              'أولاً: تأشيرات المملكة العربية السعودية (حج وعمرة، زيارة عائلية، عمل، سياحية، علاجية)',
              'ثانياً: تأشيرات سلطنة عمان (استثمارية، عبور، سياحة، علاجية)',
              'ثالثاً: تأشيرات سياحية حول العالم ورجال الأعمال',
              'رابعاً: التأشيرات العلاجية (الهند، الأردن، مصر وغيرها)'
            ],
            const VisasScreen(),
          ),
          _buildCategoryCard(
            context,
            'خدمات التخليص في الجهات الحكومية',
            Icons.account_balance,
            [
              'مكتب العمل، الأحوال المدنية والجوازات',
              'الغرفة التجارية، الضرائب، والمنافذ الجمركية',
              'تأجير السيارات الفاخرة والباصات'
            ],
            null,
            isDirectService: true,
            serviceTitle: 'خدمات التخليص الحكومي والسيارات'
          ),
          _buildCategoryCard(
            context,
            'استفسار عن خدماتنا الأخرى والتواصل المباشر مع الإدارة العامة',
            Icons.support_agent,
            [
              'التواصل المباشر مع الإدارة العامة على مدار الساعة',
              'الاستعلام عن أي رحلة أو خدمة إضافية'
            ],
            null,
            isDirectService: true,
            serviceTitle: 'استفسار عام والتواصل مع الإدارة العامة'
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, List<String> details, Widget? targetScreen, {bool isDirectService = false, String? serviceTitle}) {
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
        leading: Icon(icon, color: Colors.amber, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        children: [
          ...details.map((detail) => ListTile(
            title: Text(detail, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            leading: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 10),
          )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 40),
              ),
              onPressed: () {
                if (isDirectService) {
                  _showContactOptions(context, serviceTitle ?? title);
                } else if (targetScreen != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
                }
              },
              icon: const Icon(Icons.touch_app),
              label: Text(isDirectService ? 'حجز وتواصل مباشر مع الإدارة' : 'دخول إلى قسم البحث والرحلات'),
            ),
          )
        ],
      ),
    );
  }
}

// شاشة بحث النقل البري
class TransportSearchScreen extends StatefulWidget {
  const TransportSearchScreen({Key? key}) : super(key: key);

  @override
  State<TransportSearchScreen> createState() => _TransportSearchScreenState();
}

class _TransportSearchScreenState extends State<TransportSearchScreen> {
  String selectedFrom = 'صنعاء';
  String selectedTo = 'الرياض (السعودية)';
  DateTime selectedDate = DateTime.now();

  final List<String> yemeniRegions = [
    'صنعاء', 'تعز', 'عدن', 'إب', 'الحديدة', 'معبر', 'رصابه', 'رداع', 'عفار', 'يريم', 'المكلا', 'سيئون', 'حضرموت'
  ];

  final List<String> saudiDestinations = [
    'الرياض (السعودية)', 'جدة (السعودية)', 'مكة المكرمة (السعودية)', 'الدمام (السعودية)', 
    'خميس مشيط (السعودية)', 'نجران (السعودية)', 'جيزان (السعودية)', 'أبها (السعودية)', 'الطائف (السعودية)'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بحث الرحلات البرية والسيارات'), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('من (المحافظة / الخط الرئيسي):', style: TextStyle(color: Colors.amber)),
            DropdownButton<String>(
              value: selectedFrom,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E1E1E),
              items: yemeniRegions.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (val) => setState(() => selectedFrom = val!),
            ),
            const SizedBox(height: 20),
            const Text('إلى (مدن المملكة العربية السعودية):', style: TextStyle(color: Colors.amber)),
            DropdownButton<String>(
              value: selectedTo,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E1E1E),
              items: saudiDestinations.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (val) => setState(() => selectedTo = val!),
            ),
            const SizedBox(height: 20),
            Text('تاريخ الرحلة: ${selectedDate.toLocal().toString().split(' ')[0]}', style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
              child: const Text('اختر تاريخ الرحلة'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                HomeScreen()._showContactOptions(context, 'حجز بري من $selectedFrom إلى $selectedTo بتاريخ ${selectedDate.toLocal().toString().split(' ')[0]}');
              },
              child: const Text('بحث وتأكيد الحجز للإدارة العامة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة بحث الطيران
class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String selectedAirport = 'مطار عدن الدولي';
  String selectedDest = 'الرياض (السعودية)';
  DateTime selectedDate = DateTime.now();

  final List<String> yemeniAirports = ['مطار عدن الدولي', 'مطار الريان (المكلا)', 'مطار سيئون الدولي', 'مطار صنعاء الدولي'];
  final List<String> globalDestinations = ['الرياض (السعودية)', 'جدة (السعودية)', 'مسقط (عمان)', 'دبي (الإمارات)', 'القاهرة (مصر)', 'عمّان (الأردن)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بحث تذاكر الطيران'), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('مغادرة من (مطار):', style: TextStyle(color: Colors.amber)),
            DropdownButton<String>(
              value: selectedAirport,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E1E1E),
              items: yemeniAirports.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (val) => setState(() => selectedAirport = val!),
            ),
            const SizedBox(height: 20),
            const Text('الوصول إلى (الوجهة / الدولة):', style: TextStyle(color: Colors.amber)),
            DropdownButton<String>(
              value: selectedDest,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E1E1E),
              items: globalDestinations.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (val) => setState(() => selectedDest = val!),
            ),
            const SizedBox(height: 20),
            Text('تاريخ السفر: ${selectedDate.toLocal().toString().split(' ')[0]}', style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
              child: const Text('تغيير تاريخ السفر'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                HomeScreen()._showContactOptions(context, 'حجز طيران من $selectedAirport إلى $selectedDest بتاريخ ${selectedDate.toLocal().toString().split(' ')[0]}');
              },
              child: const Text('حجز تذكرة طيران عبر الإدارة العامة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة الموافقات الأمنية
class SecurityApprovalsScreen extends StatelessWidget {
  const SecurityApprovalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> countries = ['جمهورية مصر العربية', 'دول أخرى تتطلب موافقات أمنية مسبقة'];
    return Scaffold(
      appBar: AppBar(title: const Text('قسم الموافقات الأمنية'), backgroundColor: Colors.black),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.security, color: Colors.amber),
              title: Text(countries[index], style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 14),
              onTap: () {
                HomeScreen()._showContactOptions(context, 'استخراج موافقة أمنية لدخول: ${countries[index]}');
              },
            ),
          );
        },
      ),
    );
  }
}

// شاشة التأشيرات
class VisasScreen extends StatelessWidget {
  const VisasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> visas = {
      'أولاً: تأشيرات المملكة العربية السعودية': [
        'تأشيرات الحج والعمرة',
        'تأشيرات الزيارة العائلية',
        'تأشيرات العمل بأنواعها',
        'تأشيرات السياحة',
        'تأشيرات العلاجية'
      ],
      'ثانياً: تأشيرات سلطنة عمان': [
        'تأشيرات استثمارية',
        'تأشيرات عبور (ترانزيت)',
        'تأشيرات سياحة',
        'تأشيرات علاجية'
      ],
      'ثالثاً: تأشيرات سياحية حول العالم': [
        'تأشيرات سياحية لمختلف دول العالم',
        'تأشيرات رجال الأعمال والمهام الرسمية'
      ],
      'رابعاً: التأشيرات العلاجية (الدول المتاحة)': [
        'العلاج في الهند',
        'العلاج في الأردن',
        'العلاج في مصر',
        'وجهات علاجية أخرى'
      ]
    };

    return Scaffold(
      appBar: AppBar(title: const Text('قسم التأشيرات الشاملة'), backgroundColor: Colors.black),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: visas.entries.map((entry) {
          return ExpansionTile(
            iconColor: Colors.amber,
            collapsedIconColor: Colors.amber,
            title: Text(entry.key, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
            children: entry.value.map((sub) => ListTile(
              title: Text(sub, style: const TextStyle(color: Colors.white70)),
              trailing: const Icon(Icons.chat, color: Colors.green, size: 18),
              onTap: () {
                HomeScreen()._showContactOptions(context, 'طلب تأشيرة: $sub');
              },
            )).toList(),
          );
        }).toList(),
      ),
    );
  }
}
