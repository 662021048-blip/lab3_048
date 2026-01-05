import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF), // สีฟ้าอ่อนเหมือนท้องฟ้า
      appBar: AppBar(
        title: const Text(
          "สถานที่ท่องเที่ยวในฝัน",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4A90E2), // สีฟ้าสดใส
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ===== ส่วนรูปภาพ (ใช้ NetworkImage เพื่อดึงรูปจากลิงก์) =====
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: Image.network(
                    // ลิงก์ตรงของรูปภาพที่คุณเลือก 
                    'https://cdn.pixabay.com/photo/2017/09/23/14/19/mt-fuji-2779020_1280.jpg',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue.shade200,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Icon(Icons.broken_image,
                              size: 50, color: Colors.grey));
                    },
                  ),
                ),
                // ตกแต่งเงาด้านล่างรูปเพื่อให้กลืนกับเนื้อหา
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          const Color(0xFFF0F8FF).withOpacity(0.8),
                          const Color(0xFFF0F8FF),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// ===== กล่องบรรยาย =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.redAccent, size: 28),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ภูเขาไฟฟูจิ (Mount Fuji)',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'ทะเลสาบโชจิโกะ, ญี่ปุ่น',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 30, thickness: 1),
                    const Text(
                      'คำบรรยายภาพ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'ภาพทิวทัศน์อันงดงามของ "ภูเขาไฟฟูจิ" ที่ตั้งตระหง่านตัดกับท้องฟ้าสีครามสดใส เบื้องล่างคือผืนน้ำอันเงียบสงบของทะเลสาบที่สะท้อนเงาของภูเขาอย่างชัดเจน\n\n'
                      'สิ่งที่โดดเด่นในภาพนี้คือบรรยากาศของ "ฤดูใบไม้ร่วง" โดยจะเห็นพรรณไม้ริมฝั่งซ้ายมือที่กำลังเปลี่ยนสีเป็นส้มและแดง ตัดกับสีฟ้าของน้ำและฟ้า และสีขาวของหิมะบนยอดเขา '
                      'สร้างความรู้สึกสงบ ผ่อนคลาย และแสดงถึงความสมดุลของธรรมชาติได้อย่างลงตัว',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.8, // เพิ่มระยะห่างบรรทัดให้อ่านง่าย
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}