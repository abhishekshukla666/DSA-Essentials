

import Foundation
import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var stack: [ListNode?] = []
        
        var a = headA
        while a != nil {
            stack.append(a)
            a = a?.next
        }
        
        var b = headB
        while b != nil {
            if let index = stack.firstIndex(where: { $0 === b }) {
                return stack[index]
            }
            
            b = b?.next
        }
        
        return nil
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var currA = headA
        var currB = headB
        
        while currA !== currB {
            currA = currA == nil ? headB: currA?.next
            currB = currB == nil ? headA: currB?.next
        }
        
        return currA
    }
}

extension ListNode: Equatable {
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let ll4 = ListNode(4)
        let ll1 = ListNode(1)
        let ll8 = ListNode(8)
        let ll4_2 = ListNode(4)
        let ll5 = ListNode(5)
        
        ll4.next = ll1
        ll1.next = ll8
        ll8.next = ll4_2
        ll4_2.next = ll5
        
        let ll5_2 = ListNode(5)
        let ll6 = ListNode(6)
        let ll1_2 = ListNode(1)
        
        ll5_2.next = ll6
        ll6.next = ll1_2
        ll1_2.next = ll8
        
        let solution = Solution()
//        let result = solution.getIntersectionNode(ll4, ll5_2)
        let result = solution.getIntersectionNode2(ll4, ll5_2)
        
        XCTAssertEqual(result, ll8)
    }
}

SolutionTests.defaultTestSuite.run()
