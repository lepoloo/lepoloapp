import "package:flutter/material.dart";

class CategorieElement extends StatelessWidget {
  String name;
  bool isactive;
  CategorieElement(this.name, this.isactive);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 25,
        padding: EdgeInsets.only(
            left: isactive ? 0 : MediaQuery.of(context).size.height / 200,
            right: MediaQuery.of(context).size.height / 200),
        decoration: BoxDecoration(
            color: isactive
                ? Theme.of(context).primaryColorLight
                : Colors.grey[400],
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.height / 50))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isactive
                ? CircleAvatar(
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                  )
                : Center(),
            Text(
              name,
              style: TextStyle(
                  color:
                      isactive ? Theme.of(context).primaryColor : Colors.black,
                  fontWeight: isactive ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        ));
  }
}
