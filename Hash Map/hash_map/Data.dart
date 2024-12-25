
part of 'HashMap.dart';

final class _Data<Key, Value> extends LinkedListEntry<_Data<Key, Value>> {
  final Key key;
  Value? value;
  _Data(this.key, this.value);

  @override
  String toString() => '$key: $value';
}