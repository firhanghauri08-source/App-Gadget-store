import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/produk.dart';

class ProdukController {
  List<Produk> semuaProduk = [];
  List<Produk> produkDitampilkan = [];
  bool isLoading = true;
  String? error;

  Future<void> loadData() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/produk.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      
      semuaProduk = jsonData.map((json) => Produk.fromJson(json)).toList();
      produkDitampilkan = semuaProduk; 
      isLoading = false;
    } catch (e) {
      error = 'Gagal memuat data: $e';
      isLoading = false;
    }
  }

  void filterProduk(String kategori) {
    if (kategori == 'Semua') {
      produkDitampilkan = semuaProduk;
    } else {
      produkDitampilkan = semuaProduk.where((p) => p.kategori == kategori).toList();
    }
  }

  String formatHarga(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }
}