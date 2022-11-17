import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String species;
  final int episodes;
  final bool isFavorited;
  final Function() onTapFunction;

  const ItemCard({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.species,
    required this.episodes,
    required this.isFavorited,
    required this.onTapFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    makeListTile(
      final int id,
      final String image,
      final String name,
      final String species,
      final int episodes,
      final bool isFavorited,
      Function() onTapFunction,
    ) =>
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: onTapFunction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: Image.network(image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Color(
                                  0xFF02b1c6,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              species,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Color(
                                  0xFFf4ea39,
                                ),
                              ),
                            ),
                            Text(
                              ' $episodes',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Color(
                                  0xFFf4ea39,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]);

    return makeListTile(
      id,
      image,
      name,
      species,
      episodes,
      isFavorited,
      onTapFunction,
    );
  }
}
