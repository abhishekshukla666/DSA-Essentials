
/*
 122. Best Time to Buy and Sell Stock II
 Solved
 Medium

 Topics
 premium lock icon
 Companies
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.

 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can sell and buy the stock multiple times on the same day, ensuring you never hold more than one share of the stock.

 Find and return the maximum profit you can achieve.

  

 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Total profit is 4 + 3 = 7.
 Example 2:

 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.
 Example 3:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
  

 Constraints:

 1 <= prices.length <= 3 * 104
 0 <= prices[i] <= 104
 */

import Foundation
import XCTest

class Solution {

    /* Solution 3 - Greedy (Sum of Positive Difference) */
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0

        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                profit += prices[i] - prices[i - 1]
            }
        }

        return profit
    }

    /* Solution 2 - DP (1 Diamesion) */
    func maxProfit2(_ prices: [Int]) -> Int {
        var hold = -prices[0]
        var notHold = 0

        for i in 1..<prices.count {
            let newNotHold = max(notHold, hold + prices[i])
            let newHold = max(hold, notHold - prices[i])
            notHold = newNotHold
            hold = newHold
        }

        return notHold
    }

    /* Solution 1 - Recurssion */
    func maxProfit1(_ prices: [Int]) -> Int {
        
        func dfs(_ index: Int, _ isHolding: Bool) -> Int {
            guard index < prices.count else { return 0 }
            if isHolding {
                // If Holds the stocks = Two Choices - Sell Or Skip
                let sell = prices[index] + dfs(index + 1, false)
                let skip = dfs(index + 1, true)
                return max(sell, skip)
            } else {
                // If does not hold any stocks = Two Choices - Buy Or Skip
                let buy = -prices[index] + dfs(index + 1, true)
                let skip = dfs(index + 1, false)
                return max(buy, skip)
            }
        }

        return dfs(0, false)
    }
}

class SolutionTests: XCTestCase {
    func testSolution1() {
        XCTAssertEqual(Solution().maxProfit([7,1,5,3,6,4]), 7)
    }
    func testSolution2() {
        XCTAssertEqual(Solution().maxProfit1([7,1,5,3,6,4]), 7)
    }
    func testSolution3() {
        XCTAssertEqual(Solution().maxProfit2([7,1,5,3,6,4]), 7)
    }
}

SolutionTests.defaultTestSuite.run()
