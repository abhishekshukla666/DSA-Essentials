
/*
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]
 Example 2:


 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 */

import XCTest

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        transpose(&matrix)
        for i in 0..<matrix.count {
            reverse(&matrix[i])
        }
    }

    private func transpose(_ matrix: inout [[Int]]) {

        for i in 0..<matrix.count {
            for j in i..<matrix[0].count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }

    private func reverse(_ row: inout [Int]) {
        var l = 0
        var r = row.count - 1
        
        while l < r {
            row.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}

var matrix = [[1,2,3],[4,5,6],[7,8,9]]
let solution = Solution().rotate(&matrix)
print(matrix)
