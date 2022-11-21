import 'package:flutter/material.dart';

import '../images/character_image.dart';
import '../text/pattern_text.dart';

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
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CharacterImage(
                          image: image,
                          width: 60.0,
                          height: 60.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PatternText(
                                text: name,
                                fontSize: 20.0,
                                color: const Color(
                                  0xFF02b1c6,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  const PatternText(
                                    text: 'Espécie:',
                                    fontSize: 20.0,
                                    color: Color(
                                      0xFF02b1c6,
                                    ),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: PatternText(
                                      text: species,
                                      fontSize: 18.0,
                                      color: const Color(
                                        0xFFf4ea39,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const PatternText(
                                    text: 'Numero de episódios:',
                                    fontSize: 20.0,
                                    color: Color(
                                      0xFF02b1c6,
                                    ),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: PatternText(
                                      text: '$episodes',
                                      fontSize: 18.0,
                                      color: const Color(
                                        0xFFf4ea39,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
