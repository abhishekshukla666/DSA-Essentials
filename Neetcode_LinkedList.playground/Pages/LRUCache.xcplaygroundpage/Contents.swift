
/*
 146. LRU Cache
 Medium
 
 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 The functions get and put must each run in O(1) average time complexity.

  

 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4
  

 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 104
 0 <= value <= 105
 At most 2 * 105 calls will be made to get and put.
 */

import XCTest

final class LLNode {
    var prev: LLNode?
    var next: LLNode?
    var key: Int
    var value: Int
    
    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

final class LRUCache {
    
    var capacity: Int
    var head: LLNode = LLNode(0, 0)
    var tail: LLNode = LLNode(0, 0)
    var dict: [Int: LLNode] = .init()

    init(_ capacity: Int) {
        self.capacity = capacity
        head.prev = tail
        tail.next = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dict[key] else { return -1 }
        moveBeforeHead(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.value = value
            moveBeforeHead(node)
        } else {
            let newNode = LLNode(key, value)
            dict[key] = newNode
            insertBeforeHead(newNode)
            if dict.count > capacity {
                if let prev = tail.next {
                    dict.removeValue(forKey: prev.key)
                    removeNode(prev)
                }
            }
        }
    }
    // Helper
    func insertBeforeHead(_ node: LLNode) {
        let prev = head.prev
        prev?.next = node
        node.next = head
        node.prev = prev
        head.prev = node
    }
    // Helper
    func removeNode(_ node: LLNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    // Helper
    func moveBeforeHead(_ node: LLNode) {
        removeNode(node)
        insertBeforeHead(node)
    }
}
