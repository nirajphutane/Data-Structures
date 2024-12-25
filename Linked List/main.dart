
import 'linked_list/linked_list.dart';

void main() {
  final LinkedList linkedList = LinkedList();

  linkedList.removeFirst();
  print(linkedList.toString());
  linkedList.removeLast();
  print(linkedList.toString());

  linkedList.addAtFirst(3);
  print(linkedList.toString());
  linkedList.addAtFirst(2);
  print(linkedList.toString());
  linkedList.addAtFirst(1);
  print(linkedList.toString());

  linkedList.addAtLast(4);
  print(linkedList.toString());
  linkedList.addAtLast(5);
  print(linkedList.toString());
  linkedList.addAtLast(6);
  print(linkedList.toString());

  linkedList.removeFirst();
  print(linkedList.toString());
  linkedList.removeFirst();
  print(linkedList.toString());
  linkedList.removeFirst();
  print(linkedList.toString());

  linkedList.removeLast();
  print(linkedList.toString());
  linkedList.removeLast();
  print(linkedList.toString());
  linkedList.removeLast();
  print(linkedList.toString());

  linkedList.removeFirst();
  print(linkedList.toString());
  linkedList.removeLast();
  print(linkedList.toString());
}