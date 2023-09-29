class Category {
  final int id;
  final String title;
  final String image;

  const Category({required this.id, required this.title, required this.image});
}

const List<Category> categories = <Category>[
  Category(id: 1, title: 'Design', image: 'design'),
  Category(id: 2, title: 'Programmer', image: 'programmer'),
  Category(id: 3, title: 'Finance', image: 'finance'),
  Category(id: 4, title: 'Soft skill', image: 'soft_skill'),
  Category(id: 5, title: 'Accountancy', image: 'accountancy'),
  Category(id: 6, title: 'Data science', image: 'data_science'),
  Category(id: 7, title: 'Language', image: 'language'),
  Category(id: 8, title: 'Marketing', image: 'marketing'),
];
