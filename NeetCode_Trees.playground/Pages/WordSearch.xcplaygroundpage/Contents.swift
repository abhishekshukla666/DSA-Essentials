
/*
 
 79. Word Search
 Medium
 
 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example 1:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 
 Example 2:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true

 Example 3:
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false
  
 Constraints:
 m == board.length
 n = board[i].length
 1 <= m, n <= 6
 1 <= word.length <= 15
 board and word consists of only lowercase and uppercase English letters.
  
 Follow up: Could you use search pruning to make your solution faster with a larger board?
 */

import XCTest

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        return true
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), true)
    }
}

SolutionTests.defaultTestSuite.run()
    
