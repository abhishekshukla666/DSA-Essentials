
/*
 204. Count Primes
 Medium

 Given an integer n, return the number of prime numbers that are strictly less than n.

 Example 1:
 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 
 Example 2:
 Input: n = 0
 Output: 0

 Example 3:
 Input: n = 1
 Output: 0
 
 Constraints:
 0 <= n <= 5 * 106
 
 */

import XCTest

class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var primes = Array(repeating: true, count: n)
        primes[0] = false
        primes[1] = false
        
        var i = 2
        while (i * i) < primes.count {
            if primes[i] {
                var j = i * i
                while j < primes.count {
                    primes[j] = false
                    j += i
                }
            }
            i += 1
        }
        debugPrint(primes)
        return primes.filter { $0 == true }.count
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.countPrimes(10), 4)
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
}

SolutionTests.defaultTestSuite.run()
