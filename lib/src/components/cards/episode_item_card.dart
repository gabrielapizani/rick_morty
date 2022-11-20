import 'package:flutter/material.dart';

import '../text/pattern_text.dart';

class EpisodeItemCard extends StatelessWidget {
  final String name;
  final String air_date;
  final String episode;

  const EpisodeItemCard({
    Key? key,
    required this.name,
    required this.air_date,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    makeListTile(
      final String name,
      final String air_date,
      final String episode,
    ) =>
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const PatternText(
                              text: 'Name: ',
                              fontSize: 20.0,
                              color: Color(
                                0xFF02b1c6,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 300,
                                child: PatternText(
                                  text: name,
                                  fontSize: 20.0,
                                  color: const Color(
                                    0xFFf4ea39,
                                  ),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const PatternText(
                              text: 'Exibition: ',
                              fontSize: 20.0,
                              color: Color(
                                0xFF02b1c6,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: PatternText(
                                text: air_date,
                                fontSize: 20.0,
                                color: const Color(
                                  0xFFf4ea39,
                                ),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const PatternText(
                              text: 'Episode: ',
                              fontSize: 20.0,
                              color: Color(
                                0xFF02b1c6,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                            PatternText(
                              text: episode,
                              fontSize: 18.0,
                              color: const Color(
                                0xFFf4ea39,
                              ),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]);

    return makeListTile(
      name,
      air_date,
      episode,
    );
  }
}
