
/*
 Given an array of meeting time intervals consisting of start and end times[[s1,e1],[s2,e2],...]
 (si< ei), determine if a person could attend all meetings.
 
 Example 1:
 Input: [[0,30],[5,10],[15,20]]
 Output: false
 
 Example 2:
 Input: [[7,10],[2,4]]
 Output: true
 
 */

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    
    let intervals = intervals.sorted { $0[0] < $1[0] }
    for i in 1..<intervals.count {
        let prev = intervals[i-1]
        let curr = intervals[i]
        if prev[1] > curr[0] {
            return false
        }
    }
    
    return true
}

//let intervals = [[0,30],[5,10],[15,20]]
let intervals = [[7,10],[2,4]]
canAttendMeetings(intervals)

