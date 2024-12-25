
import 'priority_queue/priority_queue.dart';

void main() {
  final PriorityQueue priorityQueue = PriorityQueue();
  priorityQueue.insert(5);
  priorityQueue.insert(4);
  priorityQueue.insert(1);
  priorityQueue.insert(3);
  priorityQueue.insert(2);
  priorityQueue.insert(-1);
  priorityQueue.insert(-7);
  priorityQueue.insert(0);

  while (priorityQueue.size > 0) {
    print(priorityQueue.pole());
  }
}