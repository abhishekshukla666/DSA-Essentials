
/*
 
 1071. Greatest Common Divisor of Strings
 Easy

 Topics
 Companies

 Hint
 For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).

 Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

  

 Example 1:
 Input: str1 = "ABCABC", str2 = "ABC"
 Output: "ABC"
 
 Example 2:
 Input: str1 = "ABABAB", str2 = "ABAB"
 Output: "AB"
 
 Example 3:
 Input: str1 = "LEET", str2 = "CODE"
 Output: ""
  

 Constraints:
 1 <= str1.length, str2.length <= 1000
 str1 and str2 consist of English uppercase letters.
 
 
 */

import XCTest

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str1 + str2 == str2 + str1 else { return "" }
        let gcd = commonPrefix(str1.count, str2.count)
        return String(str1.prefix(gcd))
    }
    
    func commonPrefix(_ num1: Int, _ num2: Int) -> Int {
        var a = num1
        var b = num2
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
}

class SolutionTests: XCTestCase {
    func testCase() {
        XCTAssertEqual(Solution().gcdOfStrings("ABCABC", "ABC"), "ABC")
        XCTAssertEqual(Solution().gcdOfStrings("ABABAB", "ABAB"), "AB")
        XCTAssertEqual(Solution().gcdOfStrings("LEET", "CODE"), "")
    }
}

SolutionTests.defaultTestSuite.run()
