
/*
 
 6. Zigzag Conversion
 Medium

 Topics
 premium lock icon
 Companies
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);
  

 Example 1:

 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:

 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 Example 3:

 Input: s = "A", numRows = 1
 Output: "A"
  

 Constraints:

 1 <= s.length <= 1000
 s consists of English letters (lower-case and upper-case), ',' and '.'.
 1 <= numRows <= 1000
 */

import XCTest

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 && numRows <= s.count else { return s }
        var matrix = Array(repeating: Array(repeating: "",
                                            count: s.count - 1),
                           count: numRows)
        var row = 0
        var col = 0
        var isGoingDown = true

        for ch in s {
            matrix[row][col] = String(ch)
            if isGoingDown {
                if row == numRows - 1 {
                    isGoingDown = false
                    col += 1
                    row -= 1
                } else {
                    row += 1
                }
            } else {
                if row == 0 {
                    row += 1
                    isGoingDown = true
                } else {
                    col += 1
                    row -= 1
                }
            }
        }
        var result = ""
        for r in 0..<numRows {
            for c in 0..<s.count - 1 {
                if matrix[r][c] != "" {
                    result.append(String(matrix[r][c]))
                }
            }
        }
        return result
    }
    
    func convert2(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 && numRows < s.count else { return s }
        
        var matrix = Array(repeating: "", count: numRows)
        var row = 0
        var down = false
        
        for ch in s {
            matrix[row].append(ch)
            if row == 0 || row == numRows - 1 {
                down.toggle()
            }
            row += down ? 1: -1
        }
        print(matrix)
        return matrix.joined()
    }
}

class TestSolution: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
    }
    func test2() {
        XCTAssertEqual(Solution().convert2("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
    }
}

TestSolution.defaultTestSuite.run()
