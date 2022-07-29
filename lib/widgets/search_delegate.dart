import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate<String> {
  Future<List> future;
  ProductSearch({Key? key, required this.future});
  final cities = ["Berlin", "Paris", "Munich", "Hamburg", "London"];
  final recentCities = ["Samsung", "Nokia"];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, "");
            } else {
              query = "";
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, ""), icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_city,
            size: 120,
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            query,
            style: const TextStyle(
                color: Colors.black, fontSize: 64, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var matchedQuery = [];
            for (var product in snapshot.data) {
              if (product["title"]
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
                matchedQuery.add(product);
              }
            }

            if (query.isEmpty) {
              return const Center(
                child: Text("Please enter something"),
              );
            } else {
              return ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: matchedQuery.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          print(matchedQuery[index]);
                        },
                        splashFactory: InkRipple.splashFactory,
                        child: ListTile(
                          leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://source.unsplash.com/random")),
                          title: Text(matchedQuery[index]["title"]),
                          subtitle: Text(matchedQuery[index]["subtitle"]),
                          isThreeLine: true,
                          dense: true,
                        ));
                  });
            }
          } else {
            return Container(
              child: Text("No data to show"),
            );
          }
        });
  }
}
