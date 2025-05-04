
/*
 
 46. Permutations
 Medium

 Topics
 Companies
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 Example 2:

 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 Example 3:

 Input: nums = [1]
 Output: [[1]]
  

 Constraints:

 1 <= nums.length <= 6
 -10 <= nums[i] <= 10
 All the integers of nums are unique.
 */

import XCTest

class Solution {
    func permute1(_ nums: [Int]) -> [[Int]] {

        if nums.isEmpty { return [[]] }
        let permutations = permute(Array(nums.dropFirst()))
        
        var result: [[Int]] = .init()
        for p in permutations {
            for i in 0...p.count {
                var pCopy = p
                pCopy.insert(nums[0], at: i)
                result.append(pCopy)
            }
        }
        
        return result
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        var pick = Array(repeating: false, count: nums.count)
        var permutation: [Int] = []
        
        func backtrack() {
            if permutation.count >= nums.count {
                result.append(permutation)
                print("permutation: \(permutation)")
                print("result: \(result)")
                print("\n")
                return
            }
            
            for i in 0..<nums.count {
                print("i: \(i)")
                if !pick[i] {
                    permutation.append(nums[i])
                    pick[i] = true
                    backtrack()
                    permutation.removeLast()
                    print("after removeLast: \(permutation)")
                    pick[i] = false
                }
            }
        }
        backtrack()
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().permute([1, 2, 3]), [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
//        XCTAssertEqual(Solution().permute([0, 1]), [[0, 1], [1, 0]])
//        XCTAssertEqual(Solution().permute([1]), [[1]])
    }
}

SolutionTests.defaultTestSuite.run()
