
part of 'binary_search_tree.dart';

class Node {
  int data;
  Node? left, right;

  Node (this.data, {left, right});

  Node.fromData(this.data, Node node) {
    left = node.left;
    right = node.right;
  }
}