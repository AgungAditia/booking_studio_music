class Studio {
  String image;
  String name;
  String address;

  Studio({
    required this.image,
    required this.name,
    required this.address,
  });

  static final List<Studio> studios = [
    Studio(
      image: 'assets/images/studio1.png',
      name: 'Starling Music Studio',
      address:
          'Komplek Kimia Farma 2, Jalan Pradibu No 13 Blok a/g 7, Duren Sawit Jakarta Timur',
    ),
    Studio(
      image: 'assets/images/studio2.png',
      name: 'Backbeat Studio',
      address: 'Jalan Cipete Raya No. 76 Jakarta Selatan',
    ),
    Studio(
      image: 'assets/images/studio3.png',
      name: 'dB Music Studio',
      address: 'Jalan Kebagusan Raya Pasar Minggu, Jakarta Selatan',
    ),
    Studio(
      image: 'assets/images/studio4.png',
      name: 'Lingkar Delapan Production',
      address: 'Jalan Guntur Nomor 18, Setiabudi Jakarta Selatan',
    ),
    Studio(
      image: 'assets/images/studio5.png',
      name: 'Aspa Studio',
      address: 'Jalan RC Veteran Nomor 5A, Bintaro, Jakarta Selatan',
    ),
    Studio(
      image: 'assets/images/studio6.png',
      name: 'Flame Music Studio',
      address: 'Jalan Majapahit Nomor 34/2 Petojo Selatan, Gambir',
    ),
  ];
}
