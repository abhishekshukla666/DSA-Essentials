
/*
 645. Set Mismatch
 Easy

 Topics
 premium lock icon
 Companies
 You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.

 You are given an integer array nums representing the data status of this set after the error.

 Find the number that occurs twice and the number that is missing and return them in the form of an array.

  

 Example 1:

 Input: nums = [1,2,2,4]
 Output: [2,3]
 Example 2:

 Input: nums = [1,1]
 Output: [1,2]
  

 Constraints:

 2 <= nums.length <= 104
 1 <= nums[i] <= 104
 */

import XCTest

class Solution {
    
    /* Solution 3: Negative Marking (Optimal) */
    func findErrorNums3(_ nums: [Int]) -> [Int] {
        var nums = nums
        var duplicate = 0
        var missing = 0
        
        // Mark visited indicies by negative values
        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1
            if nums[index] < 0 {
                duplicate = abs(nums[i])
            } else {
                nums[index] = -nums[index]
            }
        }
        
        // The index with a positive value is the missing number
        for i in 0..<nums.count {
            if nums[i] > 0 {
                missing = i + 1
            }
        }
        
        return [duplicate, missing]
    }
    
    /* Solution 2: Hash Map Couting */
    func findErrorNums2(_ nums: [Int]) -> [Int] {
        // [1: 1, 2: 2, 4: 1]
        // input: [1, 1], output [1, 2]
        // input: [2, 2], output: [2, 1]
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default: 0] += 1
        }
        var duplicate = 0
        var missing = 0
        
        for key in 1...nums.count {
            let value = dict[key, default: 0]
            if value == 0 {
                missing = key
            } else if value == 2 {
                duplicate = key
            }
        }
        
        return [duplicate, missing]
    }

    /* Solution 1: Sorting */
    func findErrorNums1(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        var duplicate = 0
        var missing = 0
        if nums[0] != 1 {
            missing = 1
        }
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] {
                duplicate = nums[i]
            } else if nums[i] > nums[i - 1] + 1 {
                missing = nums[i - 1] + 1
            }
        }
        if missing == 0 {
            missing = nums.count
        }
        return [duplicate, missing]
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().findErrorNums1([1, 2, 2, 4]), [2, 3])
        XCTAssertEqual(Solution().findErrorNums2([1, 2, 2, 4]), [2, 3])
        XCTAssertEqual(Solution().findErrorNums3([1, 2, 2, 4]), [2, 3])
    }
    func testExample2() {
        XCTAssertEqual(Solution().findErrorNums1([1, 1]), [1, 2])
        XCTAssertEqual(Solution().findErrorNums2([1, 1]), [1, 2])
        XCTAssertEqual(Solution().findErrorNums3([1, 1]), [1, 2])
    }
    func testExample3() {
        XCTAssertEqual(Solution().findErrorNums1([2, 2]), [2, 1])
        XCTAssertEqual(Solution().findErrorNums2([2, 2]), [2, 1])
        XCTAssertEqual(Solution().findErrorNums3([2, 2]), [2, 1])
    }
}

SolutionTests.defaultTestSuite.run()
