
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
    func isAnagram1(_ s: String, _ t: String) -> Bool {
        
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
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var codes = Array(repeating: 0, count: 26)
        for ch in s {
            codes[Int(ch.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        print(codes)
        
        for ch in t {
            let index = Int(ch.asciiValue! - Character("a").asciiValue!)
            guard codes[index] > 0 else { return false }
            codes[index] -= 1
        }
        
        return true
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let s = Solution()
        XCTAssertEqual(s.isAnagram("anagram", "nagaram"), true)
    }
}

SolutionTests.defaultTestSuite.run()
