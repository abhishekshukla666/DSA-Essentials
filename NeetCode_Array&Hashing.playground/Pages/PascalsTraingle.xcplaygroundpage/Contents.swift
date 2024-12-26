
/*
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:


  

 Example 1:
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

 Example 2:
 Input: numRows = 1
 Output: [[1]]

 */

import XCTest

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[1]]
        
        for row in 1..<numRows {
            let temp = [0] + result[row - 1] + [0]
            debugPrint("temp: \(temp)")
            var col: [Int] = .init()
            
            for i in 0...row {
                col.append(temp[i] + temp[i + 1])
            }
            
            result.append(col)
        }
        
        return result
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().generate(5), [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
    }
}

SolutionTests.defaultTestSuite.run()
