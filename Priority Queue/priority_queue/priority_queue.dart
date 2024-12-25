
part 'extensions.dart';

class PriorityQueue {

  final List<int> _heap = [];

  int get size => _heap.length;

  void insert(int value) {
    _heap.add(value);
    _upHeapify(size-1);
  }

  int pole() {
    final int value = _heap.first;
    _heap.first = _heap.last;
    _heap.removeLast();
    _downHeapify(0);
    return value;
  }

  void _upHeapify(final int child) {
    final int parent = child.parent();
    if (_heap[parent] > _heap[child]) {
      _swap(parent, child);
      _upHeapify(parent);
    }
  }

  void _downHeapify(final int parent) {
    int p = parent;

    int child = parent.leftChild();
    if (child < size && _heap[p] > _heap[child]) {
      p = child;
    }

    child = parent.rightChild();
    if (child < size && _heap[p] > _heap[child]) {
      p = child;
    }

    if (p != parent) {
      _swap(p, parent);
      _downHeapify(p);
    }
  }

  void _swap(final int i, final int j) {
    final int tmp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = tmp;
  }
}