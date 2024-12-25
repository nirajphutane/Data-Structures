
part of 'binary_tree.dart';

extension SubBinaryTree on BinaryTree {

  bool isIdentical(final BinaryTree anotherBinaryTree) => _isIdentical(root, anotherBinaryTree.root);

  bool isSubTree(final BinaryTree subBinaryTree) => _isSubBinaryTree(root, subBinaryTree.root);

  bool _isIdentical(final Node? node, final Node? anotherNode) {

    if (node == null) {
      return true;
    }

    if (anotherNode == null) {
      return false;
    }

    if (node.data == anotherNode.data) {
      return _isIdentical(node.left, anotherNode.left) && _isIdentical(node.right, anotherNode.right);
    }

    return false;
  }

  bool _isSubBinaryTree (final Node? node, final Node? anotherNode) {
    if (node == null) {
      return true;
    }

    if (anotherNode == null) {
      return false;
    }

    return _isIdentical(node, anotherNode) || _isIdentical(node.left, anotherNode) || _isIdentical(node.right, anotherNode);
  }
}

extension Parameters on BinaryTree {
  int get height => _height(root);

  int _height(Node? node) {
    if (node == null) {
      return 0;
    }

    return max(_height(node.left), _height(node.right)) + 1;
  }

  int get diameter => _diameter(root)['Diameter']!;

  Map<String, int> _diameter(Node? node) {
    if (node == null) {
      return {
        'Height': 0,
        'Diameter': 0
      };
    }

    final Map<String,int> left = _diameter(node.left);
    final Map<String,int> right = _diameter(node.right);

    return {
      'Height': max(left['Height']!, right['Height']!) + 1,
      'Diameter': [left['Diameter']!, right['Diameter']!, (left['Height']! + right['Height']! + 1)].reduce(max)
    };
  }
}