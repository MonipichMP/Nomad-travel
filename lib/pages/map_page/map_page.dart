import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nomad_travel/common_widgets/circle_image.dart';
import 'package:nomad_travel/constants/colors.dart';
import 'package:nomad_travel/constants/style.dart';
import 'package:nomad_travel/pages/map_page/map_card_detail.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Position _position;
  Set<Marker> markers = Set();

  List bottomCards = [
    {"image": "assets/images/bali.jpg", "name": "Places"},
    {"image": "assets/images/bangkok.jpg", "name": "Foods"},
    {"image": "assets/images/berlin.jpg", "name": "Habits"},
    {"image": "assets/images/bali.jpg", "name": "Places"},
    {"image": "assets/images/bangkok.jpg", "name": "Foods"},
    {"image": "assets/images/berlin.jpg", "name": "Habits"},
  ];

  Marker realTeethClinic = Marker(
    markerId: MarkerId("1"),
    infoWindow: InfoWindow(
      title: "Real Teeth Clinic",
      snippet: "I don\'t know",
    ),
    position: LatLng(11.587371, 104.905670),
    icon: BitmapDescriptor.fromAsset("assets/images/destination_map_marker.png"),
  );

  Marker myCustom2 = Marker(
    markerId: MarkerId("2"),
    infoWindow: InfoWindow(
      title: "my custom 2",
      snippet: "I don\'t know",
    ),
    position: LatLng(11.587210, 104.907337),
    icon: BitmapDescriptor.fromAsset("assets/images/destination_map_marker.png"),
  );

  Marker myCustom3 = Marker(
    markerId: MarkerId("3"),
    infoWindow: InfoWindow(
      title: "My custom 3",
      snippet: "I don\'t know",
    ),
    position: LatLng(11.585802, 104.907272),
    icon: BitmapDescriptor.fromAsset("assets/images/destination_map_marker.png"),
  );

  @override
  void initState() {
    super.initState();
    /// add custom markers
    markers.add(realTeethClinic);
    markers.add(myCustom2);
    markers.add(myCustom3);
    /// load current pos
    onCurrentLocation().then((value) {
      setState(() {
        _position = value;
      });
    });
  }

  Future<Position> onCurrentLocation() async {
    var pos;
    try {
      pos = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      pos = null;
    }
    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return _position == null
        ? Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_position.latitude, _position.longitude),
                        zoom: 18,
                      ),
                      myLocationEnabled: true,
                      compassEnabled: true,
                      markers: markers,
                      mapType: MapType.terrain,
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),

                    /// search widget
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 6,
                        color: Colors.transparent,
                        child: TextField(
                          style: TextStyle(color: AppColor.black),
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20,
                              color: AppColor.grey,
                            ),
                            contentPadding: EdgeInsets.all(16),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  CircleImage(
                                    height: 30,
                                    width: 30,
                                    image: NetworkImage(
                                        "https://i.pinimg.com/564x/f4/1f/e3/f41fe384dd173f91201f622e11be8a31.jpg"),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 6,
                          color: Colors.transparent,
                          shadowColor: Colors.black54,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("${markers.length} places near you", style: captionStyle.copyWith(color: AppColor.orange),),
                          ),
                        ),
                      ],
                    ),

                    /// bottom
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Material(
                        elevation: 6,
                        color: Colors.transparent,
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  width: 30,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                SizedBox(height: 20),

                                ///list card as row
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(
                                      bottomCards.length,
                                      (index) => InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MapCardDetail(),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  bottomCards[index]['image'],
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                  bottomCards[index]['name']),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
