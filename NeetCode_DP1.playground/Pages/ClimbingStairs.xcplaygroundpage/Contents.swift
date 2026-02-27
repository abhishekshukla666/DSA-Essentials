
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
    
    /* Recursive */
    func climbStairs1(_ n: Int) -> Int {
        func dfs(_ i: Int) -> Int {
            guard i > 1 else { return 1 }
            let oneStep = dfs(i - 1)
            let twoStep = dfs(i - 2)
            return oneStep + twoStep
        }
        
        return dfs(n)
    }
    
    /* Recursive + Memoization */
    func climbStairs2(_ n: Int) -> Int {
        var memo = Array(repeating: -1, count: n + 1)
        
        func dfs(_ i: Int) -> Int {
            if memo[i] != -1 { return memo[i] }
            guard i > 2 else { return i }
            let oneStep = dfs(i - 1)
            let twoStep = dfs(i - 2)
            memo[i] = oneStep + twoStep
            print("memo[\(i)] = \(memo[i])")
            return memo[i]
        }
        let result = dfs(n)
        print(memo)
        return result
    }
    
    /* Top Down */
    func climbStairs3(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    
    /* Top Down Space Optimization */
    func climbStairs4(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var prev = 1
        var curr = 1
        for i in 2...n {
            let sum = prev + curr
            prev = curr
            curr = sum
        }
        
        return curr
    }
}

class SolutionTests: XCTestCase {
//    func testExample1() {
//        let solution = Solution()
//        XCTAssertEqual(solution.climbStairs1(2), 2)
//        XCTAssertEqual(solution.climbStairs1(3), 3)
//    }
    func testExample2() {
        let solution = Solution()
//        XCTAssertEqual(solution.climbStairs2(2), 2)
        XCTAssertEqual(solution.climbStairs2(5), 8)
    }
//    func testExample3() {
//        let solution = Solution()
//        XCTAssertEqual(solution.climbStairs3(2), 2)
//        XCTAssertEqual(solution.climbStairs3(3), 3)
//    }
//    func testExample4() {
//        let solution = Solution()
//        XCTAssertEqual(solution.climbStairs4(2), 2)
//        XCTAssertEqual(solution.climbStairs4(3), 3)
//    }
}

SolutionTests.defaultTestSuite.run()
