
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

import XCTest

class Solution {
    func minMeetingRooms1(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var activeMeetings = [Int]()
        
        for interval in sortedIntervals {
            activeMeetings = activeMeetings.filter { $0 > interval[0] }
            print(activeMeetings)
            activeMeetings.append(interval[1])
            print(activeMeetings)
            print("-----")
        }
        
        return activeMeetings.count
    }
    
    func minMeetingRooms2(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty { return 0 }
        
        // 1. Sort intervals by start time
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        
        // 2. Min-Heap (Priority Queue) to keep track of meeting end times
        var meetingEndTimes = [Int]()
        meetingEndTimes.append(sortedIntervals[0][1])
        
        for i in 1..<sortedIntervals.count {
            let start = sortedIntervals[i][0]
            let end = sortedIntervals[i][1]
            
            // 3. If the room is free, remove the earliest ending meeting
            if start >= meetingEndTimes.first! {
                meetingEndTimes.removeFirst()
            }
            
            // 4. Add the current meeting's end time to the heap
            meetingEndTimes.append(end)
            meetingEndTimes.sort() // Maintain the heap property
        }
        
        return meetingEndTimes.count
    }
    
    func minMeetingRooms3(_ intervals: [[Int]]) -> Int {
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
}

class SolutionTests: XCTestCase {
    func testSolution() {
        XCTAssertEqual(Solution().minMeetingRooms2([[0,30],[5,10],[15,20]]), 2)
        XCTAssertEqual(Solution().minMeetingRooms2([[7,10],[2,4]]), 1)
    }
}

SolutionTests.defaultTestSuite.run()



