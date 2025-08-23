
/*
 
 1137. N-th Tribonacci Number
 Easy

 Hint
 The Tribonacci sequence Tn is defined as follows:

 T0 = 0,
 T1 = 1,
 T2 = 1,
 Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.

 Given n, return the value of Tn.

 Example 1:

 Input: n = 4
 Output: 4
 Explanation:
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 Example 2:

 Input: n = 25
 Output: 1389537
  

 Constraints:

 0 <= n <= 37
 The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.
 
 */

import XCTest

class Solution {
    func tribonacci1(_ n: Int) -> Int {
        
        func helper(_ n: Int) -> Int {
            if n < 2 { return n }
            if n == 2 { return 1 }
            
            return helper(n - 1) + helper(n - 2)
        }
        
        return helper(n)
    }
    
    func tribonacci2(_ n: Int) -> Int {
        
        var memo = [Int: Int]()
        
        func helper(_ n: Int) -> Int {
            if let result = memo[n] {
                return result
            }
            
            if n < 2 { return n }
            if n == 2 { return 1 }
            
            
            memo[n] = helper(n - 1) + helper(n - 2)
            return memo[n]!
        }
        
        return helper(n)
    }
}

class SolutionTests: XCTestCase {
    func textCase() {
        XCTAssertEqual(Solution().tribonacci1(4), 4)
        XCTAssertEqual(Solution().tribonacci2(4), 4)
    }
}

SolutionTests.defaultTestSuite.run()
