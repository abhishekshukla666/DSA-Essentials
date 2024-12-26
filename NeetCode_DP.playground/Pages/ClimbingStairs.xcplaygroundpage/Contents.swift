
/*
 
 70. Climbing Stairs

 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

  

 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
  

 Constraints:

 1 <= n <= 45
 */

import XCTest

class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        func dfs(_ n: Int) -> Int {
            if n <= 0 { return 0 }
            if n == 1 { return 1 }
            return dfs(n - 1) + dfs(n - 2)
            
            guard n >= 0 else { return 0 }
            if n == 0 || n == 1 { return 1 }
            return dfs(n - 1) + dfs(n - 2)
        }
        
        return dfs(n)
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.climbStairs(2), 2)
        XCTAssertEqual(solution.climbStairs(3), 3)
    }
}

SolutionTests.defaultTestSuite.run()
