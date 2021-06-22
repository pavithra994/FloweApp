class Product {
  // final int ;
  String id, title, description, image, type;
  int likeCount;
  List<Map<String, String>> qna;

  Product(this.id, this.type, this.title, this.description, this.image,
      this.likeCount, this.qna);
}

// List<Product> products = [
//   Product(
//     id: 1,
//     title: "Bacarat Purple Carnation",
//     image: "assets/images/bacarat-purple-carnation.png",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
//   ),
//   Product(
//     id: 2,
//     title: "Daisy",
//     image: "assets/images/daisies.png",
//     description:
//         "Belize Pernis, Daisy is a common European species in the Asteraceae family, often considered an archaeological species of the same name. To distinguish this species from other 'daisies' it may sometimes qualify as a common daisy, grass daisy or English daisy",
//   ),
//   Product(
//     id: 7,
//     title: "Orchid",
//     image: "assets/images/orchid1.png",
//     description:
//         "The flowers of the orchid family are often colorful. Some are even fragrant. Orchids grow naturally in rainforests and can be grown in a variety of climates, both in normal backyards and in special greenhouses. Most orchids grow naturally in tropical countries and in the hot wet forests of Central and South America, Mexico, India, Sri Lanka, Burma, southern China, Thailand, Malaysia, the Philippines, New Guinea and Australia.",
//   ),
//   Product(
//     id: 3,
//     title: "Orchid",
//     image: "assets/images/orchid.png",
//     description:
//         "The flowers of the orchid family are often colorful. Some are even fragrant. Orchids grow naturally in rainforests and can be grown in a variety of climates, both in normal backyards and in special greenhouses. Most orchids grow naturally in tropical countries and in the hot wet forests of Central and South America, Mexico, India, Sri Lanka, Burma, southern China, Thailand, Malaysia, the Philippines, New Guinea and Australia.",
//   ),
//   Product(
//     id: 4,
//     title: "Poppy Plastic Tub Chair",
//     image: "assets/images/rose.png",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
//   ),
//   Product(
//     id: 5,
//     title: "Rose",
//     image: "assets/images/violet-carnation.png",
//     description:
//         "A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. There are over three hundred species and tens of thousands of cultivars. They form a group of plants that can be erect shrubs, climbing, or trailing, with stems that are often armed with sharp prickles. Flowers vary in size and shape and are usually large and showy, in colours ranging from white through yellows and reds. Most species are native to Asia, with smaller numbers native to Europe, North America, and northwestern Africa. Species, cultivars and hybrids are all widely grown for their beauty and often are fragrant. Roses have acquired cultural significance in many societies. Rose plants range in size from compact, miniature roses, to climbers that can reach seven meters in height. Different species hybridize easily, and this has been used in the development of the wide range of garden roses.",
//   ),
//   Product(
//     id: 6,
//     title: "Red Carnation",
//     image: "assets/images/red-carnation.png",
//     description:
//         "Dianthus caryophyllus, commonly known as the carnation or clove pink, is a species of Dianthus. It is probably native to the Mediterranean region but its exact range is unknown due to extensive cultivation for the last 2,000 years.",
//   ),
// ];
