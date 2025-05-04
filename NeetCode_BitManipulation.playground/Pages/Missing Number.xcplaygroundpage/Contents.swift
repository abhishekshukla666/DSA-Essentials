
/*
 268. Missing Number
 Solved
 Easy

 Topics
 Companies
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

  

 Example 1:

 Input: nums = [3,0,1]

 Output: 2

 Explanation:

 n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.

 Example 2:

 Input: nums = [0,1]

 Output: 2

 Explanation:

 n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.

 Example 3:

 Input: nums = [9,6,4,2,3,5,7,0,1]

 Output: 8

 Explanation:

 n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

  
  
  

  

  

 Constraints:

 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 All the numbers of nums are unique.
  

 Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
 */

import XCTest

class Solution {
    func missingNumber1(_ nums: [Int]) -> Int {
        var missing = nums.count
        for num in 0...missing {
            if !nums.contains(num) {
                return num
            }
        }
        return 0
    }
    func missingNumber2(_ nums: [Int]) -> Int {
        var missing = nums.count
        for (index, num) in nums.enumerated() {
            missing += index - num
        }
        return missing
    }
    
    func missingNumber3(_ nums: [Int]) -> Int {
        var missing = nums.count
        for (index, num) in nums.enumerated() {
            missing ^= index ^ num
        }
        
        return missing
    }
}

class TestSolution: XCTestCase {
    func testCase1() {
        XCTAssertEqual(Solution().missingNumber1([9,6,4,2,3,5,7,0,1]), 8)
        XCTAssertEqual(Solution().missingNumber1([0,3,1]), 2)
    }
    func testCase2() {
        XCTAssertEqual(Solution().missingNumber2([9,6,4,2,3,5,7,0,1]), 8)
        XCTAssertEqual(Solution().missingNumber2([0,3,1]), 2)
    }
    func testCase3() {
        XCTAssertEqual(Solution().missingNumber3([9,6,4,2,3,5,7,0,1]), 8)
        XCTAssertEqual(Solution().missingNumber3([0,3,1]), 2)
    }
}

TestSolution.defaultTestSuite.run()
