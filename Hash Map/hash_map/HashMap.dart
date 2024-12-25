
import 'IHashMap.dart';
import 'dart:collection';
part 'Extensions.dart';
part 'Data.dart';

class HashMap<Key, Value> implements IHashMap<Key, Value> {

  int _initialCapacity = 16;
  final double loadFactor;
  int _size = 0;
  late List<LinkedList<_Data<Key, Value>>> _buckets;

  HashMap({int? initialCapacity , this.loadFactor = 0.75}) {
    if (initialCapacity != null) {
      _initialCapacity = initialCapacity;
    }
    _buckets = List.generate(_initialCapacity, (index) => LinkedList<_Data<Key, Value>>());
  }

  @override
  int get size => _size;

  @override
  Value? get(Key key) {
    Value? value;
    _bucket(key).iterate(key, (_, final _Data<Key, Value>? data) {
      value = data?.value;
    });
    return value;
  }

  @override
  void put(final Key key, final Value? value) {
    _bucket(key).iterate(key, (final LinkedList<_Data<Key, Value>> bucket, final _Data<Key, Value>? data) {
      if (data != null) {
        data.value = value;
      } else {
        bucket.add(_Data(key, value));
        _size++;
        _reHashing();
      }
    });
  }

  @override
  bool remove(final Key key) {
    bool isRemoved = false;
    _bucket(key).iterateOnNonNull(key, (final LinkedList<_Data<Key, Value>> bucket, _Data<Key, Value> data) {
      data.unlink();
      _size--;
      _reHashing();
      isRemoved = true;
    });
    return isRemoved;
  }

  @override
  bool containsKey(final Key key) {
    _bucket(key).iterate(key, (_, final _Data<Key, Value>? data) {
      if (data != null) {
        return true;
      }
    });
    return false;
  }

  void _reHashing() {
    if (_size/_initialCapacity > loadFactor) {
      _size = 0;
      final List<LinkedList<_Data<Key, Value>>> tmpBuckets = List.from(_buckets);
      _buckets = List.generate(_initialCapacity*=2, (index) => LinkedList<_Data<Key, Value>>());
      tmpBuckets.iterate((final _Data<Key, Value> data){
        put(data.key, data.value);
      });
    }
  }

  LinkedList<_Data<Key, Value>> _bucket(final Key key) => _buckets[_hashCode(key) % _initialCapacity];

  int _hashCode(final Key key) => key.hashCode;
}

extension _LinkedListIterations<Key, Value> on LinkedList<_Data<Key, Value>> {

  void iterateOnNonNull(final Key key, final Function(LinkedList<_Data<Key, Value>> bucket, _Data<Key, Value> data) on) {
    this.iterate(key, (_, final _Data<Key, Value>? data) {
      if (data != null) {
        on(this, data);
      }
    });
  }

  void iterate(final Key key, final Function(LinkedList<_Data<Key, Value>> bucket, _Data<Key, Value>? data) on) {
    _Data<Key, Value>? mData;
    for (final _Data<Key, Value> data in this) {
      if (data.key == key) {
        mData = data;
        break;
      }
    }
    on(this, mData);
  }
}




