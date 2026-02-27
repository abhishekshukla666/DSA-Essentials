
/*
 394. Decode String
 Solved
 Medium

 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].

 The test cases are generated so that the length of the output will never exceed 105.

 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
  

 Constraints:

 1 <= s.length <= 30
 s consists of lowercase English letters, digits, and square brackets '[]'.
 s is guaranteed to be a valid input.
 All the integers in s are in the range [1, 300].
 */


import XCTest

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits
        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}

class Solution {
    
    func decodeString(_ s: String) -> String {
        var stack = [String]()
        var result = ""
        for ch in s {
            if ch != "]" {
                stack.append(String(ch))
            } else {
                var subS = ""
                while stack.count > 0 && stack.last! != "[" {
                    subS = String(stack.popLast()!) + subS
                }
                stack.popLast()!
                print(subS, stack)
                var multiplier = ""
                while stack.count > 0 && stack.last!.isNumber {
                    multiplier = String(stack.popLast()!) + multiplier
                }
                
                print(multiplier)
                for _ in 0..<(Int(multiplier) ?? 0) {
                    stack.append(subS)
                }
                
            }
        }
        return "" + stack.joined()
    }
    
}


class SolutionTests: XCTestCase {
    func testSolution() {
        XCTAssertEqual(Solution().decodeString("3[abc]4[ab]c"), "abcabcabcababababc")
        XCTAssertEqual(Solution().decodeString("10[a]"), "aaaaaaaaaa")
        XCTAssertEqual(Solution().decodeString("2[3[a]b]"), "aaabaaab")
    }
}

SolutionTests.defaultTestSuite.run()
