import 'package:NowNews/models/CategoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  /* Technology */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/267394/pexels-photo-267394.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.add(categoryModel);

  /* Business */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/2182969/pexels-photo-2182969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.add(categoryModel);

  /* Entertainment */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/1782146/pexels-photo-1782146.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.add(categoryModel);

  /* General */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/260907/pexels-photo-260907.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  category.add(categoryModel);

  /* Health */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/40751/running-runner-long-distance-fitness-40751.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.add(categoryModel);

  /* Science */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/256262/pexels-photo-256262.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.add(categoryModel);

  /* Sports */
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgUrl =
      "https://images.pexels.com/photos/1374370/pexels-photo-1374370.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  category.add(categoryModel);

  return category;
}
