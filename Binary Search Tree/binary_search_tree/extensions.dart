
part of 'binary_search_tree.dart';

extension Range on BinarySearchTree {
  List<int> inRange(final int from, final int to) {
    final List<int> list = [];
    _inRange(_root, list, from, to);
    return list;
  }

  void _inRange(Node? node, final List<int> list, final int from, final int to) {
    if (node == null) {
      return;
    }

    if (from > node.data) {
      _inRange(node.right, list, from, to);
    } else if (to < node.data) {
      _inRange(node.left, list, from, to);
    } else {
      _inRange(node.left, list, from, to);
      list.add(node.data);
      _inRange(node.right, list, from, to);
    }
  }
}

extension Path on BinarySearchTree {

  List<List<int>> rootToAllLeafPaths() {
    final List<List<int>> allRootToLeafPaths = [];
    _rootToAllLeafPaths(_root, [], allRootToLeafPaths);
    return allRootToLeafPaths;
  }

  void _rootToAllLeafPaths(final Node? node, final List<int> rootToLeafPath, final List<List<int>> allRootToLeafPaths) {

    if (node == null) {
      return;
    }

    rootToLeafPath.add(node.data);
    if (node.left == null && node.right == null) {
      allRootToLeafPaths.add(List.from(rootToLeafPath));
    } else {
      _rootToAllLeafPaths(node.left, rootToLeafPath, allRootToLeafPaths);
      _rootToAllLeafPaths(node.right, rootToLeafPath, allRootToLeafPaths);
    }
    rootToLeafPath.removeLast();
  }
}