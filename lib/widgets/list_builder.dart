import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListBuilder extends StatefulWidget {
  final Future<List> datalist;
  const ListBuilder({Key? key, required this.datalist}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilder();
}

class _ListBuilder extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.datalist,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length > 0
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                          groupTag: "1",
                          key: const ValueKey(0),
                          endActionPane: const ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                // An action can be bigger than the others.
                                onPressed: doNothing,
                                backgroundColor: Color(0xFF7BC043),
                                foregroundColor: Colors.white,
                                icon: Icons.archive,
                                label: 'Archive',
                              ),
                              SlidableAction(
                                onPressed: doNothing,
                                backgroundColor: Color(0xFF0392CF),
                                foregroundColor: Colors.white,
                                icon: Icons.save,
                                label: 'Save',
                              ),
                            ],
                          ),
                          child: InkWell(
                              onTap: () {},
                              splashFactory: InkRipple.splashFactory,
                              child: ListTile(
                                leading: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://source.unsplash.com/random")),
                                title: Text(snapshot.data[index]["title"]),
                                subtitle:
                                    Text(snapshot.data[index]["subtitle"]),
                                isThreeLine: true,
                                dense: true,
                              )));
                    })
                : const Center(
                    child: Text("No items available"),
                  );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong..."),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

void doNothing(BuildContext context) {}
