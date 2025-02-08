
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
        
        var memo = [Int: Int]()
        func dfs(_ n: Int) -> Int {
            if let value = memo[n] { return value }
            guard n > 2 else { return n }
            let sum = dfs(n - 1) + dfs(n - 2)
            memo[n] = sum
            return memo[n]!
        }
        return dfs(n)
    }
    
    func climbStairs1(_ n: Int) -> Int {
        
        var memo = [Int: Int]()
       for i in 0...n {
           guard i > 2 else {
               memo[i] = i
               continue
           }
           memo[i] = memo[i - 1]! + memo[i - 2]!
        }
        return memo[n]!
    }
    
    func climbStairs2(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var prev = 1
        var curr = 1
        for i in 2...n {
            let next = prev + curr
            prev = curr
            curr = next
        }
        
        return curr
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.climbStairs2(2), 2)
        XCTAssertEqual(solution.climbStairs2(3), 3)
    }
}

SolutionTests.defaultTestSuite.run()
