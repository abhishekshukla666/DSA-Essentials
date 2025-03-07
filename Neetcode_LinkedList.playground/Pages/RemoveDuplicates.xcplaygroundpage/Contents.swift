

/*
 
 
 83. Remove Duplicates from Sorted List
 Solved
 Easy

 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

  

 Example 1:
 Input: head = [1,1,2]
 Output: [1,2]
 
 Example 2:
 Input: head = [1,1,2,3,3]
 Output: [1,2,3]
  

 Constraints:
 The number of nodes in the list is in the range [0, 300].
 -100 <= Node.val <= 100
 The list is guaranteed to be sorted in ascending order.
 
 
 */

import XCTest

// Definition for singly-linked list.
public class ListNode: Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var curr = head

        while curr != nil {
            if prev == nil {
                prev = curr
                curr = curr?.next
            } else {
                while curr != nil, curr?.val == prev?.val {
                    prev?.next = curr?.next
                    curr = curr?.next
                }
                
                prev = curr
                curr = curr?.next
            }
        }

        return head
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let list1: ListNode = ListNode(1)
        list1.next = ListNode(1)
        list1.next?.next = ListNode(2)
        
        let list2: ListNode = ListNode(1)
        list1.next = ListNode(2)
        XCTAssertEqual(Solution().deleteDuplicates(list1), list2)
    }
}

SolutionTests.defaultTestSuite.run()
