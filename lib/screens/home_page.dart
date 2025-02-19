import 'package:fitness_app_flutter_ui/models/category_model.dart';
import 'package:fitness_app_flutter_ui/models/diet_model.dart';
import 'package:fitness_app_flutter_ui/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final categories = CategoryModel.getCategories();
  final diets = DietModel.getDiets();
  final popular = PopularDietsModel.getPopularDiets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  ListView _body() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 0.0)
            ]),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Pancake',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/search-line-icon.svg',
                    width: 10,
                    height: 10,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                      'assets/icons/control-panel-icon 2.svg',
                      width: 10,
                      height: 10),
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                filled: true,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                width: double.infinity,
                child: _categories(categories: categories),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Recommandation\nfor Diet',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                _listOfDiet(),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(),
                    child: ListView.separated(
                        itemBuilder: (ctx, index) => Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.07),
                                      blurRadius: 40,
                                      spreadRadius: 0,
                                      offset: Offset(0, 10))
                                ],
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(10),
                                        child: SvgPicture.asset(
                                            popular[index].iconPath)),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          popular[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '${popular[index].level} | ${popular[index].duration} | ${popular[index].calorie}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                        separatorBuilder: (ctx, index) =>
                            SizedBox(height: 13),
                        itemCount: popular.length),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container _listOfDiet() {
    return Container(
                height: 270,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: diets[index].boxColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(diets[index].iconPath,
                                  height: 100, width: 100),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                            child: Text(
                              '${diets[index].name}\n ${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 52, 3, 66),
                                    const Color.fromARGB(255, 88, 7, 102),
                                    const Color.fromARGB(255, 153, 90, 164),
                                  ],
                                )),
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  'View',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (ctx, index) => SizedBox(width: 12),
                  itemCount: diets.length,
                ),
              );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 237, 239),
            borderRadius: BorderRadius.circular(11),
          ),
          child: SvgPicture.asset(
            'assets/icons/line-angle-left-icon.svg',
            width: 12,
            height: 12,
          ),
        ),
      ),
      elevation: 0.0,
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 245, 237, 239),
              borderRadius: BorderRadius.circular(11),
            ),
            child: SvgPicture.asset(
              'assets/icons/ellipsis-h-icon.svg',
              width: 5, // Adjust size as needed
              height: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class _categories extends StatelessWidget {
  const _categories({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (ctx, index) => SizedBox(width: 15),
      itemBuilder: (ctx, index) => Container(
        width: 100,
        decoration: BoxDecoration(
          color: categories[index].boxColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: EdgeInsets.all(6),
              child: SvgPicture.asset(categories[index].iconPath),
            ),
            SizedBox(
              height: 12,
            ),
            Text(categories[index].name)
          ],
        ),
      ),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
