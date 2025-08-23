

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
    
    func buildCompleteBinaryTree(_ arr: [Int?]) -> TreeNode? {
        guard !arr.isEmpty, let first = arr[0] else { return nil }
        
        var nodes = arr.map { $0 != nil ? TreeNode($0!) : nil }
        
        for i in 0..<arr.count {
            guard let node = nodes[i] else { continue }
            
            let leftIndex = 2 * i + 1
            let rightIndex = 2 * i + 2
            
            if leftIndex < arr.count { node.left = nodes[leftIndex] }
            if rightIndex < arr.count { node.right = nodes[rightIndex] }
        }
        
        return nodes[0]
    }
    
    func convertSortedArrayToBST(_ arr: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard left < right else { return nil }
        let mid = left + (right - left) / 2
        let root = TreeNode(arr[mid])
        root.left = convertSortedArrayToBST(arr, left, mid - 1)
        root.right = convertSortedArrayToBST(arr, mid + 1, right)
        
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
    
    static func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        func helper(_ node: TreeNode?, _ maxD: inout Int) -> Int {
            guard let node = node else { return 0 }
            let left = helper(node.left, &maxD)
            let right = helper(node.right, &maxD)
            maxD = max(maxD, left + right)
            return max(left, right) + 1
        }
        helper(root, &diameter)
        return diameter
    }
    
    static func isBalanced(_ root: TreeNode?) -> Bool {
        func height(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            return max(height(node.left), height(node.right)) + 1
        }
        
        func helper(_ node: TreeNode?) -> Bool {
            guard let node = node else { return true }
            let left = helper(node.left)
            let right = helper(node.right)
            return left && right && abs(height(node.left) - height(node.right)) <= 1
        }
        
        return helper(root)
    }
    
    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q else {
            if p == nil && q == nil {
                return true
            }
            return false
        }
        
        let left = isSameTree(p.left, q.left)
        let right = isSameTree(p.right, q.right)
        return left && right && p.val == q.val
    }
    
    static func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard let s = s, let t = t else {
            if t == nil {
                return true
            }
            return false
        }
        
        if isSameTree(s, t) {
            return true
        }
        
        return isSubtree(s.left, t) || isSubtree(s.right, t)
    }
    
    func printLevelOrder(_ root: TreeNode?) {
        guard let root else { return }
        var queue: [TreeNode?] = [root]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            print(first?.val ?? "nil")
            
            if let left = first?.left {
                queue.append(left)
            }
            if let right = first?.right {
                queue.append(right)
            }
            
        }
    }
}
var arr = [3,9,20,nil,nil,15,7]
let root = BSTree().buildCompleteBinaryTree(arr)
BSTree().printLevelOrder(root)
/*
        1
    2       3
 4      5       6
 
 */
//BSTree.printPreOrder(root)
//print("\n")
//BSTree.printInOrder(root)
//print("\n")
//BSTree.printPostOrder(root)
//BSTree.diameterOfBinaryTree(root)
