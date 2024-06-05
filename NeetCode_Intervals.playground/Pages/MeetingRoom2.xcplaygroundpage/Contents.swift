
/*
 
 Given an array of meeting time intervals consisting of start and end times[[s1,e1],[s2,e2],...]
 (si< ei), find the minimum number of conference rooms required.
 
 Example 1:
 Input: [[0, 30],[5, 10],[15, 20]]
 Output: 2
 
 Example 2:
 Input: [[7,10],[2,4]]
 Output: 1
 
 */

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    var result = 0
    
    let start = intervals.map { $0[0] }.sorted { $0 < $1 }
    let end = intervals.map { $0[1] }.sorted { $0 < $1 }
    var i = 0
    var j = 0
    var count = 0
    
    while i < start.count {
        if start[i] < end[j] {
            i += 1
            count += 1
        } else {
            count -= 1
            j += 1
        }
        result = max(result, count)
    }
    
    return result
}
    
let intervals = [[0, 30],[5, 10],[15, 20]]
//let intervals = [[7,10],[2,4]]
minMeetingRooms(intervals)



