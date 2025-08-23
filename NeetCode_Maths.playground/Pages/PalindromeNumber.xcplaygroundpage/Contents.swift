
/*
 9. Palindrome Number
 Solved
 Easy

 Topics
 premium lock icon
 Companies

 Hint
 Given an integer x, return true if x is a palindrome, and false otherwise.

  

 Example 1:

 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
  

 Constraints:

 -231 <= x <= 231 - 1
  

 Follow up: Could you solve it without converting the integer to a string?
 */



import XCTest

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) { return false }
        var x2 = x
        var res = 0
        
        while x2 > 0 {
            res = res * 10 + x2 % 10
            x2 /= 10
        }
    
        return x == res
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().isPalindrome(121), true)
//        XCTAssertEqual(Solution().isPalindrome(-121), false)
//        XCTAssertEqual(Solution().isPalindrome(10), false)
    }
}

SolutionTests.defaultTestSuite.run()
