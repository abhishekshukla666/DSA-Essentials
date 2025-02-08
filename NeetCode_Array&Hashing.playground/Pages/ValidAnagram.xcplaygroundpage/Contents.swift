
/*
 242. Valid Anagram
 Easy
 
 Given two strings s and t, return true if t is an
 anagram of s, and false otherwise.

 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true

 Example 2:
 Input: s = "rat", t = "car"
 Output: false

 Constraints:
 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
  
 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 
 */

import XCTest

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        let charA = Character("a").asciiValue!
        
        var sChar = Array(repeating: 0, count: 26)
        
        for ch in s.utf8 {
            sChar[Int(ch - charA)] += 1
        }
        
        var tChar = Array(repeating: 0, count: 26)
        for ch in t.utf8 {
            tChar[Int(ch - charA)] += 1
        }
        
        return sChar == tChar
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let s = Solution()
        XCTAssertEqual(s.isAnagram("anagram", "nagaram"), true)
    }
}

SolutionTests.defaultTestSuite.run()
