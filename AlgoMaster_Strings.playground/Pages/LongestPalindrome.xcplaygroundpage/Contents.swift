
/*
 409. Longest Palindrome
 Solved
 Easy

 Topics
 premium lock icon
 Companies
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

 Letters are case sensitive, for example, "Aa" is not considered a palindrome.

  

 Example 1:

 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 Example 2:

 Input: s = "a"
 Output: 1
 Explanation: The longest palindrome that can be built is "a", whose length is 1.
  

 Constraints:

 1 <= s.length <= 2000
 s consists of lowercase and/or uppercase English letters only.
*/

import XCTest

class Solution {
    func longestPalindrome(_ s: String) -> Int {
            var dict: [Character: Int] = .init()

            for ch in s {
                dict[ch, default: 0] += 1
            }

            var result = 0
            var hasOdd = false

            for (key, value) in dict {
                if value % 2 == 0 {
                    result += value
                } else {
                    result += value - 1
                    hasOdd = true
                }
            }

            if hasOdd { result += 1 }

            return result
        }
}

class SolutionTests: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().longestPalindrome("abccccdd"), 7)
    }
    func test2() {
        XCTAssertEqual(Solution().longestPalindrome("a"), 1)
    }
}

SolutionTests.defaultTestSuite.run()
