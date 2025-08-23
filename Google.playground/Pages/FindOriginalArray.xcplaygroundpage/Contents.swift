
/*
 
 2007. Find Original Array From Doubled Array
 Medium

 Topics
 premium lock icon
 Companies

 Hint
 An integer array original is transformed into a doubled array changed by appending twice the value of every element in original, and then randomly shuffling the resulting array.

 Given an array changed, return original if changed is a doubled array. If changed is not a doubled array, return an empty array. The elements in original may be returned in any order.

  

 Example 1:

 Input: changed = [1,3,4,2,6,8]
 Output: [1,3,4]
 Explanation: One possible original array could be [1,3,4]:
 - Twice the value of 1 is 1 * 2 = 2.
 - Twice the value of 3 is 3 * 2 = 6.
 - Twice the value of 4 is 4 * 2 = 8.
 Other original arrays could be [4,3,1] or [3,1,4].
 Example 2:

 Input: changed = [6,3,0,1]
 Output: []
 Explanation: changed is not a doubled array.
 Example 3:

 Input: changed = [1]
 Output: []
 Explanation: changed is not a doubled array.
  

 Constraints:

 1 <= changed.length <= 105
 0 <= changed[i] <= 105
 */

import XCTest

class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        
        guard changed.count % 2 == 0 else { return [] }
        
        var freq = [Int: Int]()
        for num in changed {
            freq[num, default: 0] += 1
        }
        
        let changed = changed.sorted()
        var original = [Int]()
        
        for num in changed {
            if freq[num, default: 0] == 0 { continue }
            if freq[num * 2, default: 0] == 0 { return [] }
            
            original.append(num)
            freq[num, default: 0] -= 1
            freq[2 * num, default: 0] -= 1
        }
        
        return original
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().findOriginalArray([1,3,4,2,6,8]), [1,3,4])
        XCTAssertEqual(Solution().findOriginalArray([6,3,0,1]), [])
        XCTAssertEqual(Solution().findOriginalArray([1]), [])
        XCTAssertEqual(Solution().findOriginalArray([100000,1,2,100000]), [])
        XCTAssertEqual(Solution().findOriginalArray([1,2,3,2,4,6,2,4,6,4,8,12]), [1,2,2,3,4,6])
        
    }
}

SolutionTests.defaultTestSuite.run()
