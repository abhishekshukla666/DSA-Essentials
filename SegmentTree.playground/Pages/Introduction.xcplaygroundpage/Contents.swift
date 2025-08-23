
/*
 Build an segment tree from an array
 */

let arr = [3,5,2,8,1]

import XCTest

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func buildSegmentTree(_ arr: [Int]) -> [Int] {
        
        var segmentTree: [Int] = Array(repeating: 0, count: arr.count * 2 - 1)
        func dfs(_ index: Int, _ left: Int, _ right: Int) {
            guard left < right else {
                segmentTree[index] = arr[left]
                return
            }
            let mid = left + (right - left) / 2
            dfs(2 * index + 1, left, mid)
            dfs(2 * index + 2, mid + 1, right)
            
            segmentTree[index] = segmentTree[2 * index + 1] + segmentTree[2 * index + 2]
        }
        
        dfs(0, 0, arr.count - 1)
        return segmentTree
    }
    
    func sumOf(start: Int, end: Int) -> Int {
        return (start...end).reduce(0, +) // Sum using closed range
    }
}

class TestSolution: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().buildSegmentTree([3, 1, 2, 7]), [13, 4, 9, 3, 1, 2, 7])
    }
}

XCTestSuite.default.run()
