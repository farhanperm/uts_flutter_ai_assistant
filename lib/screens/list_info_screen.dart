import 'package:flutter/material.dart';

class ListInfoScreen extends StatelessWidget {
  const ListInfoScreen({super.key});

  final List<Map<String, String>> items = const [
    {
      "title": "Berita Teknologi Terbaru",
      "desc":
          "Ikuti update perkembangan teknologi terbaru mulai dari AI, smartphone, hardware, dan inovasi digital.",
      "image": "assets/images/info1.jpg"
    },
    {
      "title": "Tren Dunia",
      "desc":
          "Informasi mengenai peristiwa global, tren sosial media, hingga perubahan ekonomi dunia.",
      "image": "assets/images/info2.jpg"
    },
    {
      "title": "Tips Kesehatan",
      "desc":
          "Dapatkan tips kesehatan harian, pola hidup sehat, hingga saran aktivitas yang baik untuk tubuh.",
      "image": "assets/images/info3.jpg"
    },
    {
      "title": "Fakta Menarik",
      "desc":
          "Kumpulan fakta menarik dari berbagai bidang seperti sains, sejarah, dan fenomena alam.",
      "image": "assets/images/info4.jpg"
    },
    {
      "title": "Edukasi",
      "desc":
          "Konten edukatif yang bermanfaat mulai dari pengetahuan umum, motivasi belajar, hingga tips produktivitas.",
      "image": "assets/images/info5.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E1E2C), Color(0xFF2D2D44)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  "Information Hub 📰",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Temukan berbagai informasi dan wawasan baru.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    final item = items[i];
                    return _buildInfoCard(context, item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: const Color(0xFF1E1E2C),
              title: Text(item["title"]!, style: const TextStyle(color: Colors.white)),
              content: Text(item["desc"]!, style: const TextStyle(color: Colors.white70)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Tutup", style: TextStyle(color: Colors.blueAccent)),
                )
              ],
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                item["image"]!,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item["desc"]!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blueAccent,
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text(
                        "Baca Selengkapnya",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: const Color(0xFF1E1E2C),
                          title: Text(item["title"]!, style: const TextStyle(color: Colors.white)),
                          content: Text(item["desc"]!, style: const TextStyle(color: Colors.white70)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Tutup", style: TextStyle(color: Colors.blueAccent)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}