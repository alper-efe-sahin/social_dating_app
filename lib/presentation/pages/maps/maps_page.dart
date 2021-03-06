import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:social_dating_app/presentation/pages/maps/constants/texts.dart';
import 'package:social_dating_app/providers/maps/maps_provider.dart';

class MapsPage extends ConsumerWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapsState = ref.watch(mapsStateProvider);
    final usersMarkers = ref.read(mapsStateProvider).markerList;
    final currentUserLocation = mapsState.currentUserLocation;
    final showLoadingIndicatorOrText = mapsState.showLoadingIndicatorOrText;

    return showLoadingIndicatorOrText
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                loadingOrPermission,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
          )
        : GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentUserLocation.latOfCurrentLocation!,
                currentUserLocation.longOfCurrentLocation!,
              ),
              zoom: 14.4746,
            ),
            markers: usersMarkers,
          );
  }
}
