
/*
 680. Valid Palindrome II
 Solved
 Easy

 Topics
 premium lock icon
 Companies
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

  

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  

 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 */

import XCTest

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let s = Array<Character>(s)
        var left = 0
        var right = s.count - 1
        while left < right {
            if s[left] != s[right] {
                return isPalindrome(s, left, right - 1) ||
                isPalindrome(s, left + 1, right)
            }

            left += 1
            right -= 1
        }
        return true
    }

    private func isPalindrome(_ s: [Character], _ left: Int, _ right: Int) -> Bool {
        var left = left
        var right = right

        while left < right {
            if s[left] != s[right] { return false}
            left += 1
            right -= 1
        }

        return true
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().validPalindrome("aba"), true)
    }
    func testExample2() {
        XCTAssertEqual(Solution().validPalindrome("abc"), false)
    }
}

SolutionTests.defaultTestSuite.run()
