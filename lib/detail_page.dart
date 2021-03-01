import 'package:dicoding_flutter_1/model/tourism_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final TourismPlace place;

  DetailPage({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Image.asset(place.imageAsset, height: 400,fit: BoxFit.fill),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context)
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20.0, top: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(place.name, style: TextStyle(fontSize: 25),),
                                    Text(place.location, style: TextStyle(fontSize: 25),),
                                  ],
                                ),
                                Text(place.ticketPrice, style: TextStyle(fontSize:25, color: Colors.red),),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(icon: Icon(Icons.star, color: Colors.orangeAccent,), onPressed: () {  },),
                                  Text('4.9 (2.7k)')
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text('*Estimated cost'),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Overview', style: TextStyle(color: Colors.red),),
                                Text('Details'),
                                Text('Reviews'),
                                Text('Costs'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(place.description),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.query_builder_rounded, color: Colors.blueAccent),),
                                    Text(place.openDays, style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.timelapse, color: Colors.redAccent),),
                                    Text(place.openTime, style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(icon: Icon(Icons.wb_sunny, color: Colors.orangeAccent),),
                                    Text('21 C', style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0, bottom:20.0, right: 40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Open Day'),
                                Text('Open Time'),
                                Text('Sunny'),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
          ),
        ),
        bottomNavigationBar:
          Container(
          width: double.infinity,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            color: Colors.redAccent,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            onPressed: () {},
            child: Text(
              'Book Now',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
    );
  }
}

class FavoriteButton extends StatefulWidget {

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red,
        ),
        onPressed: (){
          setState(() {
            isFavorite = !isFavorite;
          });
        });
  }
}