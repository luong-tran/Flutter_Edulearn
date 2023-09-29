class Class {
  final int id;
  final String title;
  final String image;

  const Class({required this.id, required this.title, required this.image});
}

const List<Class> catClass = <Class>[
  Class(id: 1, title: 'Mastering UI/UX Design', image: 'uiux'),
  Class(id: 2, title: 'Mastering HTML', image: 'html'),
  Class(id: 3, title: 'Illustration for beginner', image: 'ai'),
  Class(id: 4, title: 'Figma Introduction', image: 'uiux'),
];

class SubClass {
  final int id;
  final String title;
  final String image;

  const SubClass({required this.id, required this.title, required this.image});
}

const List<SubClass> catSubClass = <SubClass>[
  SubClass(id: 1, title: 'Digital Marketing for beginners', image: 'learn'),
  SubClass(
      id: 2,
      title: 'English for Freelancer: Interview & work pr...',
      image: 'sub_1'),
  SubClass(id: 3, title: 'Become a Copywriter', image: 'sub_2'),
  SubClass(
      id: 4, title: 'Interaction Design With InVision Studio', image: 'sub_5'),
  SubClass(id: 5, title: 'Learn Figma For Beginner', image: 'sub_4'),
  SubClass(
      id: 6, title: '3D Blender: Introduction & Essentials', image: 'sub_3'),
  SubClass(id: 7, title: 'UI Dashboard Design', image: 'sub_7'),
  SubClass(id: 8, title: 'Build a 3D Icon for UI Design', image: 'sub_6'),
];
