import 'package:flutter/material.dart';
import 'const.dart';
import 'singer_data.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Home Page",
            style: kWhiteTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(kHorizontalMargin),
            // ListView adalah kelas yang berguna untuk membuat tampilan list pada flutter
            // ListView.builder berguna untuk data yang banyak >10
            child: ListView.builder(
              itemCount: singerData.length,
              itemBuilder: (context, index) {
                // Kita akan membuat variabel sebelum dimasukan ke SingerCard.
                final name = singerData[index].name;
                final desc = singerData[index].desc;
                final photo = singerData[index].photo;
                // GestureDetector adalah widget yang berguna sebagai trigger ketika widget ditekan
                // Kelebihan GestureDetector adalah tidak merubah bentuk dari child widgetnya.
                return GestureDetector(
                  child: SingerCard(
                    name: name,
                    desc: desc,
                    photo: photo,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          name: name,
                          desc: desc,
                          photo: photo,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Ini adalah kelas baru untuk membuat custom widget
class SingerCard extends StatelessWidget {
  final String name;
  final String desc;
  final String photo;

  SingerCard({@required this.name, @required this.photo, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: Colors.white),
      // Row berguna untuk membuat layout secara horizontal
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(photo),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kBlackTextStyle.copyWith(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desc,
                  style: kBlackTextStyle.copyWith(
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
