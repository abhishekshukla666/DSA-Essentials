

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

    func reorderList(_ head: ListNode?) {
        guard head != nil else { return }
        var slow = head
        var fast = head
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        printL(slow)
        printL(head)
        let reverse = reverseList(slow)
        printL(head)
        mergeList(head, reverse)
    }
    
    func printL(_ l: ListNode?) {
        var l = l
        while l != nil {
            print(l?.val ?? 0, terminator: "->")
            l = l?.next
        }
        print("nil")
        print("\n")
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode?
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
    
    func mergeList(_ leftList: ListNode?, _ rightList: ListNode?) {
        var left = leftList
        var right = rightList
        var temp: ListNode?
        while right?.next != nil {
            temp = left?.next
            left?.next = right
            left = temp
            
            temp = right?.next
            right?.next = left
            right = temp
        }
    }


let list = ListNode(1)
list.next = ListNode(2)
list.next?.next = ListNode(3)
list.next?.next?.next = ListNode(4)

reorderList(list)
printL(list)
