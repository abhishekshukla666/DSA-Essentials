
/*
 Bubble Sort
 */


import XCTest

class Solution {
    func bubbleSort(_ nums: inout [Int]) {
        
        for i in 0..<nums.count {
            var isSwapped = false
            for j in 0..<nums.count - 1 - i {
                print(nums[j], nums[j + 1])
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                    isSwapped = true
                }
            }
            if !isSwapped {
                break
            }
        }
    }
}

class SolutionTests: XCTestCase {
    func testSolution() {
        var nums = [3, 5, 4, 1, 2]
        Solution().bubbleSort(&nums)
        XCTAssertEqual(nums, [1, 2, 3, 4, 5])
    }
}

SolutionTests.defaultTestSuite.run()
