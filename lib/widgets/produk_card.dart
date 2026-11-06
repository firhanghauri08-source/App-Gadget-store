import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../controllers/produk_controller.dart';

class ProdukCard extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTap;

  const ProdukCard({super.key, required this.produk, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final controller = ProdukController();
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(
                  color: _getColor(produk.kategori),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(_getIcon(produk.kategori), color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(produk.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(produk.kategori, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(controller.formatHarga(produk.harga), 
                         style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              _buildBadge(produk),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(Produk produk) {
    if (produk.isHabis) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.red)),
        child: const Text('Habis', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)));
    }
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.green)),
        child: Text('Stok: ${produk.stok}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)));
  }

  Color _getColor(String kategori) {
    if (kategori == 'HP') return Colors.purple;
    if (kategori == 'Laptop') return Colors.blue;
    return Colors.orange;
  }

  IconData _getIcon(String kategori) {
    if (kategori == 'HP') return Icons.smartphone;
    if (kategori == 'Laptop') return Icons.laptop_mac;
    return Icons.headphones;
  }
}