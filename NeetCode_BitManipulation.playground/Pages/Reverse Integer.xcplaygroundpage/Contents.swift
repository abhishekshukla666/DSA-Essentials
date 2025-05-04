
/*
 
 7. Reverse Integer
 Solved
 Medium

 Topics
 Companies
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  

 Constraints:

 -231 <= x <= 231 - 1
 
 
 */

import XCTest

class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var reversedNum = 0
        
        while num != 0 {
            let remainder = num % 10
            reversedNum = reversedNum * 10 + remainder
            num /= 10
            
        }
        
        return reversedNum
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssert(Solution().reverse(123) == 321)
    }
}

SolutionTests.defaultTestSuite.run()
