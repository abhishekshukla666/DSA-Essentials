
/*
 2109. Adding Spaces to a String
 Medium

 Topics
 Companies

 Hint
 You are given a 0-indexed string s and a 0-indexed integer array spaces that describes the indices in the original string where spaces will be added. Each space should be inserted before the character at the given index.

 For example, given s = "EnjoyYourCoffee" and spaces = [5, 9], we place spaces before 'Y' and 'C', which are at indices 5 and 9 respectively. Thus, we obtain "Enjoy Your Coffee".
 Return the modified string after the spaces have been added.

  

 Example 1:

 Input: s = "LeetcodeHelpsMeLearn", spaces = [8,13,15]
 Output: "Leetcode Helps Me Learn"
 Explanation:
 The indices 8, 13, and 15 correspond to the underlined characters in "LeetcodeHelpsMeLearn".
 We then place spaces before those characters.
 Example 2:

 Input: s = "icodeinpython", spaces = [1,5,7,9]
 Output: "i code in py thon"
 Explanation:
 The indices 1, 5, 7, and 9 correspond to the underlined characters in "icodeinpython".
 We then place spaces before those characters.
 Example 3:

 Input: s = "spacing", spaces = [0,1,2,3,4,5,6]
 Output: " s p a c i n g"
 Explanation:
 We are also able to place spaces before the first character of the string.
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists only of lowercase and uppercase English letters.
 1 <= spaces.length <= 3 * 105
 0 <= spaces[i] <= s.length - 1
 All the values of spaces are strictly increasing.
 */

import XCTest

class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var s = Array(s)
        
        var result = [Character]()
        for space in spaces {
            result.append(contentsOf: s[..<space])
            result.append(" ")
        }
//        result.append(contentsOf: s[spaces.last!...])
//        s = result
        
        print(result)
        return String(result)
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().addSpaces("LeetcodeHelpsMeLearn", [8,13,15]), "Leetcode Helps Me Learn")
        XCTAssertEqual(Solution().addSpaces("icodeinpython", [1,5,7,9]), "i code in py thon")
        XCTAssertEqual(Solution().addSpaces("spacing", [0,1,2,3,4,5,6]), " s p a c i n g")
    }
}

SolutionTests.defaultTestSuite.run()
