
/*
 
 152. Maximum Product Subarray
 Medium

 Given an integer array nums, find a
 subarray that has the largest product, and return the product.

 
 The test cases are generated so that the answer will fit in a 32-bit integer.

 Example 1:

 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -10 <= nums[i] <= 10
 The product of any subarray of nums is guaranteed to fit in a 32-bit integer.
 
 */

import XCTest

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var maxProd = nums[0]
        var minProd = nums[0]
        var result = nums[0]
        
        for i in 1..<nums.count {
            let tempMax = max(nums[i], maxProd * nums[i], minProd * nums[i])
            let tempMin = min(nums[i], maxProd * nums[i], minProd * nums[i])
            
            maxProd = tempMax
            minProd = tempMin
            
            result = max(result, maxProd)
        }
        
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().maxProduct([2,3,-2,4]), 6)
    }
}

SolutionTests.defaultTestSuite.run()
