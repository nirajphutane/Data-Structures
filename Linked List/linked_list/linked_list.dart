
part 'node.dart';

class LinkedList {

  Node? head;

  void addAtFirst(final int data) => head = Node(data, head);

  void addAtLast(final int data) {
    if (head == null) {
      addAtFirst(data);
      return;
    }
    Node? current = head;
    while(current?.next != null) {
      current = current?.next;
    }
    current?.next = Node(data);
  }

  void removeFirst() => head = head?.next;

  void removeLast() {

    if (head?.next == null) {
      removeFirst();
      return;
    }

    Node? current = head;
    Node? next = current?.next;

    while (next?.next != null) {
      current = current?.next;
      next = current?.next;
    }

    current?.next = null;
  }

  @override
  String toString() {
    String list = 'head -> ';
    Node? node = head;
    while (node != null) {
      list += '${node.data} -> ';
      node = node.next;
    }
    list += 'null';
    return list;
  }
}