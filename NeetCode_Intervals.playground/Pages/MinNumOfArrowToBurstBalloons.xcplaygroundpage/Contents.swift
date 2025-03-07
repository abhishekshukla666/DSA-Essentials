/*
 There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array points where points[i] = [xstart, xend] denotes a balloon whose horizontal diameter stretches between xstart and xend. You do not know the exact y-coordinates of the balloons.

 Arrows can be shot up directly vertically (in the positive y-direction) from different points along the x-axis. A balloon with xstart and xend is burst by an arrow shot at x if xstart <= x <= xend. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path.

 Given the array points, return the minimum number of arrows that must be shot to burst all balloons.

  

 Example 1:

 Input: points = [[10,16],[2,8],[1,6],[7,12]]
 Output: 2
 Explanation: The balloons can be burst by 2 arrows:
 - Shoot an arrow at x = 6, bursting the balloons [2,8] and [1,6].
 - Shoot an arrow at x = 11, bursting the balloons [10,16] and [7,12].
 
 Example 2:
 
 Input: points = [[1,2],[3,4],[5,6],[7,8]]
 Output: 4
 Explanation: One arrow needs to be shot for each balloon for a total of 4 arrows.
 
 Example 3:

 Input: points = [[1,2],[2,3],[3,4],[4,5]]
 Output: 2
 Explanation: The balloons can be burst by 2 arrows:
 - Shoot an arrow at x = 2, bursting the balloons [1,2] and [2,3].
 - Shoot an arrow at x = 4, bursting the balloons [3,4] and [4,5].
 */

import XCTest

class Solution {
    
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 1 else { return 1 }
        let points = points.sorted { $0[0] < $1[0] }
        var mergedPoints = [points[0]]
        
        for i in 1..<points.count {
            let currStart = points[i][0]
            let currEnd = points[i][1]
            
            let prevPoint = mergedPoints.last!
            let prevEnd = prevPoint.last!
            let prevStart = prevPoint.first!
            /* 1. Check Overlapping */
            if prevEnd >= currStart {
                /* 2. Merge Overlapping Points */
                mergedPoints[mergedPoints.count - 1][0] = max(prevStart, currStart)
                mergedPoints[mergedPoints.count - 1][1] = min(prevEnd, currEnd)
            } else {
                mergedPoints.append(points[i])
            }
            debugPrint("Merge: \(mergedPoints)", terminator: "\n")
        }
        return mergedPoints.count
    }
    
    func findMinArrowShots2(_ points: [[Int]]) -> Int {
        
        let points = points.sorted { $0[1] < $1[1] }
        var end = Int.min
        var count = 0
        
        for point in points {
            if end < point[0] {
                count += 1
                end = point[1]
            }
        }
        
        return count
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]), 2)
        XCTAssertEqual(Solution().findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]), 4)
        XCTAssertEqual(Solution().findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]), 2)
    }
}

SolutionTests.defaultTestSuite.run()
