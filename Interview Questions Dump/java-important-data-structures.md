## 1. Array

```java
int[] arr = new int[5];
```

**Operations**

* Access: `arr[i]` → `O(1)`
* Update: `arr[i] = x` → `O(1)`
* Search: `O(n)`
* Insert/Delete (middle): `O(n)`

---

## 2. ArrayList

```java
ArrayList<Integer> list = new ArrayList<>();
```

**Operations**

```java
list.add(10);          // Insert at end
list.add(1, 20);       // Insert at index
list.get(0);           // Access
list.set(0, 30);       // Update
list.remove(0);        // Delete by index
list.contains(30);     // Search
list.size();           // Size
```

| Operation     | Complexity     |
| ------------- | -------------- |
| Access        | O(1)           |
| Insert End    | O(1) amortized |
| Insert Middle | O(n)           |
| Delete Middle | O(n)           |
| Search        | O(n)           |

---

## 3. LinkedList

```java
LinkedList<Integer> list = new LinkedList<>();
```

**Operations**

```java
list.addFirst(10);
list.addLast(20);
list.removeFirst();
list.removeLast();
list.get(0);
```

| Operation   | Complexity |
| ----------- | ---------- |
| Insert Head | O(1)       |
| Insert Tail | O(1)       |
| Delete Head | O(1)       |
| Delete Tail | O(1)       |
| Access      | O(n)       |
| Search      | O(n)       |

---

## 4. Stack (LIFO)

```java
Stack<Integer> stack = new Stack<>();
```

**Operations**

```java
stack.push(10);
stack.pop();
stack.peek();
stack.isEmpty();
```

| Operation | Complexity |
| --------- | ---------- |
| Push      | O(1)       |
| Pop       | O(1)       |
| Peek      | O(1)       |

---

## 5. Queue (FIFO)

```java
Queue<Integer> queue = new LinkedList<>();
```

**Operations**

```java
queue.offer(10);
queue.poll();
queue.peek();
```

| Operation | Complexity |
| --------- | ---------- |
| Enqueue   | O(1)       |
| Dequeue   | O(1)       |
| Front     | O(1)       |

---

## 6. Deque (Double Ended Queue)

```java
Deque<Integer> dq = new ArrayDeque<>();
```

**Operations**

```java
dq.addFirst(10);
dq.addLast(20);
dq.removeFirst();
dq.removeLast();
dq.peekFirst();
dq.peekLast();
```

| Operation    | Complexity |
| ------------ | ---------- |
| Insert Front | O(1)       |
| Insert Rear  | O(1)       |
| Delete Front | O(1)       |
| Delete Rear  | O(1)       |

---

## 7. HashSet

```java
HashSet<Integer> set = new HashSet<>();
```

**Operations**

```java
set.add(10);
set.remove(10);
set.contains(10);
```

| Operation | Complexity |
| --------- | ---------- |
| Insert    | O(1)       |
| Delete    | O(1)       |
| Search    | O(1)       |

---

## 8. TreeSet

```java
TreeSet<Integer> set = new TreeSet<>();
```

**Operations**

```java
set.add(10);
set.remove(10);
set.contains(10);
set.first();
set.last();
```

| Operation | Complexity |
| --------- | ---------- |
| Insert    | O(log n)   |
| Delete    | O(log n)   |
| Search    | O(log n)   |

---

## 9. HashMap

```java
HashMap<Integer, String> map = new HashMap<>();
```

**Operations**

```java
map.put(1, "A");
map.get(1);
map.remove(1);
map.containsKey(1);
```

| Operation | Complexity |
| --------- | ---------- |
| Put       | O(1)       |
| Get       | O(1)       |
| Remove    | O(1)       |

---

## 10. TreeMap

```java
TreeMap<Integer, String> map = new TreeMap<>();
```

**Operations**

```java
map.put(1, "A");
map.get(1);
map.remove(1);
map.firstKey();
map.lastKey();
```

| Operation | Complexity |
| --------- | ---------- |
| Put       | O(log n)   |
| Get       | O(log n)   |
| Remove    | O(log n)   |

---

## 11. Priority Queue (Heap)

```java
PriorityQueue<Integer> pq = new PriorityQueue<>();
```

**Operations**

```java
pq.offer(10);
pq.offer(5);
pq.peek();
pq.poll();
```

**Max Heap**

```java
PriorityQueue<Integer> maxHeap =
    new PriorityQueue<>(Collections.reverseOrder());
```

| Operation  | Complexity |
| ---------- | ---------- |
| Insert     | O(log n)   |
| Remove Top | O(log n)   |
| Peek Top   | O(1)       |

---

## Most Important for Interviews

1. Array
2. ArrayList
3. LinkedList
4. Stack
5. Queue
6. Deque
7. HashSet
8. HashMap
9. PriorityQueue
10. TreeSet
11. TreeMap
