
/*
 79. Word Search
 Medium

 Topics
 Companies
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
    func exist_Brute(_ board: [[Character]], _ word: String) -> Bool {
        
        let rows = board.count
        let cols = board[0].count
        let words = Array(word)
        var path = Set<[Int]>()
        
        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i >= word.count {
                return true
            }
            
            if r < 0 || c < 0 || r >= rows || c >= cols || path.contains([r, c]) || board[r][c] != words[i] {
                return false
            }
            
            path.insert([r, c])
            let res = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) || dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)
            
            path.remove([r, c])
            return res
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        let rows = board.count
        let cols = board[0].count
        let words = Array(word)
        var board = board
        
        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i >= word.count {
                return true
            }
            
            if r < 0 || c < 0 ||
                r >= rows || c >= cols ||
                board[r][c] != words[i] ||
                board[r][c] == "#" {
                return false
            }
            
            let temp = board[r][c]
            board[r][c] = "#"
            
            let res = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) || dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)
            
            board[r][c] = temp
            return res
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), true)
        XCTAssertEqual(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"), true)
        XCTAssertEqual(Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"), false)
    }
}

SolutionTests.defaultTestSuite.run()
