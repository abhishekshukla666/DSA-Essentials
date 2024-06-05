
/*
 Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

  

 Example 1:

 Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
 Output: 1
 Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
 Example 2:

 Input: intervals = [[1,2],[1,2],[1,2]]
 Output: 2
 Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
 Example 3:

 Input: intervals = [[1,2],[2,3]]
 Output: 0
 
 Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
 */

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var result = 0
    var prevEnd = intervals[0][1]
    for i in 1..<intervals.count {
        let start = intervals[i][0]
        let end = intervals[i][1]
        if start >= prevEnd {
            /* NotOverlapping */
            prevEnd = end
        } else {
            /* Overlapping */
            result += 1
            prevEnd = min(prevEnd, end)
            
        }
    }
    return result
}

//let intervals = [[1,2],[2,3],[3,4],[1,3]]
let intervals = [[1,2],[1,2],[1,2]]
print(eraseOverlapIntervals(intervals))
