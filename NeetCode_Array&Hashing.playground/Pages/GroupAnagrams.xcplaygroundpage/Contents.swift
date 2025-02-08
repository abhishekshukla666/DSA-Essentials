
/*
 
 49. Group Anagrams
 Medium
 
 Given an array of strings strs, group the
 anagrams together. You can return the answer in any order.

 Example 1:
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:
 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 
 Example 2:
 Input: strs = [""]
 Output: [[""]]
 
 Example 3:
 Input: strs = ["a"]
 Output: [["a"]]

 Constraints:
 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 
 */

import XCTest

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var result: [String: [String]] = .init()
        
        for str in strs {
            let key = keyFor(str: str)
            result[key, default: []].append(str)
        }
        
        debugPrint(result.values)
        return Array(result.values)
    }
    
    func keyFor(str s: String) -> String {
        var key = Array(repeating: 0, count: 26)
        let charA = Character("a").asciiValue!
        for ch in s {
            key[Int(ch.asciiValue! - charA)] += 1
        }
        let keys = key.map { String($0) }
        return keys.joined(separator: ",")
    }
}
class SolutionTests: XCTestCase {
    func testExample() {
        let s = Solution()
        XCTAssertEqual(s.groupAnagrams(["eat","tea","tan","ate","nat","bat"]), [["bat"],["nat","tan"],["ate","eat","tea"]])
    }
}
SolutionTests.defaultTestSuite.run()
                                                                                
                                                                            


                                                                                
