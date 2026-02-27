
/*
 You're given a sorted array of unique integers nums and a range defined by [lower, upper]. Your task is to find all the missing numbers in this range that are not present in nums, and represent them as a list of ranges.

 The problem asks you to identify which numbers between lower and upper (inclusive) are missing from the array nums. Instead of listing each missing number individually, you need to group consecutive missing numbers into ranges represented as [start, end].

 For example:

 If nums = [0, 1, 3, 50, 75] and the range is [0, 99]
 Missing numbers are: 2, 4-49, 51-74, 76-99
 The output would be: [[2, 2], [4, 49], [51, 74], [76, 99]]
 */

import XCTest

class Solution {
    func missingRange(_ nums: [Int], _ range: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [range] }
        var missingRange = [[Int]]()
        
        let lower = range[0]
        let upper = range[1]
        
        if nums[0] > lower {
            missingRange.append([lower, nums[0] - 1])
        }
        var i = 1
        while i < nums.count {
            let diff = nums[i] - nums[i - 1]
            if diff > 1 {
                missingRange.append([nums[i - 1] + 1, nums[i] - 1])
            }
            i += 1
        }
        if nums[i - 1] < upper {
            missingRange.append([nums[i - 1] + 1, upper])
        }
        
        debugPrint(missingRange)
        return missingRange
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().missingRange([0, 1, 3, 50, 75], [0, 99]), [[2, 2], [4, 49], [51, 74], [76, 99]])
    }
    
    func testExample2() {
        XCTAssertEqual(Solution().missingRange([3, 50, 75], [0, 99]), [[0, 2], [4, 49], [51, 74], [76, 99]])
    }
}

SolutionTests.defaultTestSuite.run()
