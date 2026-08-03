class Category {
  final String id;
  final String name;
  final bool isIncome;

  Category({
    required this.id,
    required this.name,
    required this.isIncome,
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'isIncome': isIncome,
    };
  }

  factory Category.fromMap(Map<String,dynamic> map){
    return Category(
      id: map['id'], 
      name: map['name'], 
      isIncome: map['isIncome'],
      );
  }
}