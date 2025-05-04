
/*
 
 108. Convert Sorted Array to Binary Search Tree
 Solved
 Easy

 Topics
 Companies
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

  

 Example 1:


 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:


 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
  

 Constraints:

 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
 
 
 */

import XCTest

public class TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        
        func helper(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
            guard start <= end else { return nil }
            let mid = start + (end - start) / 2
            let root = TreeNode(nums[mid])
            root.left = helper(nums, start, mid - 1)
            root.right = helper(nums, mid + 1, end)
            return root
        }
        
        return helper(nums, 0, nums.count - 1)
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        /// [0,-3,9,-10,null,5]
        let root = TreeNode(0)
        root.left = TreeNode(-3)
        root.right = TreeNode(9)
        root.left?.left = TreeNode(-10)
        root.right?.left = TreeNode(5)
        XCTAssertEqual(Solution().sortedArrayToBST([-10,-3,0,5,9]), root)
//        XCTAssertEqual(Solution().sortedArrayToBST([1,3]), [3,1])
    }
}

SolutionTests.defaultTestSuite.run()
