
/*
 230. Kth Smallest Element in a BST
 Solved
 Medium

 Topics
 premium lock icon
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
        var stack = [TreeNode]()
        var current = root
        var count = 0
        
        while current != nil || !stack.isEmpty {
            while let node = current {
                stack.append(node)
                print(node.val)
                current = node.left
            }
            
            let node = stack.removeLast()
            count += 1
            
            if count == k {
                return node.val
            }
            
            current = node.right
        }
        
        fatalError("k is out of bounds")
    }
}

class SolutionTest: XCTestCase {
    func testExmaple() {
        let treeNode = TreeNode(3)
        treeNode.left = TreeNode(1)
        treeNode.left?.right = TreeNode(2)
        treeNode.right = TreeNode(4)
        
        XCTAssertEqual(Solution().kthSmallest(treeNode, 1), 1)
    }
}

SolutionTest.defaultTestSuite.run()
