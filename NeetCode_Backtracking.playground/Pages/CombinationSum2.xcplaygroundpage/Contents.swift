
/*
 
 40. Combination Sum II
 Medium

 Topics
 Companies
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

 Each number in candidates may only be used once in the combination.

 Note: The solution set must not contain duplicate combinations.

  

 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8
 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5
 Output:
 [
 [1,2,2],
 [5]
 ]
  

 Constraints:

 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

import XCTest

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var result: [[Int]] = .init()
        var currNum: [Int] = .init()
        func backtrack(_ index: Int, _ currSum: Int, _ currNum: inout [Int]) {
            if currSum == target {
                result.append(currNum)
                return
            }
            
            if index >= candidates.count || currSum > target { return }
            
            /// Include num at current index
            currNum.append(candidates[index])
            backtrack(index + 1, currSum + candidates[index], &currNum)
            /// Exclude num at current index
            currNum.removeLast()
            /// Remove duplicates entries
            var j = index
            while j + 1 < candidates.count && candidates[j] == candidates[j + 1] {
                j += 1
            }
            backtrack(j + 1, currSum, &currNum)
            
        }
        backtrack(0, 0, &currNum)
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().combinationSum2([10,1,2,7,6,1,5], 8), [[1,1,6],[1,2,5],[1,7],[2,6]])
        XCTAssertEqual(Solution().combinationSum2([2,5,2,1,2], 5), [[1,2,2],[5]])
    }
}

SolutionTests.defaultTestSuite.run()
