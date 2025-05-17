
/*
 
 
 131. Palindrome Partitioning
 Medium

 Topics
 Companies
 Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

  

 Example 1:

 Input: s = "aab"
 Output: [["a","a","b"],["aa","b"]]
 Example 2:

 Input: s = "a"
 Output: [["a"]]
  

 Constraints:

 1 <= s.length <= 16
 s contains only lowercase English letters.
 
 */

import XCTest

class Solution {
    func partition1(_ s: String) -> [[String]] {
        var res = [[String]]()
        var part = [String]()
        let sArray = Array(s)

        func dfs(_ i: Int, _ j: Int) {
            if j >= sArray.count {
                if i == j {
                    res.append(part)
                }
                return
            }

            if isPali(sArray, i, j) {
                part.append(String(sArray[i...j]))
                dfs(j + 1, j + 1)
                part.removeLast()
            }

            dfs(i, j + 1)
        }

        func isPali(_ s: [Character], _ l: Int, _ r: Int) -> Bool {
            var l = l, r = r
            while l < r {
                if s[l] != s[r] {
                    return false
                }
                l += 1
                r -= 1
            }
            return true
        }

        dfs(0, 0)
        return res
    }
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var part = [String]()
        let arrayString = Array(s)
        
        func backtrack(_ index: Int) {
            if index >= s.count {
                result.append(part)
                return
            }
            
            for j in index..<s.count {
                if isPalindrome(s, index, j) {
                    part.append(String(arrayString[index...j]))
                    backtrack(j + 1)
                    part.removeLast()
                }
            }
        }
        
        func isPalindrome(_ s: String, _ l: Int, _ r: Int) -> Bool {
            var left = l
            var right = r
            
            while left < right {
                if s[s.index(s.startIndex, offsetBy: left)] != s[s.index(s.startIndex, offsetBy: right)] {
                    return false
                }
                left += 1
                right -= 1
            }
            return true
        }
        backtrack(0)
        
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().partition1("aab"), [["a","a","b"],["aa","b"]])
        XCTAssertEqual(Solution().partition1("a"), [["a"]])
    }
}

SolutionTests.defaultTestSuite.run()
