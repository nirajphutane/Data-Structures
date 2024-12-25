
import 'binary_tree/binary_tree.dart';

void main(List<String> args) {
  final BinaryTree tree = BinaryTree([1, 2, 4, -1, -1, 5, -1, -1, 3, -1, 6, -1, -1]);
  print(tree.root?.data);
  print(tree.dfs());
  print(tree.bfs());
  tree.insert(99);
  print(tree.dfs());
  print(tree.bfs());
  print(tree.height);
  print(tree.diameter);

  final BinaryTree subTree = BinaryTree([3, -1, 6, -1, -1]);
  print(subTree.root?.data);
  print(tree.isSubTree(subTree));

  final BinaryTree anotherTree = BinaryTree([1, 2, 4, -1, -1, 5, -1, -1, 3, -1, 6, -1, -1]);
  print(tree.isIdentical(anotherTree));
}