
/*
 You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

 Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

 Return intervals after the insertion.

  

 Example 1:

 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 Example 2:

 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

 */

import XCTest

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var i = 0
        while i < intervals.count && intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }
        var newInterval = newInterval
        while i < intervals.count && intervals[i][0] <= newInterval[1] {
            newInterval[0] = min(intervals[i][0], newInterval[0])
            newInterval[1] = max(intervals[i][1], newInterval[1])
            i += 1
        }
        result.append(newInterval)
        
        while i < intervals.count {
            result.append(intervals[i])
            i += 1
        }
        return result
    }
}

class SolutionTests: XCTestCase {
    func testCase() {
        XCTAssertEqual(Solution().insert([[1,3], [6,9]], [2,5]), [[1,5], [6,9]])
        XCTAssertEqual(Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]), [[1,2],[3,10],[12,16]])
    }
}

SolutionTests.defaultTestSuite.run()
