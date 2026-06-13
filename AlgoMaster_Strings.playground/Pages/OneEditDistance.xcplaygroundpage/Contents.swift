
/*
 Problem Description

 This problem asks you to determine if two strings are exactly one edit distance apart. Two strings are considered one edit distance apart if you can transform one string into the other by performing exactly one of these operations:

 Insert one character: Add exactly one character at any position in string s to make it equal to string t. For example, "ab" → "adb" (insert 'd').

 Delete one character: Remove exactly one character from string s to make it equal to string t. For example, "abc" → "ac" (delete 'b').

 Replace one character: Change exactly one character in string s to a different character to make it equal to string t. For example, "abc" → "adc" (replace 'b' with 'd').

 The key requirements are:

 Exactly one edit operation must be performed (not zero, not more than one)
 For replacement, the character must be changed to a different character (not the same)
 Return true if the strings are one edit distance apart, false otherwise
 Examples of strings that are one edit distance apart:

 "ab" and "acb" (insert 'c')
 "cab" and "ab" (delete 'c')
 "1203" and "1213" (replace '0' with '1')
 Examples of strings that are NOT one edit distance apart:

 "ab" and "ab" (zero edits needed - they're already equal)
 "ab" and "adb" (this would be one edit, so it IS one edit distance apart)
 "ab" and "adcb" (requires two insertions)
 */

import XCTest

extension String {
    subscript (_ index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}

class Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        guard abs(s.count - t.count) <= 1 else { return false }
        
        if s.count == t.count {
            var counter = 1
            for i in 0..<s.count {
                if s[i] != t[i] {
                    counter -= 1
                }
            }
            return counter == 0
        } else if s.count + 1 == t.count {
            for i in 0..<t.count {
                if i == s.count { return true }
                if s[i] != t[i] {
                    return s.suffix(s.count - i) == t.suffix(t.count - i - 1)
                }
            }
        } else if s.count == t.count + 1 {
            for i in 0..<s.count {
                print(s.suffix(s.count - i), t.suffix(t.count - i))
                if i == t.count { return true }
                if s[i] != t[i] {
                    return s.suffix(s.count - i - 1) == t.suffix(t.count - i)
                }
            }
        }
        
        return false
    }
}

class SolutionTests: XCTestCase {
    func testExample1() {
        XCTAssertEqual(Solution().isOneEditDistance("ab", "abd"), true)
    }
    func testExample2() {
        XCTAssertEqual(Solution().isOneEditDistance("abc", "abc"), false)
    }
    func testExample3() {
        XCTAssertEqual(Solution().isOneEditDistance("", ""), false)
    }
    func testExample4() {
        XCTAssertEqual(Solution().isOneEditDistance("abc", "ab"), true)
    }
    func testExample5() {
        XCTAssertEqual(Solution().isOneEditDistance("a", "abdef"), false)
    }
}

SolutionTests.defaultTestSuite.run()

