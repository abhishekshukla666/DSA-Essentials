
/*
 
 
 231. Power of Two
 Easy

 Topics
 Companies
 Given an integer n, return true if it is a power of two. Otherwise, return false.

 An integer n is a power of two, if there exists an integer x such that n == 2x.

  

 Example 1:

 Input: n = 1
 Output: true
 Explanation: 20 = 1
 Example 2:

 Input: n = 16
 Output: true
 Explanation: 24 = 16
 Example 3:

 Input: n = 3
 Output: false
  

 Constraints:

 -231 <= n <= 231 - 1
  

 Follow up: Could you solve it without loops/recursion?
 
 
 */


import XCTest

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        var n = n
        var x = 1

        while x < n {
            x *= 2
        }
        print(n)
        return x == n
    }
    
    func isPowerOfTwo2(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }
        /*
         For number, multiple of 2 only one 1's would
         there in the binary number
         Multiple - 16 8 4 2 1
         for 1 - 0001
         for 2 - 0010
         for 4 - 0100
         for 8 - 1000
         
         To check if there is only one 1's
         we have to invert it and make & operator
         for 4 - 100
         for 3 - 011
         1110
         */
        return (n & (n - 1)) == 0
    }
}

class TestSolution: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().isPowerOfTwo(2), true)
        XCTAssertEqual(Solution().isPowerOfTwo(4), true)
        XCTAssertEqual(Solution().isPowerOfTwo(6), false)
        XCTAssertEqual(Solution().isPowerOfTwo(8), true)
        XCTAssertEqual(Solution().isPowerOfTwo(10), false)
        XCTAssertEqual(Solution().isPowerOfTwo(16), true)
    }
    
    func testCase2() {
        XCTAssertEqual(Solution().isPowerOfTwo2(2), true)
        XCTAssertEqual(Solution().isPowerOfTwo2(4), true)
        XCTAssertEqual(Solution().isPowerOfTwo2(6), false)
        XCTAssertEqual(Solution().isPowerOfTwo2(8), true)
        XCTAssertEqual(Solution().isPowerOfTwo2(10), false)
        XCTAssertEqual(Solution().isPowerOfTwo2(16), true)
    }
}

TestSolution.defaultTestSuite.run()
