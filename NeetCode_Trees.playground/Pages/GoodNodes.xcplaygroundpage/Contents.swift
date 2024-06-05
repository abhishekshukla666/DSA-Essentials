
/*
 
 Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.

 Return the number of good nodes in the binary tree.

 Example 1:
 
 Input: root = [3,1,4,3,null,1,5]
 Output: 4
 Explanation: Nodes in blue are good.
 Root Node (3) is always a good node.
 Node 4 -> (3,4) is the maximum value in the path starting from the root.
 Node 5 -> (3,4,5) is the maximum value in the path
 Node 3 -> (3,1,3) is the maximum value in the path.
 
 Example 2:

 Input: root = [3,3,null,4,2]
 Output: 3
 Explanation: Node 2 -> (3, 3, 2) is not good, because "3" is higher than it.
 
 Example 3:

 Input: root = [1]
 Output: 1
 Explanation: Root is considered as good.
 
 */

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

func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    func dfs(_ node: TreeNode?, _ maxVal: Int) -> Int {
        guard let node = node else { return 0 }
        var count = 0
        if node.val >= maxVal { count += 1 }
        count += dfs(node.left, max(node.val, maxVal))
        count += dfs(node.right, max(node.val, maxVal))
        return count
    }
    
    return dfs(root, root.val)
}

////let root = [3,1,4,3,nil,1,5]
//let node3 = TreeNode(3)
//let node1 = TreeNode(1)
//let node4 = TreeNode(4)
//let node
//root.left = TreeNode(1)
//root
//goodNodes(root)

