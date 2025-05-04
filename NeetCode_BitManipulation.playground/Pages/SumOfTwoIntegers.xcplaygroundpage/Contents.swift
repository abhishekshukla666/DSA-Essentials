
/*
 
 371. Sum of Two Integers
 Medium

 Topics
 Companies
 Given two integers a and b, return the sum of the two integers without using the operators + and -.

  

 Example 1:

 Input: a = 1, b = 2
 Output: 3
 Example 2:

 Input: a = 2, b = 3
 Output: 5
  

 Constraints:

 -1000 <= a, b <= 1000
 
 */



/*
 00 - 0
 01 - 1
 10 - 2
 11 - 3
 100 - 4
 101 - 5
 */

import XCTest

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        /*
         
        10
      + 01
       ----
        11
       ----
         
         1^0 = 1,
         1^1 = 0,
         0^0 = 0,
         0^1 = 1
        
         a & b << 1 = 100 /// 0&0 = 0, 0&1 = 0, 1&0 = 0, 1&1 = 1


        */

        var a = a
        var b = b
        while b != 0 {
            debugPrint("a: \(a), b: \(b)")
            let carry = a & b
            debugPrint("carry: \(carry)")
            a = a ^ b
            debugPrint("a: \(a)")
            b = carry << 1
            debugPrint("b: \(b)\n")
        }

        return a
    }
}

class TestSolution: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().getSum(3, 2), 5)
    }
}

TestSolution.defaultTestSuite.run()
