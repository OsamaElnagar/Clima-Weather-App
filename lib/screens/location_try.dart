// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
//
// class GetLocation extends StatefulWidget {
//   const GetLocation({Key? key}) : super(key: key);
//
//   @override
//   State<GetLocation> createState() => _GetLocationState();
// }
//
// class _GetLocationState extends State<GetLocation> {
//   Location location = Location();
//   late bool _serviceEnabled;
//   late PermissionStatus _permissionGranted;
//   late LocationData _locationData;
//   bool _isListenLocation = false, _isGetLocation = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 _serviceEnabled = await location.serviceEnabled();
//                 if (!_serviceEnabled) {
//                   _serviceEnabled = await location.requestService();
//                   if (_serviceEnabled) {}
//                 }
//
//                 _permissionGranted = await location.hasPermission();
//                 if (_permissionGranted == PermissionStatus.denied) {
//                   _permissionGranted = await location.requestPermission();
//                   if (_permissionGranted != PermissionStatus.granted) {}
//                 }
//
//                 _locationData = await location.getLocation();
//                 setState(() {
//                   _isGetLocation = true;
//                 });
//               },
//               child: const Text('Get location'),
//             ),
//             _isGetLocation
//                 ? Text(
//                     'location: ${_locationData.altitude}  /  ${_locationData.longitude}')
//                 : Container(),
//             ElevatedButton(
//               onPressed: () async {
//                 _serviceEnabled = await location.serviceEnabled();
//                 if (!_serviceEnabled) {
//                   _serviceEnabled = await location.requestService();
//                   if (_serviceEnabled) {}
//                 }
//
//                 _permissionGranted = await location.hasPermission();
//                 if (_permissionGranted == PermissionStatus.denied) {
//                   _permissionGranted = await location.requestPermission();
//                   if (_permissionGranted != PermissionStatus.granted) {}
//                 }
//
//                 setState(() {
//                   _isListenLocation = true;
//                 });
//               },
//               child: const Text('Listen location'),
//             ),
//             StreamBuilder(
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState != ConnectionState.waiting) {
//                   var data = snapshot.data as LocationData;
//                   return Text(
//                       'Location Changed \n${data.altitude}  / ${data.longitude}');
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//               stream: location.onLocationChanged,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
