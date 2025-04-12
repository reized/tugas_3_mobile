import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KonversiPage extends StatefulWidget {
  const KonversiPage({Key? key}) : super(key: key);

  @override
  State<KonversiPage> createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  final TextEditingController _yearController = TextEditingController();
  String _result = "";

  void _convertToMinutes() {
    final input = _yearController.text.trim();
    if (input.isEmpty) {
      setState(() {
        _result = "Masukkan tahun terlebih dahulu.";
      });
      return;
    }

    final year = double.tryParse(input);
    if (year == null) {
      setState(() {
        _result = "Format tidak valid.";
      });
      return;
    }

    // 1 tahun = 365.25 hari * 24 jam * 60 menit
    final minutes = year * 365.25 * 24 * 60;
    final formattedMinutes = NumberFormat("#,###.##").format(minutes);

    setState(() {
      _result = "$year tahun = $formattedMinutes menit";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 4,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Konversi Tahun Ke Menit",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _yearController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Masukkan jumlah tahun',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertToMinutes,
              child: const Text('Konversi'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
