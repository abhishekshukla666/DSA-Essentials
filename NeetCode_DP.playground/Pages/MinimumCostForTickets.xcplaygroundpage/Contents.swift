
/*
 983. Minimum Cost For Tickets
 Medium
 
 You have planned some train traveling one year in advance. The days of the year in which you will travel are given as an integer array days. Each day is an integer from 1 to 365.

 Train tickets are sold in three different ways:

 a 1-day pass is sold for costs[0] dollars,
 a 7-day pass is sold for costs[1] dollars, and
 a 30-day pass is sold for costs[2] dollars.
 The passes allow that many days of consecutive travel.

 For example, if we get a 7-day pass on day 2, then we can travel for 7 days: 2, 3, 4, 5, 6, 7, and 8.
 Return the minimum number of dollars you need to travel every day in the given list of days.

  

 Example 1:

 Input: days = [1,4,6,7,8,20], costs = [2,7,15]
 Output: 11
 Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
 On day 1, you bought a 1-day pass for costs[0] = $2, which covered day 1.
 On day 3, you bought a 7-day pass for costs[1] = $7, which covered days 3, 4, ..., 9.
 On day 20, you bought a 1-day pass for costs[0] = $2, which covered day 20.
 In total, you spent $11 and covered all the days of your travel.
 Example 2:

 Input: days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
 Output: 17
 Explanation: For example, here is one way to buy passes that lets you travel your travel plan:
 On day 1, you bought a 30-day pass for costs[2] = $15 which covered days 1, 2, ..., 30.
 On day 31, you bought a 1-day pass for costs[0] = $2 which covered day 31.
 In total, you spent $17 and covered all the days of your travel.
  

 Constraints:

 1 <= days.length <= 365
 1 <= days[i] <= 365
 days is in strictly increasing order.
 costs.length == 3
 1 <= costs[i] <= 1000
 
 */

import XCTest

class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        func helper(_ index: Int) -> Int {
            if index >= days.count { return 0 } // No more travel days left
            
            debugPrint("try 1-day pass, index: \(index)")
            // Try 1-day pass
            let oneDay = costs[0] + helper(index + 1)
            debugPrint("try 1-day pass result: \(oneDay)")
            
            debugPrint("try 7-day pass, index: \(index)")
            // Try 7-day pass
            var i = index
            while i < days.count && days[i] < days[index] + 7 { i += 1 }
            let sevenDay = costs[1] + helper(i)
            debugPrint("try 7-day pass result: \(sevenDay)")
            
            debugPrint("try 30-day pass, index: \(index)")
            // Try 30-day pass
            i = index
            while i < days.count && days[i] < days[index] + 30 { i += 1 }
            let thirtyDay = costs[2] + helper(i)
            debugPrint("try 30-day pass result: \(thirtyDay)")
            
            return min(oneDay, sevenDay, thirtyDay)
        }
        
        return helper(0)
    }
    
    func mincostTickets2(_ days: [Int], _ costs: [Int]) -> Int {
        
        var memo = [Int: Int]() // Memoization table
        
        func helper(_ index: Int) -> Int {
            if index >= days.count { return 0 } // Base case: No more travel days
            
            if let cached = memo[index] { return cached } // Return memoized result
            
            // Try 1-day pass
            let oneDay = costs[0] + helper(index + 1)
            
            // Try 7-day pass
            var i = index
            while i < days.count && days[i] < days[index] + 7 { i += 1 }
            let sevenDay = costs[1] + helper(i)
            
            // Try 30-day pass
            i = index
            while i < days.count && days[i] < days[index] + 30 { i += 1 }
            let thirtyDay = costs[2] + helper(i)
            
            // Store and return minimum cost
            memo[index] = min(oneDay, sevenDay, thirtyDay)
            return memo[index]!
        }
        
        return helper(0)
    }
}

final class MinCostTicketsTests: XCTestCase {
    func testExample() {
//        XCTAssertEqual(Solution().mincostTickets([1,4,6,7,8,20], [2,7,15]), 11)
        XCTAssertEqual(Solution().mincostTickets2([1,4,6,7,8,20], [2,7,15]), 11)
    }
}

MinCostTicketsTests.defaultTestSuite.run()
