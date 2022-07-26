import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/room.dart';
import '../../utils/firestore_refs.dart';

final roomsRepositoryProvider =
    Provider<RoomRepository>((_) => RoomRepository());

class RoomRepository {
  Stream<List<Room>> subscribeRooms() {
    final collectionStream = roomsRef.snapshots();
    return collectionStream.map(
      (qs) => qs.docs.map((qds) => qds.data()).toList(),
    );
  }

  Stream<Room?> subscribeRoom({required String roomId}) {
    final streamDocumentSnapshot = roomRef(roomId: roomId).snapshots();
    return streamDocumentSnapshot.map((ds) => ds.data());
  }
}
