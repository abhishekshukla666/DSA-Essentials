
/*
 322. Coin Change
 Medium
 
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.

 Example 1:

 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 Example 3:

 Input: coins = [1], amount = 0
 Output: 0
  

 Constraints:

 1 <= coins.length <= 12
 1 <= coins[i] <= 231 - 1
 0 <= amount <= 104
 
 */

import XCTest

class Solution {
    /* Recursive */
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        func dfs(_ i: Int, _ change: Int) -> Int {
            if change == 0 { return 0 }
            if i >= coins.count ||
                change < 0 { return Int.max - 1 }
            
            let skip = dfs(i + 1, change)
            let keep = dfs(i, change - coins[i]) + 1
            
            if coins[i] <= amount {
                return min(skip, keep)
            } else {
                return skip
            }
        }
        let result = dfs(0, amount)
        return result == Int.max - 1 ? -1: result
    }
    
    /* Recursive + Memoization */
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        let n = coins.count
        var dp = Array(repeating: Array(repeating: -1, count: amount + 1), count: n + 1) // Memoization table
        
        func helper(_ index: Int, _ amount: Int) -> Int {
            if amount == 0 { return 0 }
            if index >= n || amount < 0 { return Int.max - 1 }
            
            if dp[index][amount] != -1 { return dp[index][amount] }
            
            let exclude = helper(index + 1, amount)
            let include = 1 + helper(index, amount - coins[index])
            
            if coins[index] <= amount {
                dp[index][amount] = min(exclude, include)
            } else {
                dp[index][amount] = exclude
            }
            debugPrint(dp)
            return dp[index][amount]
        }
        
        let result = helper(0, amount)
        return (result == Int.max - 1) ? -1 : result  // Return -1 if no solution found
    }
    
    /* Top Down */
    func coinChange3(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        let n = coins.count
        let INF = amount
        var dp = Array(repeating: Array(repeating: INF, count: amount + 1), count: n + 1)
        
        //base case
        for i in 0...n {
            dp[i][0] = 0
        }
        
        for i in 1...n {
            for j in 1...amount {
                if coins[i-1] <= j {
                    dp[i][j] = min(1 + dp[i][j - coins[i - 1]], dp[i - 1][j])
                } else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        
        return dp[n][amount] == INF ? -1 : dp[n][amount]
    }
    /* Top Down - Optimized Space */
    func coinChange4(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var result: [Int] = Array(repeating: amount + 1, count: amount + 1)
        
        result[0] = 0
        for i in 1..<amount + 1 {
            for c in coins where c <= i {
                result[i] = min(result[i], result[i - c] + 1)
            }
        }
        return result[amount] > amount ? -1 : result[amount]
    }
}

class XCTSolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().coinChange([1,2,5], 11), 3)
        XCTAssertEqual(Solution().coinChange([2], 3), -1)
        XCTAssertEqual(Solution().coinChange([1], 0), 0)
        XCTAssertEqual(Solution().coinChange([195,265,404,396], 3239), 12)
    }
}

XCTSolutionTests.defaultTestSuite.run()
