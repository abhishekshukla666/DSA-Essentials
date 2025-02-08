
/*
 256. Paint House
 Medium

 Description
 There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color, and you need to cost the least. Return the minimum cost.

 The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.

 Only $39.9 for the "Twitter Comment System Project Practice" within a limited time of 7 days!

 WeChat Notes Twitter for more information（WeChat ID jiuzhangfeifei）


 All costs are positive integers.

 Example 1:
 Input: [[14,2,11],[11,14,5],[14,3,10]]
 Output: 10
 Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue. Minimum cost: 2 + 5 + 3 = 10.
 
 Example 2:
 Input: [[1,2,3],[1,4,6]]
 Output: 3
 
 */

import XCTest

enum PaintHouseColor: Int {
    case red = 0
    case blue = 1
    case green = 2
}

class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        
        var memo = Array(repeating: Array(repeating: -1, count: 3), count: costs.count)
        
        func paint(_ house: Int, _ color: PaintHouseColor) -> Int {
            if house >= costs.count {
                return 0
            }
            if memo[house][color.rawValue] != -1 {
                return memo[house][color.rawValue]
            }
            var minCost = costs[house][color.rawValue]
            
            switch color {
            case .red:
                minCost += min(paint(house + 1, .blue), paint(house + 1, .green))
            case .blue:
                minCost += min(paint(house + 1, .red), paint(house + 1, .green))
            case .green:
                minCost += min(paint(house + 1, .red), paint(house + 1, .blue))
            }
            memo[house][color.rawValue] = minCost
            return minCost
        }
        
        return min(paint(0, .red), paint(1, .blue), paint(2, .green))
    }
    
    func minCost2(_ costs: [[Int]]) -> Int {
        var result = [0, 0, 0]
        
        for i in 0..<costs.count {
            let p0 = costs[i][0] + min(result[1], result[2])
            let p1 = costs[i][1] + min(result[0], result[2])
            let p2 = costs[i][2] + min(result[0], result[1])
            result = [p0, p1, p2]
        }
        
        return result.min() ?? 0
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().minCost2([[14,2,11],[11,14,5],[14,3,10]]), 10)
//        XCTAssertEqual(Solution().minCost([[1,2,3],[1,4,6]]), 3)
    }
}

SolutionTests.defaultTestSuite.run()

