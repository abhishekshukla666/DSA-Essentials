
/*
 28. Find the Index of the First Occurrence in a String
 Solved
 Easy

 Topics
 premium lock icon
 Companies
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

  

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 */

import XCTest

extension String {
    subscript(_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count <= haystack.count else { return -1 }
        
        var i = 0
        while i < haystack.count - needle.count + 1 {
            var j = 0
            var match = 0
            while j < needle.count {
                if haystack[i + j] != needle[j] {
                    break
                }
                j += 1
                match += 1
            }
            
            if match == needle.count { return i }
            i += 1
        }
        return -1
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().strStr("sadbutsad", "sad"), 0)
    }
    func testExample2() {
        XCTAssertEqual(Solution().strStr("badbutsad", "sad"), 6)
    }
    func testExample3() {
        XCTAssertEqual(Solution().strStr("leetcode", "leeto"), -1)
    }
    func testExample4() {
        XCTAssertEqual(Solution().strStr("leetcode", "leetcode"), 0)
    }
    func testExample5() {
        XCTAssertEqual(Solution().strStr("leet", "leetcode"), -1)
    }
}

SolutionTests.defaultTestSuite.run()
