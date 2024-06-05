public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class BSTree {

    var index = -1
    func convertArrayToBST(_ arr: [Int]) -> TreeNode? {
        index += 1
        if arr[index] == -1 { return nil }
        let root = TreeNode(arr[index])
        root.left = convertArrayToBST(arr)
        root.right = convertArrayToBST(arr)
        return root
    }
    
    static func printPreOrder(_ node: TreeNode?) {
        guard let node = node else { return }
        debugPrint(node.val, terminator: "\t")
        printPreOrder(node.left)
        printPreOrder(node.right)
    }
    
    static func printInOrder(_ node: TreeNode?) {
        guard let node = node else { return }
        printPreOrder(node.left)
        debugPrint(node.val, terminator: "\t")
        printPreOrder(node.right)
    }
    
    static func printPostOrder(_ node: TreeNode?) {
        guard let node = node else { return }
        printPreOrder(node.left)
        printPreOrder(node.right)
        debugPrint(node.val, terminator: "\t")
    }
    
}
var arr = [1,2,4,-1,-1,5,-1,-1,3,-1,6,-1,-1]
let root = BSTree().convertArrayToBST(arr)
/*
        1
    2       3
 4      5       6
 
 */
BSTree.printPreOrder(root)
print("\n")
BSTree.printInOrder(root)
print("\n")
BSTree.printPostOrder(root)
