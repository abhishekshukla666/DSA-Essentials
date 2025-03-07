
/*
 309. Best Time to Buy and Sell Stock with Cooldown
 
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:

 After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).
 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

  

 Example 1:

 Input: prices = [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]
 Example 2:

 Input: prices = [1]
 Output: 0
  

 Constraints:

 1 <= prices.length <= 5000
 0 <= prices[i] <= 1000
 */

import Foundation
import XCTest

class Solution {
    
    func maxProfit1(_ prices: [Int]) -> Int {
        var profit = 0
        func dfs(_ i: Int, _ holding: Bool) -> Int {
            if i >= prices.count { return 0 }
            if holding {
                let sell = dfs(i + 2, !holding) + prices[i]
                let cooldown = dfs(i + 1, holding)
                profit = max(sell, cooldown)
            } else {
                let buy = dfs(i + 1, !holding) - prices[i]
                let cooldown = dfs(i + 1, holding)
                profit = max(buy, cooldown)
            }
            
            return profit
        }
        return dfs(0, false)
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        var memo = [String: Int]() /// key = "\(i)\(holding)", value = prices[i]
        func dfs(_ i: Int, _ holding: Bool) -> Int {
            if i >= prices.count { return 0 }
            if let value = memo["\(i)\(holding)"] { return value }
            if holding {
                let sell = dfs(i + 2, !holding) + prices[i]
                let cooldown = dfs(i + 1, holding)
                memo["\(i)\(holding)"] = max(sell, cooldown)
            } else {
                let buy = dfs(i + 1, !holding) - prices[i]
                let cooldown = dfs(i + 1, holding)
                memo["\(i)\(holding)"] = max(buy, cooldown)
            }
            
            return memo["\(i)\(holding)", default: 0]
        }
        return dfs(0, false)
    }
    
    func maxProfit3(_ prices: [Int]) -> Int {

        var memo = Array(repeating: Array(repeating: -1, count: 2), count: prices.count)
        
        func dfs(_ index: Int, _ holding: Int) -> Int {
            if index >= prices.count { return 0 }
            if memo[index][holding] != -1 {
                return memo[index][holding]
            }
            var profit = 0
            if holding == 1 {
                let sell = dfs(index + 2, 0) + prices[index]
                let cooldown = dfs(index + 1, 1)
                profit = max(sell, cooldown)
            } else {
                let buy = dfs(index + 1, 1) - prices[index]
                let cooldown = dfs(index + 1, 0)
                profit = max(buy, cooldown)
            }
            memo[index][holding] = profit
            print(memo)
            return memo[index][holding]
        }
        
        return dfs(0, 0)
    }
    
    func maxProfit4(_ prices: [Int]) -> Int {
        var coolDown = 0
        var hold = Int.min
        var sold = Int.min
        for price in prices {
            let prevSold = sold
            sold = hold + price
            hold = max(hold, coolDown - price)
            coolDown = max(coolDown, prevSold)
        }
        
        return max(coolDown, sold)
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.maxProfit4([1, 2, 3, 0, 2]), 3)
        XCTAssertEqual(solution.maxProfit4([7, 1, 5, 3, 4, 6]), 6)
        XCTAssertEqual(Solution().maxProfit4([1, 2]), 1)
    }
}

SolutionTests.defaultTestSuite.run()
