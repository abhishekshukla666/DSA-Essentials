
/*
 
 746. Min Cost Climbing Stairs
 Easy

 You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

 You can either start from the step with index 0, or the step with index 1.

 Return the minimum cost to reach the top of the floor.

  

 Example 1:

 Input: cost = [10,15,20]
 Output: 15
 Explanation: You will start at index 1.
 - Pay 15 and climb two steps to reach the top.
 The total cost is 15.
 Example 2:

 Input: cost = [1,100,1,1,1,100,1,1,100,1]
 Output: 6
 Explanation: You will start at index 0.
 - Pay 1 and climb two steps to reach index 2.
 - Pay 1 and climb two steps to reach index 4.
 - Pay 1 and climb two steps to reach index 6.
 - Pay 1 and climb one step to reach index 7.
 - Pay 1 and climb two steps to reach index 9.
 - Pay 1 and climb one step to reach the top.
 The total cost is 6.
  

 Constraints:

 2 <= cost.length <= 1000
 0 <= cost[i] <= 999
 
 */

import XCTest

class Solution {
    /* Recursive + Memoization */
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        
        var memo: [Int] = Array(repeating: -1, count: cost.count + 1)
        
        func dfs(_ i: Int) -> Int {
            if i >= cost.count { return 0 }
            if memo[i] != -1 { return memo[i] }
            
            memo[i] = min(dfs(i + 1) + cost[i], dfs(i + 2) + cost[i])
            return memo[i]
        }
        
        return min(dfs(0), dfs(1))
    }
    
    /* Top Down */
    func minCostClimbingStairs2(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count + 1)
        
        for i in 2...cost.count {
            dp[i] = min(dp[i - 1] + cost[i - 1],
                        dp[i - 2] + cost[i - 2])
        }
        
        return dp[cost.count]
    }
    
    /* Space Optimization */
    func minCostClimbingStairs3(_ cost: [Int]) -> Int {
        var prev1 = 0
        var prev2 = 0
        
        for i in 2...cost.count {
            let curr = min(prev1 + cost[i - 1],
                           prev2 + cost[i - 2])
            
            prev2 = prev1
            prev1 = curr
        }
        
        return prev1
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().minCostClimbingStairs([10, 15, 20]), 15)
    }
    func testExample2() {
        XCTAssertEqual(Solution().minCostClimbingStairs2([10, 15, 20]), 15)
    }
    func testExample3() {
        XCTAssertEqual(Solution().minCostClimbingStairs3([10, 15, 20]), 15)
    }
}

SolutionTests.defaultTestSuite.run()
