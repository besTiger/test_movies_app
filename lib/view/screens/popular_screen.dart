import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/movie_model.dart';
import '../../view_model/movies_view_model.dart';

class PopularScreen extends GetWidget<MoviesViewModel> {
  @override
  final controller = Get.put(MoviesViewModel());

  PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getPopular(),
      builder: (context, AsyncSnapshot snapshot) {
        Movies? data = snapshot.data;
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1.5 / 2,
                crossAxisSpacing: 2.5,
                mainAxisSpacing: 2.5,
              ),
              itemCount: data!.results!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details',
                        arguments: MoviesResults(
                          title: data.results![index].title,
                          overview: data.results![index].overview,
                          posterPath: data.results![index].posterPath,
                        ));
                  },
                  child: Card(
                    elevation: 20,
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      child: (data.results![index].posterPath == null)
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : Image.network(
                              'https://image.tmdb.org/t/p/w500${data.results![index].posterPath.toString()}',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
