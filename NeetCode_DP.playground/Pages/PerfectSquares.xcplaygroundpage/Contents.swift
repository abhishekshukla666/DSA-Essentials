
/*
 
 279. Perfect Squares
 Medium

 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

 Example 1:
 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 
 Example 2:
 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
  
 Constraints:
 1 <= n <= 104
 
 
 */

import XCTest

class Solution {
    func numSquares1(_ n: Int) -> Int {
        /*
        
         */
    }
}

class TestSolution: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().numSquares1(12), 3)
//        XCTAssertEqual(Solution().numSquares1(13), 2)
    }
}

TestSolution.defaultTestSuite.run()
