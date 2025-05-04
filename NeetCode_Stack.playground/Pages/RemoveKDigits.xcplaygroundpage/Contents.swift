
/*
 
 402. Remove K Digits
 Medium

 Topics
 Companies
 Given string num representing a non-negative integer num, and an integer k, return the smallest possible integer after removing k digits from num.

  

 Example 1:

 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 Example 2:

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 Example 3:

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
  

 Constraints:

 1 <= k <= num.length <= 105
 num consists of only digits.
 num does not have any leading zeros except for the zero itself.
 
 */

import XCTest

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let nums = Array(num).compactMap { Int(String($0)) }
        var k = k
        var stack: [Int] = .init()
        
        var index = 0
        while k > 0 && index < nums.count {
            
            while !stack.isEmpty && stack.last! > nums[index] && k > 0 {
                stack.removeLast()
                k -= 1
            }
            stack.append(nums[index])
            index += 1
        }
        
        while k > 0 {
            stack.removeLast()
            k -= 1
        }
        
        for num in nums[index...] {
            stack.append(num)
        }
        
        while stack.first == 0 {
            stack.removeFirst()
        }
        
        
        
        print("Stack: \(stack) \n")
        return stack.isEmpty ? "0" : stack.map { String($0) }.joined()
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().removeKdigits("1432219", 3), "1219")
        XCTAssertEqual(Solution().removeKdigits("10200", 1), "200")
        XCTAssertEqual(Solution().removeKdigits( "10", 2), "0")
        XCTAssertEqual(Solution().removeKdigits( "9", 1), "0")
    }
}

SolutionTests.defaultTestSuite.run()
