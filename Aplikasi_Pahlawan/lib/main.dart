import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// CLASS VIEW
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(
        AssetImage("assets/images/pahlawan-app/bg_menu_v1.png"), context);
    return ChangeNotifierProvider(
      create: (context) => Pahlawans(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pahlawan-app/bg_indo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Align(
            alignment: Alignment(0.0, 0.5),
            child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        }),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ImageProvider bg_menu =
      AssetImage("assets/images/pahlawan-app/bg_menu_v1.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: bg_menu,
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PahlawanScreen()),
                        );
                      },
                      child: MenuButton(constraints, 'MULAI'),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PanduanScreen()),
                        );
                      },
                      child: MenuButton(constraints, 'PANDUAN'),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TentangScreen()),
                        );
                      },
                      child: MenuButton(constraints, 'TENTANG'),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.04,
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: MenuButton(constraints, 'KELUAR'),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Container MenuButton(BoxConstraints constraints, String text) {
    return Container(
      padding: EdgeInsets.all(13),
      color: Colors.redAccent,
      width: constraints.maxWidth * 0.4,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PahlawanScreen extends StatelessWidget {
  const PahlawanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider bg_menu =
        AssetImage("assets/images/pahlawan-app/bg_menu_v1.png");
    final pahlawanData = Provider.of<Pahlawans>(context);
    final allPahlawan = pahlawanData._allPahlawan;
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: bg_menu,
                fit: BoxFit.cover,
              ),
            ),
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(10, 60, 10, 10),
              itemCount: allPahlawan.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PahlawanDetailScreen(
                          pahlawanId: allPahlawan[i].id,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FittedBox(
                      child: Image.asset(
                        allPahlawan[i].imageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PahlawanDetailScreen extends StatelessWidget {
  final String pahlawanId;
  const PahlawanDetailScreen({Key? key, required this.pahlawanId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pahlawan = Provider.of<Pahlawans>(context).findById(pahlawanId);

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                FittedBox(
                  child: Image.asset(
                    pahlawan.imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                Text(
                  pahlawan.deskripsi,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class PanduanScreen extends StatelessWidget {
  const PanduanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider bg_menu =
        AssetImage("assets/images/pahlawan-app/bg_menu_v1.png");

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bg_menu,
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.15,
                ),
                Text(
                  'PANDUAN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Aplikasi ini dibuat untuk mengenalkan pahlawan kepada para pengguna, sehingga jiwa dengan aplikasi ini bisa memotivasi kita menjadi lebih nasionalis dalam berbagai hal dan membuat kita giat untuk meneruskan perjuangan para pahlawan. \n\nAplikasi ini terdiri dari 4 menu: \n- Menu Pahlawan Berisi Informasi Pahlawan\n- Menu Panduan Berisi Informasi Singkat Penggunaan Aplikasi Ini\n- Menu Tentang Berisi Informasi Tentang Aplikasi Ini Serta Pembuatnya\n- Menu Exit Digunakan Untuk Keluar Dari Aplikasi Ini',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class TentangScreen extends StatelessWidget {
  const TentangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider bg_menu =
        AssetImage("assets/images/pahlawan-app/bg_menu_v1.png");

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: bg_menu,
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.15,
                  ),
                  Text(
                    'TENTANG',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Aplikasi ini dibuat untuk mengenalkan pahlawan kepada para pengguna, sehingga jiwa dengan aplikasi ini bisa memotivasi kita menjadi lebih nasionalis dalam berbagai hal dan membuat kita giat untuk meneruskan perjuangan para pahlawan. \n\nAplikasi ini dibuat oleh zepi darmawan tambunan yang sekarang sedang menjalankan pendidikan sarjana dibidang komputer/teknik informatika.\n\nPembuat berharap dengan adanya aplikasi ini dapat menambah semangat nasionalisme dan menumbuhkan pergerakan yang lebih dari sebelumnya untuk memperjuangkan republik indonesia tercinta ini.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// CLASS DATA
class Pahlawan {
  final String id;
  final String nama;
  final String deskripsi;
  final String imageURL;

  Pahlawan({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.imageURL,
  });
}

class Pahlawans with ChangeNotifier {
  List<Pahlawan> _allPahlawan = [
    Pahlawan(
      id: '1',
      nama: 'Abdul Muis',
      deskripsi:
          "Seorang sastrawan, politikus, dan wartawan Indonesia. Dia merupakan pengurus besar Sarekat Islam dan pernah menjadi anggota Volksraad mewakili organisasi tersebut. Ia membantu harian De Express untuk menulis karangan yang menangkis penghinaan terhadap bangsanya Tahun 1916 ia bersama Agus Salim memimpin majalah 'Neraca', dan juga menjadi Pemimpin Redaksi Harian Kaoem Moeda. Abdul Muis juga terkenal pula pandai berdebat dan berpidato. Tahun 1913, ia kemudian masuk menjadi anggota Serekat Islam (SI), menjadi ketua SI cabang Bandung, dan menjadi anggota pimpinan sentral kommite pengurus pusat SI. Abdul Muis juga merupakan anggota Volksrad. Karya-karya Abdul Muis diantaranya adalah “Salah Asuhan” (1928), “Surapati” (1950), “Robert anak Surapati” (1953), “Pertemuan Jodoh”, “Daman Brandal”, “Sabai nan Alui” (Cerita Rakyat Minangkabau), dan contah Surat Menyurat. Abdul Muis merupakan Sastrawan, Politisi, Wartawan Indonesia. Pendorong berdirinya Technische Hooge School (ITB, Institut Teknologi Bandung) Ketua Pengurus Besar Perkumpulan Buruh Pegadaian. Pendiri Persatuan Perjuang.",
      imageURL: 'assets/images/pahlawan-app/1.jpg',
    ),
    Pahlawan(
      id: '2',
      nama: 'Ki Hajar Dewantara',
      deskripsi:
          "Bapak Pendidikan Nasional Indonesia . Menteri Pendidikan Nasional Pertama. Pendiri Taman Siswa, Aktivis Pergerakan Kemerdekaan RI. Tanggal kelahirannya diperingati sebagai Hari Pendidikan Nasional Pada tahun 1913 ia  menulis brosur “Als ik een Nederlander was” (Andai kata saya seorang Belanda) isinya kecaman terhadap maksud pemerintah Belanda mengadakan perayaan serratus tahun bebasnya negeri Belanda dari penjajahan Perancis. Karena penentangannya kepada pemerintahan Hindia Belanda, ia diasingkan oleh ke negeri Belanda. Pada tanggal 3 Juli 1922 ia mendirikan perguruan Taman Siswa, melalui perguruan ini ia berusaha menanamkan rasa kebangsaan di hati anak didik. Ia yakin bahwa antara pendidikan dan Gerakan politik terdapat hubungan yang erat.",
      imageURL: 'assets/images/pahlawan-app/2.jpg',
    ),
    Pahlawan(
      id: '3',
      nama: 'R.M. Surjopranoto',
      deskripsi:
          "Sosok  pejuang yang berani membela rakyat pribumi  dalam melawan penjajah dalam menuntut haknya. Sosok pejuang yang dikenal dengan sebutan de stakingskoning  (raja mogok),  pemimpin pemogokan buruh menentang kebijakan pemerintah kolonial. Sosok pejuang yang rela berhenti dari pegawai negeri, demi memperjuangakan hak rakyat.Sosok pejuang yang  mencurahkan  seluruh waktu dan  perhatiannya untuk membela rakyat kecil yang tertindas akibat penjajahan. Raden Mas Surjopranoto Surjopranoto pada 1915, membentuk organiasasi buruh  Adhi Dharma. Pada  1918, membentuk gerakan Prawiro Padjojo ing Joedo  atau Arbeidsleger  (tentara buruh),   Selain itu Radem Mas Surjopanoto juga mendirikan Personeel Fabriek Bond (PFB) yang beranggotakan kalangan buruh, kumpulan petani dan koperasi. Pada kongres SI 1919 di Surabaya,  Ia berpandangan, bahwa perjuangan buruh tidak selalu harus dengan senjata, namun  dapat pula dijalankan dengan paksaan secara moral, melalui protes-protes, perundingan di muka umum dan jika perlu dengan pemogokan. Raden Mas Surjopranoto   mengusulkannya  pembentukan “Persatuan Perhimpunan Kaum Buruh” (PPKB) yang beranggotakan perkumpulan-perkumpulan  buruh  yang  ada di bawah naungan SI.",
      imageURL: 'assets/images/pahlawan-app/3.jpg',
    ),
    Pahlawan(
      id: '4',
      nama: 'Mohammad Hoesni Thamrin',
      deskripsi:
          "Politikus dan Aktifis Kemerdekaan. Tokoh Betawi yang pertama kali menjadi anggota Volksraad (“Dewan Rakyat”) di Hindia Belanda, mewakili kelompok Inlanders (“pribumi”). Thamrin merupakan anggota Dewan Kota yang sering menyaksikan keadaan rakyat dan membuatnya berpidato agar pemerintah segera berupaya untuk memperbiki kampung-kampung di Jakarta. Thamrin kemudian menjadi ketua Kaum Betawi. Kemudian pada tahun 1927, Thamrin alias Mat Seni dilantik menjadi anggota Volksraad. Pada 27 Januari 1930 dibentuk “Fraksi Nasional” dalam Volksraad yang diketuain oleh Thamrin, dan kemudian Thamrin membentuk “Fonds Nasional”. Thamrin juga menjadi ketua Pemufakatan Perhimpunan-perhimpunan Politik Kebangsaan Indonesia (PPPKI) .Thamrin juga menjadi anggota Vereniging van Indonesia Akademici (VLA) dan menjadi anggota Partai Indonesia Raya (Parindra). Pada 1939 Parindra yang diwakili oleh Thamrin bergabung dalam Gabungan Politik Indonesia (GAPI) dengan tujuan “Indonesia Berpalemen”, Masyarakat Jakarta menngenang jasa-jasa M.H. Thamrin sepanjgan masa dan telah memberikannya nama sebagai Abang Betawi atau Abang Jakarta. Cita-citanya untuk kepentinngan rakyat diteruskan dalam “Proyek M.H. Thamrin”.",
      imageURL: 'assets/images/pahlawan-app/4.jpg',
    ),
    Pahlawan(
      id: '5',
      nama: 'KH. Samanhudi',
      deskripsi:
          "Pejuang   Kemerdekaan   Indonesia.    Pendiri dan Ketua Sarekat Dagang Islam (SDI). K.H. Samanhudi Bersama R.M. Umar Said Cokroaminoto mengusulkan agar keanggotaan SDI tidak terbatas pada kaum dagang saja. Maka perkataan dagang dalam nama perkumpulan SDI sehingga menjadi Sarekat Islam disingkat SI Ketua Kehormatan SI (Sarekat Islam). Pendiri Barisan Pemberontak Indonesia Cabang Solo dan Gerakan Persatuan Pancasila untuk melawan Belanda, serta membentuk laskar Gerakan Kesatuan Alap- alap.",
      imageURL: 'assets/images/pahlawan-app/5.jpg',
    ),
    Pahlawan(
      id: '6',
      nama: 'H.O.S. Cokroaminoto',
      deskripsi:
          "Guru para pemimpin-pemimpin besar di Indonesia. Seorang pengacara pembela anggota SI yang dituduh. Pelopor pergerakan di Indonesia. Sosok pemikir dan pemimpin organisasi SI (Sarekat Islam). Tjokroaminoto dapat menghimpun dan memberikan pengaruh bagi rakyat seantero Jawa dan luar Jawa yang membuat Pemerintah Kolonial Hindia Belanda khawatir karena pengaruhnya begitu besar dalam masyarakat. Selain sibuk memimpin SI, Cokroaminoto juga aktif menulis di berbagai majalah dan surat kabar. Demi kepentingan SI, ia mendirikan N.V. Setia yang menerbitkan harian Utusan Hindia yang langsung dipimpinnya sendiri. Tulisan-tulisannya dalam harian itu sangat tajam dalam mengecam pemerintah kolonial. Tjokroaminoto memperjuangkan terbentuknya Dewan Perwakilan Rakyat yang sebenarnya, dengan anggota-anggotanya terdiri dari orang- orang yang dipilih oleh rakyat. Konsep pemikiran “Sosialisme dan Islam” Tjokroaminoto memang menjadi daya tarik tersendiri untuk dipelajari, bahkan hingga kini pemikiran dan sumbangsihnya tak lekang oleh zaman.",
      imageURL: 'assets/images/pahlawan-app/6.jpg',
    ),
    Pahlawan(
      id: '7',
      nama: 'Danudirja Setiabudi',
      deskripsi:
          "Pejuang Pergerakan Kemerdekaan Indonesia, Politikus, Wartawan,  Aktivis, Penulis. Salah satu dari “Tiga Serangkai”. Penggagas nama “Nusantara”. Peletak dasar nasionalisme Indonesia di awal abad ke-20 Pendiri Indische Partij pada 1912. Indiesche Partij mempropangandakan cita-cita kemerdekaan sehingga memiliki banyak anggota sampai sekitar 7.500 orang dari 30 cabang. Douwes Dekker dibuang ke Belanda karena menentang perayaan 100 tahun Belanda merdeka dari Prancis di Hindia Belanda. Di Belanda, ia belajar ilmu ekonomi sambil bergambung dengan Indiesche Vereeniging (Perhimpunan Indonesia). Kemudian ia mendirikan National Indische Partij pada 1919. Mendirikan sekolah Ksatrian Institut, sebuah sekolah yang menitik beratkan pada pengajaran yang membentuk jiwa nasionalis. Menjadi guru besar pada Akademi Ilmu Politik dan anggota Dewan Pertimbangan Agung. Dalam Kabinet Syahrir III, ia diangkat menjadi Menteri Negara dan juga sebagai penasehat delegasi RI dalam perundingan-perundingan dengan Belanda",
      imageURL: 'assets/images/pahlawan-app/7.jpg',
    ),
    Pahlawan(
      id: '8',
      nama: 'Si Singamangaradja XII',
      deskripsi:
          "Raja Sisingamangaraja XII berjuang menentang kekuasaan Belanda di Tapanuli, Sumatera Utara. Dengan dukungan rakyatnya, tahun 1877 ia menyatakan perang kepada Belanda. Perang panjang pun berlangsung bermula di Bahal Batu, Humbang dan berikutnya meluas di selutuh Tanah Batak bahkan Belanda mengerahkan pasukannya dari Singkil Aceh. Pada tahun 1877 para misionaris di Silindung dan Bahal Batu meminta bantuan kepada pemerintah kolonial Belanda dari ancaman diusir oleh Singamangaraja XII. Kemudian pemerintah Belanda dan para penginjil sepakat untuk tidak hanya menyerang markas Si Singamangaraja XII di Bakara tetapi sekaligus menaklukkan seluruh Toba. Sebelum Sisingamangaraja XII gugur, ia sempat ditawari untuk diangkat sebagai Sultan atas Tanah Batak oleh Gubernur Belanda Van Daalen. Bahkan Sang Gubernur sendiri berjanji akan menyambut kehadirannya dengan seremonial tembakan meriam 21 kali. Akan tetapi, Sisingamangaraja XII menolaknya bahkan semakin gencar melakukan perlawanan.",
      imageURL: 'assets/images/pahlawan-app/8.jpg',
    ),
  ];

  List<Pahlawan> get allPahlawan {
    return [..._allPahlawan];
  }

  Pahlawan findById(pahlawanId) {
    return _allPahlawan.firstWhere((e) => e.id == pahlawanId);
  }
}
