
/*
 
 
 77. Combinations
 Medium

 Topics
 Companies
 Given two integers n and k, return all possible combinations of k numbers chosen from the range [1, n].

 You may return the answer in any order.

  

 Example 1:

 Input: n = 4, k = 2
 Output: [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
 Explanation: There are 4 choose 2 = 6 total combinations.
 Note that combinations are unordered, i.e., [1,2] and [2,1] are considered to be the same combination.
 Example 2:

 Input: n = 1, k = 1
 Output: [[1]]
 Explanation: There is 1 choose 1 = 1 total combination.
  

 Constraints:

 1 <= n <= 20
 1 <= k <= n
 
 */

import XCTest

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        let candidates: [Int] = Array(1...n)
        var result: [[Int]] = []
        var currComb: [Int] = []
        func backtrack(_ index: Int) {
            if currComb.count == k {
                result.append(currComb)
                return
            }
            
            if index >= candidates.count || currComb.count > k {
                return
            }
            
            /// Include
            currComb.append(candidates[index])
            backtrack(index + 1)
            /// Exclude
            currComb.removeLast()
            backtrack(index + 1)
        }
        backtrack(0)
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().combine(4, 2), [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]])
        XCTAssertEqual(Solution().combine(1, 1), [[1]])
    }
}

SolutionTests.defaultTestSuite.run()
