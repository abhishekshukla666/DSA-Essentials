
/*

 1329. Sort the Matrix Diagonally
 Medium
 A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].

 Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

 Example 1:
 Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
 Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]
 
 Example 2:
 Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
 Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]
  
 Constraints:
 m == mat.length
 n == mat[i].length
 1 <= m, n <= 100
 1 <= mat[i][j] <= 100
 
 */

import XCTest

class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        
        let m = mat.count
        let n = mat[0].count
        var mat = mat
        /// row = 0
        for col in 0..<n {
            sort(&mat, 0, col, m, n)
        }

        /// for col = 0
        for row in 1..<m {
            sort(&mat, row, 0, m, n)
        }
        
        return mat
    }
    
    func sort(_ mat: inout [[Int]], _ row: Int, _ col: Int, _ m: Int, _ n: Int) {
//        var values: [Int] = .init()
        var values = Array(repeating: 0, count: 101)
        var r = row
        var c = col

        while r < m && c < n {
//            values.append(mat[r][c])
            values[mat[r][c]] += 1
            r += 1
            c += 1
        }

//        values.sort()
        
        print(values)
        r = row
        c = col
        for i in 1..<101 {
            if values[i] > 0 {
                var count = values[i]
                while count > 0 {
                    mat[r][c] = i
                    r += 1
                    c += 1
                    count -= 1
                }
            }
        }
//        while r < m && c < n {
//            mat[r][c] = values.removeFirst()
//            r += 1
//            c += 1
//        }
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        let solution = Solution()
        XCTAssertEqual(solution.diagonalSort([[3,3,1,1],
                                              [2,2,1,2],
                                              [1,1,1,2]]), [[1,1,1,1],[1,2,2,2],[1,2,3,3]])
    }
}

SolutionTests.defaultTestSuite.run()
