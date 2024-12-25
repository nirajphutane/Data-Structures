
import 'hash_map/HashMap.dart';

void main() {
  final HashMap hashMap = HashMap();

  for (int i = 1; i <= 50; i++) {
    hashMap.put('Key-$i', 'Value-$i');
    print('Length: ${hashMap.size}');
  }

  for (int i = 1; i <= 10; i++) {
    print('Removed: ${'Key-${i * 5}'}: ${hashMap.remove('Key-${i * 5}')}, Length: ${hashMap.size}');
  }

  for (int i = 20; i <= 30; i++) {
    hashMap.put('Key-$i', 'Value-${i+100}');
    print('Length: ${hashMap.size}');
  }

  for (int i = 0; i <= 50; i++) {
    print('Key-$i: ${hashMap.get('Key-$i')}');
  }
}