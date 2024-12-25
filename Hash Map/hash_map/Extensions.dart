
part of 'HashMap.dart';

extension _ListIterations<Key, Value> on List<LinkedList<_Data<Key, Value>>> {

  void iterate(final Function(_Data<Key, Value>) on) {
    for (final LinkedList<_Data<Key, Value>> bucket in this) {
      for (final _Data<Key, Value> data in bucket) {
        on(data);
      }
    }
  }
}