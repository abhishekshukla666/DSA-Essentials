
/*
 796. Rotate String
 Easy
 
 Given two strings s and goal, return true if and only if s can become goal after some number of shifts on s.

 A shift on s consists of moving the leftmost character of s to the rightmost position.

 For example, if s = "abcde", then it will be "bcdea" after one shift.
  

 Example 1:

 Input: s = "abcde", goal = "cdeab"
 Output: true
 Example 2:

 Input: s = "abcde", goal = "abced"
 Output: false
  

 Constraints:

 1 <= s.length, goal.length <= 100
 s and goal consist of lowercase English letters.
 */

import XCTest

class Solution {
    func rotateString1(_ s: String, _ goal: String) -> Bool {
        for i in 0..<s.count {
            let matching = s.suffix(s.count - i) + s.prefix(i)
            if matching == goal { return true }
        }
        return false
    }
    
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        let match = s + s // abcdeabcde
        if match.contains(goal) { return true }
        return false
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().rotateString("abcde", "cdeab"), true)
    }
    
    func testExample2() {
        XCTAssertEqual(Solution().rotateString("abcde", "abced"), false)
    }
}

SolutionTests.defaultTestSuite.run()
