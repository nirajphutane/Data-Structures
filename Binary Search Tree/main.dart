
import 'binary_search_tree/binary_search_tree.dart';

void main() {
  final BinarySearchTree bst = BinarySearchTree([8, 5, 3, 1, 4, 6, 10, 11, 14]);
  print(bst.root.data);
  print(bst.bfsTraversal());
  print(bst.search(4));
  print(bst.search(0));
  print(bst.search(15));
  bst.delete(8);
  print(bst.bfsTraversal());
  print(bst.inRange(6, 10));
  print(bst.inRange(3, 12));
  print(bst.rootToAllLeafPaths());
}