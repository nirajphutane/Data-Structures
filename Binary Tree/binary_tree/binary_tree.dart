
import 'dart:math';
import 'dart:collection';
part 'node.dart';
part 'extensions.dart';

class BinaryTree {

  final List<int> list;
  Node? _root;
  Node? get root => _root;
  

  BinaryTree(this.list) {
    _root = _buildTree();
  }

  int _index = -1;
  Node? _buildTree() {
    if (list[++_index] == -1) {
      return null;
    }
    return Node(list[_index], left: _buildTree(), right: _buildTree());
  }

  void insert(final int data) => _insert(_root, data);

  bool _insert(final Node? node, final int data) {
    if (node?.left == null) {
      node?.left = Node(data);
      return true;
    }
    if (node?.right == null) {
      node?.right = Node(data);
      return true;
    }

    if (_insert(node?.left, data)) {
      return true;
    }

    if (_insert(node?.right, data)) {
      return true;
    }

    return false;
  }
  
  List<int> dfs([final DfsOrderTraversal traversal = DfsOrderTraversal.PRE]) {
    final List<int> traversals = [];

    switch (traversal) {
      case DfsOrderTraversal.PRE: _preOrderTraversal(_root, traversals);
      case DfsOrderTraversal.IN: _inOrderTraversal(_root, traversals);
      case DfsOrderTraversal.POST: _postOrderTraversal(_root, traversals);
    }
    
    return traversals;
  }

  void _preOrderTraversal(final Node? node, final List<int> traversals) {
    if (node == null) {
      traversals.add(-1);
      return;
    }
    traversals.add(node.data);
    _preOrderTraversal(node.left, traversals);
    _preOrderTraversal(node.right, traversals);
  }

  void _inOrderTraversal(final Node? node, final List<int> traversals) {
    if (node == null) {
      traversals.add(-1);
      return;
    }
    _inOrderTraversal(node.left, traversals);
    traversals.add(node.data);
    _inOrderTraversal(node.right, traversals);
  }

  void _postOrderTraversal(final Node? node, final List<int> traversals) {
    if (node == null) {
      traversals.add(-1);
      return;
    }
    _postOrderTraversal(node.left, traversals);
    _postOrderTraversal(node.right, traversals);
    traversals.add(node.data);
  }

  List<List<int>> bfs() {
    if (_root == null) {
      return [];
    }

    final List<List<int>> traversals = [];
    final List<int> level = [];

    final Queue<Node?> queue = Queue();
    queue.add(_root);
    queue.add(null);
    while (queue.isNotEmpty) {
      final Node? node = queue.removeFirst();
      if (node == null) {
        if (queue.isEmpty) {
          break;
        }
        traversals.add(List.from(level));
        level.clear();
        queue.add(null);
      } else {
        level.add(node.data);
        if (node.left != null) {
          queue.add(node.left);
        }
        if (node.right != null) {
          queue.add(node.right);;
        }
      }
    }
    return traversals;
  }
}

enum DfsOrderTraversal {
  PRE, IN, POST
}
