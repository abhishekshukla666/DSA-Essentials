
/*
 Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.

 Example 1:
 
 Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
 Output: [3,9,20,null,null,15,7]
 
 Example 2:

 Input: inorder = [-1], postorder = [-1]
 Output: [-1]

 */


//Definition for a binary tree node.
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

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    
    guard inorder.count > 0, postorder.count > 0 else { return nil }
    
    var postorder = postorder
    let root = TreeNode(postorder.last!)
    postorder.remove(at: postorder.count - 1)
    let midIndex = inorder.firstIndex(of: postorder.last!)!
    
    /* Inorder Left and Right */
    print(Array(inorder[0..<midIndex]), Array(inorder[midIndex+1..<inorder.count]))
    
    /* Postorder Left and Right */
    print(Array(postorder[0..<midIndex]), Array(postorder[midIndex..<postorder.count - 1]))
    
    print("\n")
    
    root.right = buildTree(Array(inorder[midIndex+1..<inorder.count]), Array(postorder[midIndex..<postorder.count - 1]))
    root.left = buildTree(Array(inorder[0..<midIndex]), Array(postorder[0..<midIndex]))
    
    return root
}

let inorder = [9,3,15,20,7]
let postorder = [9,15,7,20,3]

buildTree(inorder, postorder)
