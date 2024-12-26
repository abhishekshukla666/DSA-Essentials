
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
    func numDecodings_TopDown_Recursive(_ s: String) -> Int {
        guard s.count > 1 else { return s == "0" ? 0 : 1}
        var dp = [Int: Int]()
        dp[s.count] = 1
        var s = Array(s)

        func dfs(_ i: Int) -> Int{
            if let item = dp[i]{
                return item
            }
            if s[i] == "0"{
                return 0
            }

            var res = dfs(i + 1)
            var limit = "0123456"
            if (i + 1 < s.count) &&
               (s[i] == "1" || (s[i] == "2" && limit.contains(s[i + 1]))){
                res += dfs(i + 2)
               }
            dp[i, default: 0] = res
            return res
        }
        return dfs(0)
    }
    
    func numDecodings_BottomUp_Loop(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else { return s == "0" ? 0: 1 }
        let s = Array(s)
        let limit = "0123456"
        var dp = Array(repeating: 0, count: n + 1)
        dp[n] = 1
        for i in stride(from: n - 1, to: -1, by: -1) {
            if s[i] == "0" {
                dp[i] = 0
            } else {
                dp[i] = dp[i + 1]
                if (i + 1 < n) {
                    if s[i] == "1" || (s[i] == "2" && limit.contains(s[i + 1])) {
                        dp[i] += dp[i + 2]
                    }
                }
            }
        }
        
        return dp[0]
    }
}

class SolutionTests: XCTestCase {
    var s = Solution()
//    func testExample() {
//        XCTAssertEqual(s.numDecodings_TopDown_Recursive("12"), 2)
//        XCTAssertEqual(s.numDecodings_TopDown_Recursive("06"), 0)
//        XCTAssertEqual(s.numDecodings_TopDown_Recursive("226"), 3)
//        XCTAssertEqual(s.numDecodings_TopDown_Recursive("111111111111111111111111111111111111111111111"), 1836311903)
//    }
    
    func testExample() {
        XCTAssertEqual(s.numDecodings_BottomUp_Loop("12"), 2)
        XCTAssertEqual(s.numDecodings_BottomUp_Loop("06"), 0)
        XCTAssertEqual(s.numDecodings_BottomUp_Loop("226"), 3)
        XCTAssertEqual(s.numDecodings_BottomUp_Loop("111111111111111111111111111111111111111111111"), 1836311903)
    }
}

SolutionTests.defaultTestSuite.run()
