
/*
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

 Example 1:
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 Example 2:
 Input: head = [1], n = 1
 Output: []
 
 Example 3:
 Input: head = [1,2], n = 1
 Output: [1]

 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var count = 0
        var temp = head
        while temp != nil {
            count += 1
            temp = temp?.next
        }
        
        if count == n {
            let newHead = head?.next
            return newHead
        }
        
        var root = ListNode(-1)
        var prev: ListNode? = nil
        var curr: ListNode? = head
        
        for _ in 0..<count - n {
            prev = curr
            curr = curr?.next
        }
        
        prev?.next = curr?.next
        curr?.next = nil
        
        printLL(head)
        
        return head
    }
    
    func remvoeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p1 = head
        var count = 0
        while p1 != nil {
            count += 1
            p1 = p1?.next
        }
        
        if count == n {
            return head?.next
        }
        
        var prev: ListNode? = nil
        var current = head
        
        for _ in 0..<(count-n) {
            prev = current
            current = current?.next
        }
        
        prev?.next = current?.next
        current?.next = nil
    
        return head
    }
    
    func printLL(_ root: ListNode?) {
        var curr = root
        while curr != nil {
            print(curr?.val ?? -1, terminator: "->")
            curr = curr?.next
        }
        print("\n")
    }
}


let one = ListNode(1)
let two = ListNode(2)
let three = ListNode(3)
let four = ListNode(4)
let five = ListNode(5)

one.next = two
two.next = three
three.next = four
four.next = five

let solution = Solution()
solution.printLL(one)

//solution.removeNthFromEnd(one, 2)
solution.remvoeNthFromEnd2(one, 2)
solution.printLL(one)


