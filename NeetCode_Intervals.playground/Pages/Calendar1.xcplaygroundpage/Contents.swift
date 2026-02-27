
/*
 729. My Calendar I
 Medium

 Topics
 premium lock icon
 Companies

 Hint
 You are implementing a program to use as your calendar. We can add a new event if adding the event will not cause a double booking.

 A double booking happens when two events have some non-empty intersection (i.e., some moment is common to both events.).

 The event can be represented as a pair of integers startTime and endTime that represents a booking on the half-open interval [startTime, endTime), the range of real numbers x such that startTime <= x < endTime.

 Implement the MyCalendar class:

 MyCalendar() Initializes the calendar object.
 boolean book(int startTime, int endTime) Returns true if the event can be added to the calendar successfully without causing a double booking. Otherwise, return false and do not add the event to the calendar.
  

 Example 1:

 Input
 ["MyCalendar", "book", "book", "book"]
 [[], [10, 20], [15, 25], [20, 30]]
 Output
 [null, true, false, true]

 Explanation
 MyCalendar myCalendar = new MyCalendar();
 myCalendar.book(10, 20); // return True
 myCalendar.book(15, 25); // return False, It can not be booked because time 15 is already booked by another event.
 myCalendar.book(20, 30); // return True, The event can be booked, as the first event takes every time less than 20, but not including 20.
  

 Constraints:

 0 <= start < end <= 109
 At most 1000 calls will be made to book.
 */

import XCTest

class Solution {
    var intervals: [Int: Int] = .init()
    func book(_ startTime: Int, _ endTime: Int) -> Bool {
        guard intervals.count > 0 else {
            intervals[endTime] = startTime
            return true
        }
        
        // Overlapping condition
        let prevStart = intervals[endTime]
        
        return true
    }
}

class SolutionTest: XCTestCase {
    func testExample1() {
        let solution = Solution()
        XCTAssertTrue(solution.book(10, 20))
        XCTAssertFalse(solution.book(15, 25))
        XCTAssertTrue(solution.book(20, 30))
    }
    
    func testExample2() {
        let solution = Solution()
        XCTAssertTrue(solution.book(47, 50))
        XCTAssertTrue(solution.book(33, 41))
        XCTAssertFalse(solution.book(39, 45))
        XCTAssertFalse(solution.book(33, 42))
        XCTAssertTrue(solution.book(25, 32))
        
        XCTAssertFalse(solution.book(26, 35))
        XCTAssertTrue(solution.book(19, 25))
        XCTAssertTrue(solution.book(3, 8))
        XCTAssertTrue(solution.book(8, 13))
        XCTAssertFalse(solution.book(18, 27))
    }
}

SolutionTest.defaultTestSuite.run()
