
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var prev: ListNode? = nil
        var curr: ListNode? = head
        var next: ListNode? = curr?.next
        while curr != nil {
            let temp = curr
            curr?.next = prev
            prev = curr
            
        }
        return prev
    }
    
    func reverseList_Recursive(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        
        func helper(_ curr: ListNode?) -> ListNode? {
            if curr == nil { return nil }
            let next = curr?.next
            curr?.next = prev
            prev = curr
            helper(next)
            return prev
        }
        
        return helper(head)
    }
}
