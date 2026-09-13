import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const AlQaysarApp());
}

class AlQaysarApp extends StatelessWidget {
  const AlQaysarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'القيصر للسفريات والسياحة',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String phone1 = "+967770169070";
  final String phone2 = "+967773606048";

  void _openWhatsApp(String phone, String message) async {
    final Uri url = Uri.parse("https://wa.me/${phone.replaceAll('+', '')}?text=${Uri.encodeComponent(message)}");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'القيصر للسفريات والسياحة',
          style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'أهلاً بك في القيصر',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37)),
            ),
            const SizedBox(height: 8),
            const Text(
              'خدمات السفريات، السياحة، وتخليص كافة المعاملات',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            _buildServiceCard(
              title: 'حجز التذاكر ورحلات العمرة',
              icon: Icons.flight_takeoff,
              onTap: () => _openWhatsApp(phone1, 'السلام عليكم، أرغب في الاستفسار عن حجز التذاكر ورحلات العمرة.'),
            ),
            const SizedBox(height: 15),
            _buildServiceCard(
              title: 'تخليص المعاملات والتأشيرات',
              icon: Icons.assignment,
              onTap: () => _openWhatsApp(phone2, 'السلام عليكم، أرغب في الاستفسار عن خدمة تخليص المعاملات والتأشيرات.'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFD4AF37), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD4AF37), size: 30),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFD4AF37), size: 18),
        onTap: onTap,
      ),
    );
  }
}
