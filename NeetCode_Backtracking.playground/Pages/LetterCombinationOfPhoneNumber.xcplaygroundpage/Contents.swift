
/*
 
 17. Letter Combinations of a Phone Number
 Medium

 Topics
 Companies
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

 A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.


  

 Example 1:

 Input: digits = "23"
 Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
 Example 2:

 Input: digits = ""
 Output: []
 Example 3:

 Input: digits = "2"
 Output: ["a","b","c"]
  

 Constraints:

 0 <= digits.length <= 4
 digits[i] is a digit in the range ['2', '9'].
 */

import XCTest

class Solution {
    
    let phoneMap : [Character : String] = [
        "2" : "abc",
        "3" : "def",
        "4" : "ghi",
        "5" : "jkl",
        "6" : "mno",
        "7" : "pqrs",
        "8" : "tuv",
        "9" : "wxyz"
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        let digits = Array(digits)
        guard digits.count > 0 else {
            return []
        }
        var result : [String] = []
        
        func backtrack(_ index: Int, _ currStr: String) {
            guard currStr.count < digits.count else {
                result.append(currStr)
                return
            }
            for ch in phoneMap[digits[index]] ?? "" {
                print("Index: \(index), Current String: \(currStr)")
                backtrack(index + 1, currStr + String(ch))
            }
        }
        backtrack(0, "")
        print("result: \(result)")
        return result
    }
    
    func letterCombinations2(_ digits: String) -> [String] {
        let digits = Array(digits)
        
        var combinations: [String] = .init()
        
        
        func backtrack(_ index: Int, _ currLetter: String) {
            guard index < digits.count else {
                combinations.append(currLetter)
                return
            }
            
            for ch in phoneMap[digits[index]] ?? "" {
                backtrack(index + 1, currLetter + String(ch))
            }
        }
        backtrack(0, "")
        return combinations
    }
}

class SolutionTests: XCTestCase {
//    func testExample() {
//        XCTAssertEqual(Solution().letterCombinations("23"), ["ad","ae","af","bd","be","bf","cd","ce","cf"])
//        XCTAssertEqual(Solution().letterCombinations(""), [])
//        XCTAssertEqual(Solution().letterCombinations("2"), ["a","b","c"])
//    }
    
    func testExample2() {
        XCTAssertEqual(Solution().letterCombinations2("23"), ["ad","ae","af","bd","be","bf","cd","ce","cf"])
//        XCTAssertEqual(Solution().letterCombinations(""), [])
//        XCTAssertEqual(Solution().letterCombinations("2"), ["a","b","c"])
    }
}

SolutionTests.defaultTestSuite.run()
