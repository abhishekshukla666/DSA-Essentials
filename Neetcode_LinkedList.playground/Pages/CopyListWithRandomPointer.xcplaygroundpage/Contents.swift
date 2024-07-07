

import XCTest

public class Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    var val: Int
    var next: Node?
    var random: Node?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution {
    var cache = [Node: Node?]()
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }

        guard cache[head] == nil else { return cache[head]! }

        let newHead = Node(head.val)

        cache[head] = newHead

        newHead.next = copyRandomList(head.next)
        newHead.random = copyRandomList(head.random)

        return newHead
        
    }
}

//class SolutionTests: XCTestCase {
//    var s = Solution()
//    func testIsMonotonicIncreasing() {
//        XCTAssertTrue(s.isMonotonic([1,2,2,3]))
//    }
//    func testIsMonotonicDecreasing() {
//        XCTAssertTrue(s.isMonotonic([1,0,0,-1]))
//    }
//    func testIsMonotonicIncreasing2() {
//        XCTAssertTrue(s.isMonotonic([1, 1, 2]))
//    }
//}

//SolutionTests.defaultTestSuite.run()
