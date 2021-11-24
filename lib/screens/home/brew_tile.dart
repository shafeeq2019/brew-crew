import 'package:flutter/material.dart';
import 'package:brew_crew/models/brew.dart';

//Rule: Flutter Widget Class ? then use Statless or Statful
class BrewTile extends StatelessWidget {
  Brew brew;
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.brown[brew.strength ?? 100],
        ),
        title: Text('${brew.name}'),
        subtitle: Text('Takes ${brew.sugars}  sugar(s)'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print(this.brew.sugars);
        },
      ),
    );
  }
}
