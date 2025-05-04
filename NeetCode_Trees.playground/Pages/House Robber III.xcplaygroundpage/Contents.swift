
/*
 
 337. House Robber III
 Medium

 Topics
 Companies
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.

 Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

  

 Example 1:


 Input: root = [3,2,3,null,3,null,1]
 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:


 Input: root = [3,4,5,1,3,null,1]
 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 104
 
 */

import XCTest

public class TreeNode: Hashable {
    
    static public func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
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
    func rob1(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
           
            /// rob current, skip its childerens and add childeren's child
            var robCurrent = node.val
            robCurrent += dfs(node.left?.left) + dfs(node.left?.right)
            robCurrent += dfs(node.right?.left) + dfs(node.right?.right)
            
           /// skip current, rob its childerens
            let skipCurrent = dfs(node.left) + dfs(node.right)
            return max(robCurrent, skipCurrent)
        }
        
        return dfs(root)
    }
    
    func rob2(_ root: TreeNode?) -> Int {
        
        var memo: [TreeNode: Int] = [:]
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            
            if let value = memo[node] {
                return value
            }
            /// rob current, skip its childerens and add childeren's child
            var robCurrent = node.val
            robCurrent += dfs(node.left?.left) + dfs(node.left?.right)
            robCurrent += dfs(node.right?.left) + dfs(node.right?.right)
            
           /// skip current, rob its childerens
            let skipCurrent = dfs(node.left) + dfs(node.right)
            memo[node] = max(robCurrent, skipCurrent)
            return memo[node] ?? 0
        }
        
        return dfs(root)
    }
    
    
    func rob3(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> (rob: Int, skip: Int) {
            guard let node = node else { return (0, 0) }
            
            let left = dfs(node.left)
            let right = dfs(node.right)
            
            // If we rob this node, we must skip its children
            let robCurrent = node.val + left.skip + right.skip
            
            // If we skip this node, we can rob its children
            let skipCurrent = max(left.rob, left.skip) + max(right.rob, right.skip)
            
            return (robCurrent, skipCurrent)
        }
        
        let result = dfs(root)
        return max(result.rob, result.skip)
        
    }
}

class TestSolution: XCTestCase {
    func testExample() {
        let root = TreeNode(3)
        root.left = TreeNode(2)
        root.right = TreeNode(3)
        root.left?.left = nil
        root.left?.right = TreeNode(3)
        root.right?.left = nil
        root.right?.right = TreeNode(1)
//        XCTAssertEqual(Solution().rob1(root), 7)
        XCTAssertEqual(Solution().rob3(root), 7)
    }
}

TestSolution.defaultTestSuite.run()
