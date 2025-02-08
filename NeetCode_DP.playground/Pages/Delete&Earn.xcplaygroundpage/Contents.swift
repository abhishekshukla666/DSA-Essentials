
/*
 
 740. Delete and Earn
 Medium

 You are given an integer array nums. You want to maximize the number of points you get by performing the following operation any number of times:

 Pick any nums[i] and delete it to earn nums[i] points. Afterwards, you must delete every element equal to nums[i] - 1 and every element equal to nums[i] + 1.
 Return the maximum number of points you can earn by applying the above operation some number of times.

 Example 1:

 Input: nums = [3,4,2]
 Output: 6
 Explanation: You can perform the following operations:
 - Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
 - Delete 2 to earn 2 points. nums = [].
 You earn a total of 6 points.
 Example 2:

 Input: nums = [2,2,3,3,3,4]
 Output: 9
 Explanation: You can perform the following operations:
 - Delete a 3 to earn 3 points. All 2's and 4's are also deleted. nums = [3,3].
 - Delete a 3 again to earn 3 points. nums = [3].
 - Delete a 3 once more to earn 3 points. nums = [].
 You earn a total of 9 points.
  

 Constraints:

 1 <= nums.length <= 2 * 104
 1 <= nums[i] <= 104
 */

import XCTest
class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        
        let maxNum = nums.max() ?? 0
        var points = [Int](repeating: 0, count: maxNum + 1)
        
        for num in nums {
            points[num] += num
        }
        debugPrint(points)
        var memo = Array(repeating: -1, count: maxNum + 1)
        
        func earn(_ index: Int) -> Int {
            if index == 0 { return 0 }
            if index == 1 { return points[1] }
            
            if memo[index] != -1 { return memo[index] }
            
            var skip = earn(index - 1)
            var keep = points[index] + earn(index - 2)
            
            debugPrint("index: \(index), skip: \(skip), keep: \(keep)")
            let result = max(skip, keep)
            memo[index] = result
            return result
            
        }
        
        return earn(maxNum)
    }
    
    func deleteAndEarn2(_ nums: [Int]) -> Int {
        
        let maxNum = nums.max() ?? 0
        var points = [Int](repeating: 0, count: maxNum + 1)
        for num in nums {
            points[num] += num
        }

        var memo = Array(repeating: -1, count: maxNum + 1)
        memo[0] = 0
        memo[1] = points[1]
        
        for index in 2...maxNum {
            let skip = memo[index - 1]
            let keep = points[index] + memo[index - 2]
            memo[index] = max(skip, keep)
        }
        
        return memo[maxNum]
    }
    
    func deleteAndEarn3(_ nums: [Int]) -> Int {
        
        let maxNum = nums.max() ?? 0
        var points = [Int](repeating: 0, count: maxNum + 1)
        for num in nums {
            points[num] += num
        }
        
        var prev = 0
        var curr = points[1]
        
        for index in 2...maxNum {
            let next = max(curr, prev + points[index])
            prev = curr
            curr = next
        }
        
        return curr
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().deleteAndEarn([1,2,3,4]), 6)
    }
    func testExample1() {
        XCTAssertEqual(Solution().deleteAndEarn([1,2,3,4]), 6)
    }
    func testExample2() {
        XCTAssertEqual(Solution().deleteAndEarn3([1,2,3,4]), 6)
    }
}

SolutionTests.defaultTestSuite.run()
