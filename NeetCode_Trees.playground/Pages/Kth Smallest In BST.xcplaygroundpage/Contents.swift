
/*
 
 230. Kth Smallest Element in a BST
 Solved
 Medium

 Topics
 Companies

 Hint
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

  

 Example 1:


 Input: root = [3,1,4,null,2], k = 1
 Output: 1
 Example 2:


 Input: root = [5,3,6,2,4,null,null,1], k = 3
 Output: 3
  

 Constraints:

 The number of nodes in the tree is n.
 1 <= k <= n <= 104
 0 <= Node.val <= 104
  

 Follow up: If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
 
 
 */

import XCTest

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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var stack: [Int] = []
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            guard stack.count < k else { return 0 }
            let last = stack.removeLast() ?? 0
            stack.append(min(last, node.val))
            dfs(node.left)
            dfs(node.right)
            
            return stack.last ?? 0
        }
        
        return dfs(root)
    }
}

class SolutionTest: XCTestCase {
    func testExample() {
        let root = TreeNode(5)
        root.left = TreeNode(3)
        root.right = TreeNode(6)
        root.left?.left = TreeNode(2)
        root.left?.right = TreeNode(4)
        root.left?.left?.left = TreeNode(1)
        XCTAssertEqual(Solution().kthSmallest(root, 3))
    }
}
