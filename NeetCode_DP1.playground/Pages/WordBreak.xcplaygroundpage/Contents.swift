/*
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:

 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false
 */

import XCTest

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var memo = Set<String>()
        
        func helper(_ s: String) -> Bool {
            if s.isEmpty { return true }
            if memo.contains(s) { return false }
            
            let word = wordDict
        }
    }
    
    func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
    
        var memo = Set<String>()
        func helper(_ s: String) -> Bool {
            if memo.contains(s) { return false }
            if s.isEmpty { return true }
            
            for word in wordDict {
                print("s:\(s),", "\t", "word: \(word)")
                if s.hasPrefix(word) {
                    if wordBreak(String(s.dropFirst(word.count)), wordDict) { return true }
                }
            }
            
            memo.insert(s)
            print("Memo: \(memo)")
            return false
        }
        return helper(s)
    }
}

class SolutionTests: XCTestCase {
    var s = Solution()
    func testWordBreak1() {
//        XCTAssertTrue(s.wordBreak("leetcode", ["leet", "code"]))
    }
    func testWordBreak2() {
//        XCTAssertTrue(s.wordBreak("applepenapple", ["apple","pen"]))
    }
    func testWordBreak3() {
        XCTAssertFalse(s.wordBreak("catsandog", ["cats","dog","sand","and","cat"]))
    }
}

SolutionTests.defaultTestSuite.run()

//s.wordBreak("leetcode", ["neet", "code", "leet"])
//s.wordBreak("catsandog", ["cats","dog","sand","and","cat"])

//let s = "abcdefgh"
//s.hasPrefix("abc")
