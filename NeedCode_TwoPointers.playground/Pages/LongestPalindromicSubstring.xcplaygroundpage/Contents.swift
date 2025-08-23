
/*
 5. Longest Palindromic Substring
 Solved
 Medium

 Topics
 Companies

 Hint
 Given a string s, return the longest palindromic substring in s.

  

 Example 1:

 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  

 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */

import XCTest

class Solution {
    func longestPalindrome(_ s: String) -> String {
     
        let chars = Array(s)
        var firstIndex = 0
        var resultLength = 0
        for i in 0..<s.count {
            /* Odd Length */
            var l = i
            var r = i
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                if (r - l + 1) > resultLength {
                    firstIndex = l
                    resultLength = r - l + 1
                }
                l -= 1
                r += 1
            }
            
            /* Event Length */
            l = i
            r = i + 1
            while l >= 0 && r < chars.count && chars[l] == chars[r] {
                if (r - l + 1) > resultLength {
                    firstIndex = l
                    resultLength = r - l + 1
                }
                l -= 1
                r += 1
            }
        }
       
        return String(chars[firstIndex..<firstIndex+resultLength])
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().longestPalindrome("babad"), "bab")
        XCTAssertEqual(Solution().longestPalindrome("cbbd"), "bb")
    }
}

SolutionTests.defaultTestSuite.run()
