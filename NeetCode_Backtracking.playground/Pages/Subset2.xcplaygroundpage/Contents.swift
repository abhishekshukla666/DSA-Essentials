
/*
 
 90. Subsets II
 Medium

 Topics
 Companies
 Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,2]
 Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
  

 Constraints:

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10
 */

import XCTest

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var subset = [Int]()
        
        func backtrack(_ index: Int) {
            if index >= nums.count {
                result.append(subset)
                return
            }
            
            subset.append(nums[index])
            backtrack(index + 1)
            subset.removeLast()
            
            var nextIndex = index + 1
            while nextIndex < nums.count && nums[index] == nums[nextIndex] {
                nextIndex += 1
            }
            backtrack(nextIndex)
        }
        backtrack(0)
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
//        XCTAssertEqual(Solution().subsetsWithDup([1, 2, 2]), [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]])
//        XCTAssertEqual(Solution().subsetsWithDup([0]), [[], [0]])
        XCTAssertEqual(Solution().subsetsWithDup([4,4,4,1,4]), [[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]])
    }
}

SolutionTests.defaultTestSuite.run()
