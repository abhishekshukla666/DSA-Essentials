
/*
 
 47. Permutations II
 Medium

 Topics
 Companies
 Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

  

 Example 1:

 Input: nums = [1,1,2]
 Output:
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 Example 2:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
  

 Constraints:

 1 <= nums.length <= 8
 -10 <= nums[i] <= 10
 
 */

import XCTest

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        var result = Set<[Int]>()
        var check = Array(repeating: false, count: nums.count)
        var perms: [Int] = .init()
        
        func backtrack(_ index: Int) {
            if index >= nums.count {
                result.insert(perms)
                return
            }
            
            for i in 0..<nums.count {
                if !check[i] {
                    perms.append(nums[i])
                    check[i] = true
                    backtrack(index + 1)
                    perms.removeLast()
                    check[i] = false
                }
            }
        }
        
        backtrack(0)
        return Array(result)
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().permuteUnique([1, 1, 2]), [[1, 1, 2], [1, 2, 1], [2, 1, 1]])
        XCTAssertEqual(Solution().permuteUnique([1, 2, 3]), [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
    }
}

SolutionTests.defaultTestSuite.run()
