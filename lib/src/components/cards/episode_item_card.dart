import 'package:flutter/material.dart';

class EpisodeItemCard extends StatelessWidget {
  final int id;
  final String name;
  final String air_date;
  final String episode;

  const EpisodeItemCard({
    Key? key,
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    makeListTile(
      final int id,
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
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                            air_date,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Color(
                                0xFFf4ea39,
                              ),
                            ),
                          ),
                          Text(
                            episode,
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
              )
            ]);

    return makeListTile(
      id,
      name,
      air_date,
      episode,
    );
  }
}
