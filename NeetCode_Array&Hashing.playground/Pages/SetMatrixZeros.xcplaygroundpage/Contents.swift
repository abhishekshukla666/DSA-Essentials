
/*
 Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.

 You must do it in place.

  

 Example 1:


 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 Example 2:


 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
  

 Constraints:

 m == matrix.length
 n == matrix[0].length
 1 <= m, n <= 200
 -231 <= matrix[i][j] <= 231 - 1
 
 */

import XCTest

class Solution {
    func setZeroes1(_ matrix: inout [[Int]]) {
        
        let rowCount = matrix.count
        let colCount = matrix[0].count
        
        var rows = Array(repeating: 1, count: rowCount)
        var cols = Array(repeating: 1, count: colCount)
        
        for i in 0..<rowCount {
            for j in 0..<colCount {
                if matrix[i][j] == 0 {
                    rows[i] = 0
                    cols[j] = 0
                }
            }
        }
        
        for i in 0..<rowCount {
            for j in 0..<colCount {
                if rows[i] == 0 || cols[j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
    }
    
    func setZeroes2(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix[0].count

        var col = 1
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    if j == 0 {
                        col = 0
                    } else {
                        matrix[0][j] = 0
                    }
                }
            }
        }
        
        print("First Loop: \(matrix)")
        
        for i in 1..<rows {
            for j in 1..<cols {
                if matrix[i][j] != 0 {
                    if matrix[i][0] == 0 || matrix[0][j] == 0 {
                        matrix[i][j] = 0
                    }
                }
            }
        }
        if matrix[0][0] == 0 {
            for j in 0..<cols {
                matrix[0][j] = 0
            }
        }
        
        print("First Loop: \(matrix)")
        if col == 0 {
            for i in 0..<rows {
                matrix[i][0] = 0
            }
        }
    }
}

var matrix = [[1,1,1],
              [1,0,1],
              [1,1,1]]
// Expected Output: [[1,0,1],[0,0,0],[1,0,1]]

var matrix2 = [[1,0,3]]
// Expected: [[0,0,0]]

Solution().setZeroes2(&matrix2)
print(matrix2)
