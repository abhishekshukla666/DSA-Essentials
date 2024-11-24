
/*
 Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

 For example:

 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
  

 Example 1:

 Input: columnNumber = 1
 Output: "A"
 Example 2:

 Input: columnNumber = 28
 Output: "AB"
 Example 3:

 Input: columnNumber = 701
 Output: "ZY"
 */

import XCTest
class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        let alphabets = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var result = ""
        var num = columnNumber
        while num > 0 {
            let reminder = num % 26
            if reminder > 0 {
                result.append(alphabets[reminder - 1])
            } else {
                result.append("Z")
                num -= 26
            }
            num /= 26
        }
        return String(result.reversed())
    }
}

class SolutionTests: XCTestCase {
    var s = Solution()
    
    func test() {
        XCTAssertEqual(s.convertToTitle(1), "A")
        XCTAssertEqual(s.convertToTitle(28), "AB")
        XCTAssertEqual(s.convertToTitle(701), "ZY")
    }
}

SolutionTests.defaultTestSuite.run()
