import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../controllers/produk_controller.dart';

class DetailView extends StatelessWidget {
  final Produk produk;

  const DetailView({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    final controller = ProdukController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100, height: 100,
                decoration: BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
                child: Icon(Icons.shopping_bag, size: 50, color: Colors.blue.shade700),
              ),
            ),
            const SizedBox(height: 24),
            Text(produk.nama, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(produk.kategori, style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            const Divider(height: 32),
            Text('Harga: ${controller.formatHarga(produk.harga)}', 
                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 16),
            Text('Stok Tersedia: ${produk.stok} unit', style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: produk.isHabis 
                    ? null 
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${produk.nama} berhasil ditambahkan ke keranjang!')),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: produk.isHabis ? Colors.grey : Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(produk.isHabis ? 'Stok Habis' : 'Tambah ke Keranjang', 
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}