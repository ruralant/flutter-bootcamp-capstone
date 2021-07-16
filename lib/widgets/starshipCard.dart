import 'package:flutter/material.dart';

class StarshipCard extends StatelessWidget {
  final String itemTitle;
  final String itemManufacturer;
  final String itemCrew;
  final String itemPassengers;
  final String itemHyperdriveRating;
  StarshipCard(this.itemTitle, this.itemManufacturer, this.itemCrew,
      this.itemPassengers, this.itemHyperdriveRating);

  @override
  Widget build(BuildContext context) {
    final title = 'Ship Page';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          top: false,
          bottom: false,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 165.0,
                    width: 800.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Ship Model: ' + itemTitle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Manufacturer: ' + itemManufacturer),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Crew: ' + itemCrew),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                'Hyper Drive Version: ' + itemHyperdriveRating),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
