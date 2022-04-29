class Receipe {
  String judul;
  String waktu;
  String rating;
  String deskripsi;
  String bahan;
  String langkah;
  String imageAsset;

  Receipe({
    required this.judul,
    required this.waktu,
    required this.rating,
    required this.deskripsi,
    required this.bahan,
    required this.langkah,
    required this.imageAsset,
  });
}

var receipeList = [
  Receipe(
    judul: "Es Kopi Vanila",
    waktu: "10 menit",
    rating: "4",
    deskripsi: "Minum yg segar dan buat mata melek yaitu kopi...",
    bahan: "1 sdt kopi instan atau tanpa ampas (me : indocafe original)\n" +
        "30 ml air panas\n" +
        "20 ml sirup vanila (me : 30 ml krn kopinya trll pahit)\n" +
        "150 ml susu UHT plain\n" +
        "6 bh atau lebih batu es",
    langkah: "Siapkan bahan2\n" +
        "Seduh kopi dg air panas, dinginkan sebentar sampai uap panasnya hilang.\n" +
        "Masukkan kopi ke dalam gelas, tambahkan sirup dan batu es.\n" +
        "Terakhir masukkan susu. Sebelum diminum sebaiknya diaduk terlebih dahulu.",
    imageAsset: "assets/images/ice_cap.jpg",
  ),
  Receipe(
    judul: "Mango Sago - Mangga Sagu Mutiara",
    waktu: "30 menit",
    rating: "3",
    deskripsi:
        "Kali ini kami akan memberikan resep Mango Sago yang manis legit cocok banget buat dessert, camilan dirumah, takjil atau bahkan dijadiin usaha jualan buat nambah receh 😉 Kali ini kami menggunakan whipping cream cair agar lebih creamy. Bisa juga diganti susu cair ya, soal harga gak jauh beda kok atau bisa disesuaikan budget. Berikut resepnya",
    bahan: "1500 ml air\n" +
        "100 gr sago mutiara\n" +
        "1 sachet nutrigel mangga\n" +
        "700 ml air\n" +
        "5 sdm gula\n" +
        "300 ml susu cair\n" +
        "3 sdm gula\n" +
        "5 sdm susu bubuk\n" +
        "100 ml whipping cream\n" +
        "2 sachet kental manis\n" +
        "Buah mangga, sesuai selera",
    langkah: "Rebus 1500 ml air hingga mendidih, kemudian masukkan sago mutiara dan didihkan selama kurang lebih 15 menit. Setelah 15 menit matikan api dan tutup panci kurang lebih 20 menit. Jika masih ada yang belum matang masak kembali selama 10 menit lagi. Matikan api dan diamkan hingga matang.\n" +
        "Angkat dan saring mutiara, masukkan ke dalam air agar tidak menempel. Angkat dan sisihkan\n" +
        "Didihkan 700 ml air masukkan nutrigel mangga, aduk rata. Angkat kemudian tuang kedalam cetakan dan dinginkan. Potong kotak kecil dan masukkan sago mutiara tadi\n" +
        "Hangatkan susu cair kemudian masukkan gula, susu bubuk. aduk rata masukkan ke dalam wadah sago mutiara dan potongan nutrigel tadi.\n" +
        "Agar lebih creamy bisa ditambahkan whipping cream (optional). Masukkan susu kental manis aduk rata.\n" +
        "Cara penyajiannya: Siapkan wadah masukkan hasil blender buah mangga baru kemudian adonan sago mutiara. Masukkan dalam lemari es agar rasa lebih menyegarkan.",
    imageAsset: "assets/images/sm.jpg",
  ),
];
