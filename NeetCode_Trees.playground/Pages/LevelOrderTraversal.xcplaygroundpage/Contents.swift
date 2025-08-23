
/*
 102. Binary Tree Level Order Traversal
 Medium
 
 Hint
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 
 Example 2:
 Input: root = [1]
 Output: [[1]]
 
 Example 3:
 Input: root = []
 Output: []
  
 Constraints:
 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

import XCTest

/* Definition for a binary tree node. */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var queue: [TreeNode] = []
        
        if let root = root {
            queue.append(root)
        }
        
        while !queue.isEmpty {
            var levels: [Int] = []
            var level: Int = queue.count

            for _ in 0..<level {
                let current = queue.removeFirst()
                levels.append(current.val)
                level -= 1
                
                if let left = current.left {
                    queue.append(left)
                }
                
                if let right = current.right {
                    queue.append(right)
                }
            }
            result.append(levels)
            
        }
        
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        let tree = TreeNode(3)
        tree.left = TreeNode(9)
        tree.right = TreeNode(20)
        tree.right?.left = TreeNode(15)
        tree.right?.right = TreeNode(7)
        XCTAssertEqual(solution.levelOrder(tree), [[3],[9,20],[15,7]])
    }
}

SolutionTests.defaultTestSuite.run()
