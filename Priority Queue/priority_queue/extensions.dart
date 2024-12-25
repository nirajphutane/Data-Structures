
part of 'priority_queue.dart';

extension on int {

  int parent() => this ~/ 2;

  int leftChild() => (2 * this) + 1;

  int rightChild() => (2 * this) + 2;
}