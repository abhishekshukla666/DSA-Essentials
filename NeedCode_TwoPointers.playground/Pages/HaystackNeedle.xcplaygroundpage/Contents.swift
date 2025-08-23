
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

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else { return -1 }
        let haystackArray = Array(haystack)
        let needleArray = Array(needle)
        
        for i in 0..<(haystack.count - needle.count + 1) {
            var count = 0
            for j in 0..<needle.count {
                print("i+j: \(i+j)")
                if haystackArray[i+j] != needleArray[j] { break }
                count += 1
            }
            if count == needle.count {
                return i
            }
        }
        
        return -1
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
//        XCTAssertEqual(Solution().strStr("sadbutsad", "sad"), 0)
//        XCTAssertEqual(Solution().strStr("leetcode", "leeto"), -1)
        XCTAssertEqual(Solution().strStr("mississippi", "issipi"), -1)
    }
}

SolutionTests.defaultTestSuite.run()
