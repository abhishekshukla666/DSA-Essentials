
/*
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

 Example 1:
 
 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 
 Example 2:
 
 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0, inorder.count > 0 else { return nil }
    
    let root = TreeNode(preorder.first!)
    let midIndex = inorder.firstIndex(of: preorder.first!)!
    
    print(Array(preorder[1..<midIndex+1]), Array(inorder[0..<midIndex]))
    print(Array(preorder[midIndex+1..<preorder.count]), Array(inorder[midIndex+1..<inorder.count]))
    print("\n")
    
    root.left = buildTree(Array(preorder[1..<midIndex+1]), Array(inorder[0..<midIndex]))
    root.right = buildTree(Array(preorder[midIndex+1..<preorder.count]), Array(inorder[midIndex+1..<inorder.count]))
    return root
    
}

//let preorder = [3,9,20,15,7]
//let inorder = [9,3,15,20,7]

let preorder = [-1]
let inorder = [-1]

buildTree(preorder, inorder)

