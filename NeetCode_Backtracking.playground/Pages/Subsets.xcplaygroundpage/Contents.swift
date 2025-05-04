
/*
 
 78. Subsets
 Medium

 Topics
 Companies
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 All the numbers of nums are unique.
 */

import XCTest

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var subset: [Int] = []
        func backtrack(_ index: Int) {
            if index >= nums.count {
                result.append(subset)
                return
            }
            
            /// decision to include nums[index]
            subset.append(nums[index])
            backtrack(index + 1)
            
            /// decision to exclude nums[index]
            subset.removeLast()
            backtrack(index + 1)
        }
        
        backtrack(0)
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().subsets([1, 2, 3]), [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]])
        XCTAssertEqual(Solution().subsets([0]), [[], [0]])
    }
}

SolutionTests.defaultTestSuite.run()
