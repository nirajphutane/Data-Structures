
part 'node.dart';
part 'extensions.dart';

class BinarySearchTree {

  Node? _root;
  Node get root => _root!;

  BinarySearchTree (final List<int> list) {
    for (final int i in list) {
      insert(i);
    }
  }

  void insert (final int data) => _root = _insert(_root, data);

  Node? _insert (Node? node, final int data) {
    if (node == null) {
      node = Node(data);
      return node;
    }

    if (data < node.data) {
      node.left = _insert(node.left, data);
    } else {
      node.right = _insert(node.right, data);
    }

    return node;
  }

  List<int?> bfsTraversal ([final BFS bfs = BFS.IN]) {
    final List<int?> traversal = [];
    switch (bfs) {
      case BFS.PRE: {
        _preOrderTraversal(_root, traversal);
        break;
      }
      case BFS.IN: {
        _inOrderTraversal(_root, traversal);
        break;
      }
      case BFS.POST: {
        _postOrderTraversal(_root, traversal);
        break;
      }
    }
    return traversal;
  }

  void _preOrderTraversal (final Node? node, final List<int?> traversal) {
    if (node == null) {
      return;
    }
    traversal.add(node.data);
    _preOrderTraversal(node.left, traversal);
    _preOrderTraversal(node.right, traversal);
  }

  void _inOrderTraversal (final Node? node, final List<int?> traversal) {
    if (node == null) {
      return;
    }
    _inOrderTraversal(node.left, traversal);
    traversal.add(node.data);
    _inOrderTraversal(node.right, traversal);
  }

  void _postOrderTraversal (final Node? node, final List<int?> traversal) {
    if (node == null) {
      return;
    }
    _postOrderTraversal(node.left, traversal);
    _postOrderTraversal(node.right, traversal);
    traversal.add(node.data);
  }

  bool search (final int data) => _search (_root, data);

  bool _search (final Node? node, final int data) {
    if (node == null) {
      return false;
    }

    if (data < node.data) {
      return _search(node.left, data);
    } else if (data > node.data) {
      return _search(node.right, data);
    } else {
      return true;
    }
  }

  void delete (final int data) => _root = _delete(_root, data);

  Node? _delete (Node? node, final int data) {
    if (node == null) {
      return null;
    }

    if (data < node.data) {
      node.left = _delete(node.left, data);
    } else if (data > node.data) {
      node.right = _delete(node.right, data);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      } else if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      } else {
        final Node tmp = _inorderSuccessor(node.right);
        node = Node.fromData(tmp.data, node);
        node.right = _delete(node.right, tmp.data);
      }
    }

    return node;
  }

  Node _inorderSuccessor (Node? node) {
    while (node?.left != null) {
      node = node?.left;
    }
    return node!;
  }
}

enum BFS {
  PRE, IN, POST
}
