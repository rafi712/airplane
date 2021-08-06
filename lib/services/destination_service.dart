import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:airplane/models/destination_model.dart';

class DestinationService {
  final _destinationsRef = FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestinations() async {
    try {
      QuerySnapshot result = await _destinationsRef.get();
      
      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromMap(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
