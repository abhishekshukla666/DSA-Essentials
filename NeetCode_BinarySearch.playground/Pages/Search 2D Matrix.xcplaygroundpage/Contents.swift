

/*
 Search a 2D Matrix
 You are given an m x n 2-D integer array matrix and an integer target.

 Each row in matrix is sorted in non-decreasing order.
 The first integer of every row is greater than the last integer of the previous row.
 Return true if target exists within matrix or false otherwise.

 Can you write a solution that runs in O(log(m * n)) time?

 Example 1:



 Input: matrix = [[1,2,4,8],[10,11,12,13],[14,20,30,40]], target = 10

 Output: true
 Example 2:



 Input: matrix = [[1,2,4,8],[10,11,12,13],[14,20,30,40]], target = 15

 Output: false
 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -10000 <= matrix[i][j], target <= 10000
 
 */

import XCTest

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        
        var left = 0
        var right = (m * n) - 1
        
        while left <= right {
            let mid = (left + right) / 2
            let element = matrix[mid / m][mid % m]
            debugPrint(element, terminator: " ")
            if element < target {
                left = mid + 1
            } else if element > target {
                right = mid - 1
            } else {
                return true
            }
        }
        return false
    }
}

class TestSearchMatrix: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3), true)
    }
}

TestSearchMatrix.defaultTestSuite.run()
