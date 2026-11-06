import 'package:flutter/material.dart';
import '../controllers/produk_controller.dart';
import '../widgets/produk_card.dart';
import 'detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProdukController controller = ProdukController();
  String kategoriDipilih = 'Semua';
  final List<String> daftarKategori = ['Semua', 'HP', 'Laptop', 'Aksesoris'];

  @override
  void initState() {
    super.initState();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Gadget Kak Fandi'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                const Icon(Icons.filter_list, color: Colors.blue),
                const SizedBox(width: 8),
                const Text('Filter:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<String>(
                    value: kategoriDipilih,
                    isExpanded: true,
                    items: daftarKategori.map((String kategori) {
                      return DropdownMenuItem<String>(value: kategori, child: Text(kategori));
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          kategoriDipilih = newValue;
                          controller.filterProduk(kategoriDipilih);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (controller.error != null) {
      return Center(child: Text(controller.error!, style: const TextStyle(color: Colors.red)));
    }
    if (controller.produkDitampilkan.isEmpty) {
      return const Center(child: Text('Tidak ada produk dalam kategori ini'));
    }

    return ListView.builder(
      itemCount: controller.produkDitampilkan.length,
      itemBuilder: (context, index) {
        final produk = controller.produkDitampilkan[index];
        return ProdukCard(
          produk: produk,
          onTap: () {
            // INI ADALAH NAVIGASI KE HALAMAN 2 (DetailView)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailView(produk: produk)),
            );
          },
        );
      },
    );
  }
}