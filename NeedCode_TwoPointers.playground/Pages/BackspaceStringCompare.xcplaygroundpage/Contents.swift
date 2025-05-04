
/*
 
 844. Backspace String Compare
 Easy

 Topics
 Companies
 Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

  

 Example 1:

 Input: s = "ab#c", t = "ad#c"
 Output: true
 Explanation: Both s and t become "ac".
 Example 2:

 Input: s = "ab##", t = "c#d#"
 Output: true
 Explanation: Both s and t become "".
 Example 3:

 Input: s = "a#c", t = "b"
 Output: false
 Explanation: s becomes "c" while t becomes "b".
  

 Constraints:

 1 <= s.length, t.length <= 200
 s and t only contain lowercase letters and '#' characters.
  

 Follow up: Can you solve it in O(n) time and O(1) space?
 
 */

import XCTest

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        
        func process(_ str: String) -> String {
            var stack: [Character] = []
            for char in str {
                if char != "#" {
                    stack.append(char)
                } else if !stack.isEmpty {
                    stack.popLast()
                }
            }
            return String(stack)
        }
        
        return process(s) == process(t)
    }
    
    func backspaceCompare_2(_ s: String, _ t: String) -> Bool {
        
        let sArr = Array(s)
        let tArr = Array(t)
        func nextValidCharIndex(_ str: [String], _ index: Int) -> Int {
            
            var index = index
            var backspace = 0
            while index >= 0 {
                
                if backspace == 0 && str[index] != "#" {
                    break
                } else if str[index] == "#" {
                    backspace += 1
                } else {
                    backspace -= 1
                }
                index -= 1
            }
            return index
        }
        
        var sIndex = s.count - 1
        var tIndex = t.count - 1
        
        while sIndex >= 0 || tIndex >= 0 {
            sIndex = nextValidCharIndex(Array(arrayLiteral: s), sIndex)
            tIndex = nextValidCharIndex(Array(arrayLiteral:t), tIndex)
            
            let sChar = sIndex >= 0 ? sArr[sIndex]: Character("")
            let tChar = tIndex >= 0 ? tArr[tIndex]: Character("")
            if sChar != tChar {
                return false
            }
            
            sIndex -= 1
            tIndex -= 1
        }
        
        return true
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
//        XCTAssertEqual(Solution().backspaceCompare("ab#c", "ad#c"), true)
        XCTAssertEqual(Solution().backspaceCompare_2("ab#c", "ad#c"), true)
        XCTAssertEqual(Solution().backspaceCompare_2("ab##", "c#d#"), true)
    }
}

SolutionTests.defaultTestSuite.run()
