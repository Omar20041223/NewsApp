import 'package:flutter/material.dart';
import 'package:news/models/atriclesModel.dart';

class NewsCard extends StatelessWidget {
  final ArticelModel articelModel;
  const NewsCard({Key? key, required this.articelModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: articelModel.image != null
                ? Image.network(
                    articelModel.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "images/null.jpg",
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )),
        SizedBox(
          height: 15,
        ),
        Text(
          articelModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        articelModel.description != null
            ? Text(
                articelModel.description!,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              )
            : Text("")
      ],
    );
  }
}
