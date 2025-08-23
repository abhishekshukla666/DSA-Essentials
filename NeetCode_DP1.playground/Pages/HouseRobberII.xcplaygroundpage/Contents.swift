
/*
 
 213. House Robber II
 Solved
 Medium

 Topics
 Companies

 Hint
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

  

 Example 1:

 Input: nums = [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
 Example 2:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 3:

 Input: nums = [1,2,3]
 Output: 3
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 1000
 */

import XCTest

class Solution {
    func rob(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else { return nums[0] }
        let skipFirst = Array(nums.dropFirst())
        let skipLast = Array(nums.dropLast())
        
        var memoFirst: [Int] = Array(repeating: -1, count: nums.count)
        var memoLast: [Int] = Array(repeating: -1, count: nums.count)
        func dfs(_ i: Int, _ houses: [Int], _ memo: inout [Int]) -> Int {
            if i >= houses.count {
                return 0
            }
            
            if memo[i] != -1 { return memo[i] }
            
            let skip = dfs(i + 1, houses, &memo)
            let keep = dfs(i + 2, houses, &memo) + houses[i]
            memo[i] = max(skip, keep)
            return memo[i]
        }
        
        return max(dfs(0, skipFirst, &memoFirst), dfs(0, skipLast, &memoLast))
    }
    
    func rob2(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            if nums.count > 1 {
                return max(nums[0], nums[1])
            }
            return nums[0]
        }
        func helper(_ houses: [Int]) -> Int {
            
            var dp = Array(repeating: 0, count: houses.count)
            dp[0] = houses[0]
            dp[1] = max(houses[0], houses[1])
            
            for i in 2..<houses.count {
                let skip = dp[i - 1]
                let keep = dp[i - 2] + houses[i]
                
                dp[i] = max(skip, keep)
            }
            
            return dp[houses.count - 1]
        }
       
        return max(
            helper(Array(nums.dropFirst())),
            helper(Array(nums.dropLast()))
        )
    }
    
    func rob3(_ nums: [Int]) -> Int {
        
        func helper(_ houses: [Int]) -> Int {
            
            var prev2 = houses[0]
            var prev1 = max(houses[0], houses[1])
            
            for i in 2..<houses.count {
                let current = max(houses[i] + prev2, prev1)
                prev2 = prev1
                prev1 = current
            }
            
            return prev1
        }
        
        return max(
            helper(Array(nums.dropFirst())),
            helper(Array(nums.dropLast()))
        )
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().rob([2, 3, 2]), 3)
        XCTAssertEqual(Solution().rob([1, 2, 3, 1]), 4)
        XCTAssertEqual(Solution().rob([94,40,49,65,21,21,106,80,92,81,679,4,61,6,237,12,72,74,29,95,265,35,47,1,61,397,52,72,37,51,1,81,45,435,7,36,57,86,81,72]), 2926)
    }
    func testExample2() {
        XCTAssertEqual(Solution().rob2([2, 3, 2]), 3)
        XCTAssertEqual(Solution().rob2([1, 2, 3, 1]), 4)
        XCTAssertEqual(Solution().rob2([94,40,49,65,21,21,106,80,92,81,679,4,61,6,237,12,72,74,29,95,265,35,47,1,61,397,52,72,37,51,1,81,45,435,7,36,57,86,81,72]), 2926)
    }
    
    func testExample3() {
        XCTAssertEqual(Solution().rob3([2, 3, 2]), 3)
        XCTAssertEqual(Solution().rob3([1, 2, 3, 1]), 4)
        XCTAssertEqual(Solution().rob3([94,40,49,65,21,21,106,80,92,81,679,4,61,6,237,12,72,74,29,95,265,35,47,1,61,397,52,72,37,51,1,81,45,435,7,36,57,86,81,72]), 2926)
    }
}

SolutionTests.defaultTestSuite.run()
