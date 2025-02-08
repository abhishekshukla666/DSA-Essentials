
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
        
        var memo = [Int: Int]()
        
        func money(_ index: Int) -> Int {
            
            guard index < nums.count else { return 0 }
            if index == nums.count { return 0 }
            
            if let value = memo[index] { return value }
            
            let skip = money(index + 1)
            let keep = nums[index] + money(index + 2)
            
            memo[index] = max(skip, keep)
            return memo[index]!
        }
        
        return money(0)
    }
    
    func rob2(_ nums: [Int]) -> Int {
        
        let n = nums.count
        guard n > 0 else { return 0 }
        guard n > 1 else { return nums[0] }
        
        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            
            let skip = dp[i - 1]
            let keep = nums[i] + dp[i - 2]
            
            dp[i] = max(skip, keep)
        }
        
        return dp[n - 1]
    }
    
    func rob3(_ nums: [Int]) -> Int {
        
        let n = nums.count
        guard n > 0 else { return 0 }
        guard n > 1 else { return nums[0] }
        
        var prev = nums[0]
        var curr = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            let next = max(nums[i] + prev, curr)
            prev = curr
            curr = next
        }
        
        return curr
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().rob3([1,2,3,1]), 4)
    }
}

SolutionTests.defaultTestSuite.run()
