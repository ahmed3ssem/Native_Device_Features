import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async{
    final locatData = await Location().getLocation();
    print(locatData.longitude);
    print(locatData.latitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          child: _previewImageUrl == null ? Text("No Choosen",textAlign: TextAlign.center,) : Image.network(_previewImageUrl,width: double.infinity,fit: BoxFit.cover,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(onPressed: _getCurrentUserLocation, icon: Icon(Icons.location_on),label: Text('Current Location'),textColor: Theme.of(context).primaryColor,),
            FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map),label: Text('Select On Map'),textColor: Theme.of(context).primaryColor,),

          ],
        )
      ],
    );
  }
}
