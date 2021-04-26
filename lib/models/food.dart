class FoodItem {
  final String name ;
  final String desc ;
  final bool is_fav ;   // it's in favorite
  final String img_name ;
  final bool assess1 ;
  final bool assess2 ;
  final bool assess3 ;
  final bool assess4 ;
  final bool assess5 ;
  final double time ;
  final String ingredients ;

  FoodItem(this.name,
      this.desc,
      this.is_fav,
      this.img_name,
      this.assess1,
      this.assess2,
      this.assess3,
      this.assess4,
      this.assess5,
      this.time,
      this.ingredients);
}