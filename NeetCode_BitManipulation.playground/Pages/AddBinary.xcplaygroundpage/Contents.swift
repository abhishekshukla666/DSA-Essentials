

/*
 
 67. Add Binary
 Easy

 Topics
 Companies
 Given two binary strings a and b, return their sum as a binary string.

  

 Example 1:

 Input: a = "11", b = "1"
 Output: "100"
 Example 2:

 Input: a = "1010", b = "1011"
 Output: "10101"
  

 Constraints:

 1 <= a.length, b.length <= 104
 a and b consist only of '0' or '1' characters.
 Each string does not contain leading zeros except for the zero itself.
 
 */

import XCTest

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        /*
           1
          1010
        + 1011
         -----
         10101
         -----
         */
        
        var result: [String] = .init()
        let a = a.compactMap(\.wholeNumberValue)
        let b = b.compactMap(\.wholeNumberValue)
        
        var carry: Int = 0
        var i = a.count - 1
        var j = b.count - 1
        
        while i >= 0 || j >= 0 || carry > 0 {
            let firstDigit = i >= 0 ? a[i]: 0
            let secondDigit = j >= 0 ? b[j]: 0
            
            let sum = firstDigit + secondDigit + carry
            
            carry = sum / 2
            let digit = sum % 2
            
            result.append(String(digit))
            
            i -= 1
            j -= 1
        }
        
        return result.reversed().joined()
    }
}

class TestSolution: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().addBinary("11", "1"), "100")
    }
}

TestSolution.defaultTestSuite.run()
