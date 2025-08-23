
/*
 
 198. House Robber
 Medium
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

  

 Example 1:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 Example 2:

 Input: nums = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 400
 */

import XCTest

class Solution {
    func rob(_ nums: [Int]) -> Int {
        
        var memo: [Int] = Array(repeating: -1, count: nums.count + 1)
        func dfs(_ i: Int) -> Int {
            if i >= nums.count {
                return 0
            }
            if memo[i] != -1 {
                return memo[i]
            }
            let skip = dfs(i + 1)
            let keep = dfs(i + 2) + nums[i]
            memo[i] = max(skip, keep)
            return memo[i]
        }
        
        return dfs(0)
    }
    
    func rob2(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<nums.count {
            let skip = dp[i - 1]
            let keep = dp[i - 2] + nums[i]
            dp[i] = max(skip, keep)
        }
        
        print(dp)
        return dp[nums.count - 1]
    }
    
    func rob3(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            if nums.count > 1 {
                return max(nums[0], nums[1])
            }
            return nums[0]
        }
        var prev2 = nums[0]
        var prev1 = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            let current = max(nums[i] + prev2, prev1)
            prev2 = prev1
            prev1 = current
        }
        
        return prev1
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().rob([1,2,3,1]), 4)
        XCTAssertEqual(Solution().rob([2,7,9,3,1]), 12)
    }
    
    func testExample2() {
        XCTAssertEqual(Solution().rob2([1,2,3,1]), 4)
        XCTAssertEqual(Solution().rob2([2,7,9,3,1]), 12)
    }
    func testExample3() {
        XCTAssertEqual(Solution().rob3([1,2,3,1]), 4)
        XCTAssertEqual(Solution().rob3([2,7,9,3,1]), 12)
    }
}

SolutionTests.defaultTestSuite.run()
