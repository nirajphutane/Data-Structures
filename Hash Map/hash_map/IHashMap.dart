
abstract class IHashMap<Key, Value> {

  int get size;

  void put(final Key key, final Value? value);

  Value? get(final Key key);

  bool remove(final Key key);

  bool containsKey(final Key key);
}