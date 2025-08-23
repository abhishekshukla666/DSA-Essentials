
/*
 You have intercepted a secret message encoded as a string of numbers. The message is decoded via the following mapping:

 "1" -> 'A'

 "2" -> 'B'

 ...

 "25" -> 'Y'

 "26" -> 'Z'

 However, while decoding the message, you realize that there are many different ways you can decode the message because some codes are contained in other codes ("2" and "5" vs "25").

 For example, "11106" can be decoded into:

 "AAJF" with the grouping (1, 1, 10, 6)
 "KJF" with the grouping (11, 10, 6)
 The grouping (1, 11, 06) is invalid because "06" is not a valid code (only "6" is valid).
 Note: there may be strings that are impossible to decode.

 Given a string s containing only digits, return the number of ways to decode it. If the entire string cannot be decoded in any valid way, return 0.

 The test cases are generated so that the answer fits in a 32-bit integer.

  

 Example 1:

 Input: s = "12"

 Output: 2

 Explanation:

 "12" could be decoded as "AB" (1 2) or "L" (12).

 Example 2:

 Input: s = "226"

 Output: 3

 Explanation:

 "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).

 Example 3:

 Input: s = "06"

 Output: 0

 Explanation:

 "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06"). In this case, the string is not a valid encoding, so return 0.

  

 Constraints:

 1 <= s.length <= 100
 s contains only digits and may contain leading zero(s).
 */

import XCTest

class Solution {
    func numDecodings1(_ s: String) -> Int {
        let s = Array(s)
        func dfs(_ index: Int) -> Int {
            if index >= s.count { return 1 }
            guard s[index] != "0" else { return 0 }
            var currWays = dfs(index + 1)
            if index + 1 < s.count {
                let twoDigit = Int(String(s[index...index + 1]))!
                if twoDigit <= 26 {
                    currWays += dfs(index + 2)
                }
            }
//            print("for index: \(index) currWays: \(currWays)")
            
            return currWays
        }
        return dfs(0)
    }
    
    func numDecodings2(_ s: String) -> Int {
        let s = Array(s)
        var memo = Array(repeating: -1, count: s.count + 1)
        
        func dfs(_ index: Int) -> Int {
            if memo[index] != -1 { return memo[index] }
            if index >= s.count { return 1 }
            if s[index] == "0" { return 0 }
            
            var currWays = dfs(index + 1)
            if index + 1 < s.count {
                let twoDigit = Int(String(s[index...index + 1]))!
                if twoDigit <= 26 {
                    currWays += dfs(index + 2)
                }
            }
            
            memo[index] = currWays
            return memo[index]
        }
        
        return dfs(0)
    }
    
    func numDecodings3(_ s: String) -> Int {
        
        guard s.count > 0 else { return 0 }
        let s = Array(s)
        if s[0] == "0" { return 0 }
        
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        dp[1] = s[1] == "0" ? 0 : 1
        
        for i in 2...s.count {
            let oneDigit = Int(String(s[i - 1]))!
            let twoDigit = Int(String(s[i - 2...i - 1]))!
            
            if oneDigit > 0 {
                dp[i] += dp[i - 1]
            }
            if twoDigit >= 10 && twoDigit <= 26 {
                dp[i] += dp[i - 2]
            }
        }
        
        return dp[s.count]
    }
    
    func numDecodings4(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let s = Array(s)
        if s[0] == "0" { return 0 }
        
        var prev1 = 1
        var prev2 = 1
        
        for i in 1..<s.count {
            var curr = 0
            let oneDigit = Int(String(s[i]))!
            let twoDigit = Int(String(s[i - 1...i]))!
            
            if oneDigit > 0 {
                curr += prev1
            }
            if twoDigit >= 10 && twoDigit <= 26 {
                curr += prev2
            }
            (prev2, prev1) = (prev1, curr)
        }
        
        return prev1
    }
}

class SolutionTests: XCTestCase {
    
    func testExample1() {
        XCTAssertEqual(Solution().numDecodings1("12"), 2)
        XCTAssertEqual(Solution().numDecodings1("06"), 0)
        XCTAssertEqual(Solution().numDecodings1("226"), 3)
        XCTAssertEqual(Solution().numDecodings1("10"), 1)
        XCTAssertEqual(Solution().numDecodings2("1"), 1)
    }
    
    func testExample2() {
        XCTAssertEqual(Solution().numDecodings2("12"), 2)
        XCTAssertEqual(Solution().numDecodings2("06"), 0)
        XCTAssertEqual(Solution().numDecodings2("226"), 3)
        XCTAssertEqual(Solution().numDecodings2("10"), 1)
        XCTAssertEqual(Solution().numDecodings2("1"), 1)
    }
    func testExample3() {
        XCTAssertEqual(Solution().numDecodings3("12"), 2)
        XCTAssertEqual(Solution().numDecodings3("06"), 0)
        XCTAssertEqual(Solution().numDecodings3("226"), 3)
        XCTAssertEqual(Solution().numDecodings3("10"), 1)
        XCTAssertEqual(Solution().numDecodings2("1"), 1)
    }
    func testExample4() {
        XCTAssertEqual(Solution().numDecodings4("12"), 2)
        XCTAssertEqual(Solution().numDecodings4("06"), 0)
        XCTAssertEqual(Solution().numDecodings4("226"), 3)
        XCTAssertEqual(Solution().numDecodings4("10"), 1)
        XCTAssertEqual(Solution().numDecodings2("1"), 1)
    }
}

SolutionTests.defaultTestSuite.run()
