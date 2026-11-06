class Produk {
  final int id;
  final String nama;
  final String kategori;
  final int harga;
  final int stok;

  Produk({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.stok,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'] as int,
      nama: json['nama'] as String,
      kategori: json['kategori'] as String,
      harga: json['harga'] as int,
      stok: json['stok'] as int,
    );
  }

  bool get isHabis => stok == 0;
}