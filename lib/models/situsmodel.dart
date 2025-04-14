class WebsiteModel {
  final String id;
  final String title;
  final String url;
  final String image;
  final String description;
  int visits;

  WebsiteModel({
    required this.id,
    required this.title,
    required this.url,
    required this.image,
    required this.description,
    this.visits = 0,
  });
}

List<WebsiteModel> dummyWebsites = [
  WebsiteModel(
    id: '1',
    title: 'Flutter',
    url: 'https://flutter.dev',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2-TVphB148wg1omRxgqXTMk9lDbLyunCmdw&s',
    description: 'Framework UI open-source dari Google untuk membuat aplikasi lintas platform dengan satu basis kode.',
    visits: 1200,
  ),
  WebsiteModel(
    id: '2',
    title: 'Stack Overflow',
    url: 'https://stackoverflow.com',
    image: 'https://cdn.dribbble.com/userupload/8938128/file/original-9039bac2945a2fa71cb379fd92241fcd.jpg?resize=752x&vertical=center',
    description: 'Komunitas tanya jawab terbesar untuk programmer dari seluruh dunia.',
    visits: 5400,
  ),
  WebsiteModel(
    id: '3',
    title: 'GitHub',
    url: 'https://github.com',
    image: 'https://logos-world.net/wp-content/uploads/2020/11/GitHub-Logo.png',
    description: 'Platform kolaborasi pengembangan perangkat lunak dan kontrol versi berbasis Git.',
    visits: 7600,
  ),
  WebsiteModel(
    id: '4',
    title: 'Wikipedia',
    url: 'https://wikipedia.org',
    image: 'https://assets.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p3/75/2024/11/05/Ilustrasi-logo-Wikipedia-1856331189.jpg',
    description: 'Ensiklopedia daring gratis dengan jutaan artikel dalam berbagai bahasa.',
    visits: 8900,
  ),
  WebsiteModel(
    id: '5',
    title: 'YouTube',
    url: 'https://youtube.com',
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/YouTube_Logo_2017.svg/1200px-YouTube_Logo_2017.svg.png',
    description: 'Platform berbagi video terbesar di dunia.',
    visits: 15000,
  ),
  WebsiteModel(
    id: '6',
    title: 'Kaggle',
    url: 'https://kaggle.com',
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Kaggle_logo.png',
    description: 'Komunitas online bagi ilmuwan data dan pembelajar mesin untuk berbagi, belajar, dan berkompetisi.',
    visits: 2700,
  ),
  WebsiteModel(
    id: '7',
    title: 'Coursera',
    url: 'https://coursera.org',
    image: 'https://www.shutterstock.com/image-vector/gomel-belarus-november-23-2023-600nw-2397966501.jpg',
    description: 'Platform pembelajaran daring yang menawarkan kursus dari universitas dan perusahaan ternama.',
    visits: 4200,
  ),
  WebsiteModel(
    id: '8',
    title: 'Medium',
    url: 'https://medium.com',
    image: 'https://logowik.com/content/uploads/images/medium4864.jpg',
    description: 'Platform untuk menulis dan membaca artikel mendalam dari berbagai topik.',
    visits: 3100,
  ),
  WebsiteModel(
    id: '9',
    title: 'Dev.to',
    url: 'https://dev.to',
    image: 'https://st5.depositphotos.com/71394664/66171/v/450/depositphotos_661710540-stock-illustration-business-creative-business-solutions-icon.jpg',
    description: 'Komunitas developer tempat berbagi dan membaca artikel teknologi serta tutorial.',
    visits: 1900,
  ),
  WebsiteModel(
    id: '10',
    title: 'Hacker News',
    url: 'https://news.ycombinator.com',
    image: 'https://precog.com/wp-content/uploads/2021/05/Hacker-News-logo.webp',
    description: 'Forum berita teknologi dan startup dengan komunitas aktif dari kalangan developer dan pegiat teknologi.',
    visits: 2500,
  ),
];
