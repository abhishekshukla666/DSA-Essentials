
/*
 300. Longest Increasing Subsequence
 Medium

 Given an integer array nums, return the length of the longest strictly increasing
 subsequence.
 
 Example 1:

 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 Example 2:

 Input: nums = [0,1,0,3,2,3]
 Output: 4
 Example 3:

 Input: nums = [7,7,7,7,7,7,7]
 Output: 1
  

 Constraints:

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104
  

 Follow up: Can you come up with an algorithm that runs in O(n log(n)) time complexity?
 
 */
import XCTest

class Solution {
    func lengthOfLIS1(_ nums: [Int]) -> Int {
        
        func helper(_ currIndex: Int, _ prevIndex: Int) -> Int {
            guard currIndex < nums.count else {
                return 0
            }
            
            let exclude = helper(currIndex + 1, prevIndex)
            var include = 0
            if prevIndex < 0 || nums[currIndex] > nums[prevIndex] {
                include = 1 + helper(currIndex + 1, currIndex)
            }
            
            return max(include, exclude)
        }
        
        return helper(0, -1)
    }
    
    func lengthOfLIS2(_ nums: [Int]) -> Int {

        var memo = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
        
        func helper(_ currIndex: Int, _ prevIndex: Int) -> Int {
            guard currIndex < nums.count else {
                return 0
            }
            
            if memo[currIndex][prevIndex + 1] > 0 {
                return memo[currIndex][prevIndex + 1]
            }
            
            let exclude = helper(currIndex + 1, prevIndex)
            var include = 0
            if prevIndex < 0 || nums[currIndex] > nums[prevIndex] {
                include = 1 + helper(currIndex + 1, currIndex)
            }
            
            memo[currIndex][prevIndex + 1] = max(include, exclude)
            
            return memo[currIndex][prevIndex + 1]
        }
        
        return helper(0, -1)
    }
    
    func lengthOfLIS3(_ nums: [Int]) -> Int {
        var memo = Array(repeating: 1, count: nums.count)
        
        for i in 1..<memo.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    memo[i] = max(memo[i], memo[j] + 1)
                }
            }
        }
        return memo.max() ?? 0
    }
    
    func lengthOfLIS4(_ nums: [Int]) -> Int {
        var tails = [Int]() // Stores potential LIS elements
        
        for num in nums {
            var left = 0, right = tails.count
            while left < right {
                let mid = left + (right - left) / 2
                if tails[mid] < num {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            
            if left < tails.count {
                tails[left] = num // Replace element
            } else {
                tails.append(num) // Extend the sequence
            }
        }
        
        return tails.count
        
    }
}

class SolutionTests: XCTestCase {
    func testCase1() {
        let nums = [10, 9, 2, 5, 3, 7, 101, 18]
        XCTAssertEqual(Solution().lengthOfLIS1(nums), 4)
        XCTAssertEqual(Solution().lengthOfLIS2(nums), 4)
        XCTAssertEqual(Solution().lengthOfLIS3(nums), 4)
        XCTAssertEqual(Solution().lengthOfLIS4(nums), 4)
    }
}

SolutionTests.defaultTestSuite.run()
