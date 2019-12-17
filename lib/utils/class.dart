class Nutrients {
  String name;
  String weight;
  double percent;
  Nutrients({this.name, this.weight, this.percent});
}

class Recipe{
  String id,imageUrl,title;
  List<String> ingredients;
  List<Nutrients> nutrients;
  Recipe({this.id,this.title,this.imageUrl,this.ingredients,this.nutrients});
}
