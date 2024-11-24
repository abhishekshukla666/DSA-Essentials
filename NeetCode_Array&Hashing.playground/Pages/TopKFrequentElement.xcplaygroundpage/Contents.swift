
/*
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

  

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
  

 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 k is in the range [1, the number of unique elements in the array].
 It is guaranteed that the answer is unique.
  

 Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 */


import XCTest
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in nums {
            dict[n, default: 0] += 1
        }
        
        var array2D = Array(repeating: [Int](), count: nums.count + 1)
        for (key, value) in dict {
            array2D[value].append(key)
        }
        
        var result = [Int]()
        for i in stride(from: array2D.count - 1, to: 0, by: -1) {
            for n in array2D[i] {
                result.append(n)
                if result.count == k {
                    return result
                }
            }
        }
        
        return result
    }
}


class SolutionTest: XCTestCase {
    
    var s = Solution()
    
    func test() {
        XCTAssertEqual(s.topKFrequent([1,1,1,2,2,3], 2), [1,2])
        XCTAssertEqual(s.topKFrequent([1,2], 2), [1,2])
        XCTAssertEqual(s.topKFrequent([1], 1), [1])
    }
}

SolutionTest.defaultTestSuite.run()
