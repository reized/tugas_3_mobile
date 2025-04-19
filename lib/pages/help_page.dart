import 'package:flutter/material.dart';
import 'package:tugas_3_mobile/pages/login_page.dart';
import 'package:tugas_3_mobile/utils/session_manager.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // tutup dialog
                // lanjutkan logout
                await SessionManager.clearSession();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Bantuan & Panduan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '1. Login:\nMasukkan email dan password yang sudah terdaftar. Setelah berhasil login, Anda akan diarahkan ke halaman dashboard.\n\n'
            '2. Halaman Utama:\nPada halaman utama aplikasi terdapat beberapa fitur seperti stopwatch, konversi bilangan, konversi waktu, layanan lbs (Location-Based Service), dan daftar situs.\n\n'
            '3. Menu Anggota (Member):\nMenu ini menampilkan daftar anggota beserta informasi seperti nama dan NIM. Anda dapat melihat profil setiap anggota pada halaman ini.\n\n'
            '4. Menu Bantuan (Help):\nMenu ini memberikan panduan penggunaan aplikasi serta informasi kontak jika mengalami kendala. Anda juga dapat logout dari aplikasi melalui tombol logout yang tersedia di halaman ini.\n\n'
            '5. Logout:\nUntuk keluar dari aplikasi, pilih tombol "Logout" di halaman Bantuan & Panduan. Setelah itu, Anda akan diarahkan kembali ke halaman login.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => confirmLogout(context),
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
