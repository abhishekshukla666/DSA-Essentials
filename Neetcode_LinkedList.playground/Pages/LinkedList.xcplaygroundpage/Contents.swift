
class Node<T: Equatable> {
    var val: T
    var next: Node?
    init(_ val: T, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func insert(_ val: T) {
        guard let head = head else {
            head = Node(val)
            return
        }
        
        var curr: Node<T>? = head
        while curr != nil {
            if curr?.next != nil {
                curr = curr?.next
            } else {
                let newNode = Node(val)
                curr?.next = newNode
                break
            }
        }
    }
    
    func delete(_ val: T) {
        if head == nil { return }
        if head?.val == val { head = head?.next }
        var curr: Node<T>? = head
        
        while curr != nil {
            var prev: Node<T>? = curr
            if curr?.val == val {
                let next = curr?.next
                prev?.next = next
                break
            } else {
                curr = curr?.next
            }
        }
    }
    
    func printLL(_ s: String = "") {
        print("")
        var curr = head
        if curr == nil {
            print("nil")
        }
        while curr != nil {
            print(curr?.val ?? -1, terminator: " ")
            curr = curr?.next
        }
    }
}

let ll = LinkedList<Int>()
ll.insert(1)
ll.insert(2)
ll.insert(3)
ll.insert(4)
ll.insert(5)
ll.printLL()

ll.delete(1)
ll.printLL()

ll.delete(2)
ll.printLL()

ll.delete(3)
ll.printLL()

ll.delete(4)
ll.printLL()

ll.delete(5)
ll.printLL()
