
import XCTest

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        var arr = [[Int]]()
        var stack = [[Int]]() // [j, minValue]
        var currMin = nums[0] // current minValue
        
        for k in 1..<nums.count {
            while !stack.isEmpty && stack.last![0] < nums[k] {
                stack.removeLast()
            }
            if !stack.isEmpty && nums[k] > stack.last![1] && nums[k] < stack.last![0] {
                arr.append([stack.last![1], stack.last![0], nums[k]])
            }
            stack.append([nums[k], currMin])
            currMin = min(currMin, nums[k])
        }
        print("\(arr)")
        return arr.count != 0
    }
}

class SolutionTests: XCTestCase {
    
    var solution: Solution!
    
    override func setUp() {
        super.setUp()
        print("setUp")
        solution = Solution()
    }
    
    override func tearDown() {
        debugPrint("tearDown")
        solution = nil
        super.tearDown()
    }
    
    func testCase1() {
        
        // case 1
        let result1 = solution.find132pattern([3,1,4,2])
        XCTAssertEqual(result1, true, "Incorrect!")
    }
    func testCase2() {
        // case 2
        let result2 = solution.find132pattern([-1,3,2,0])
        XCTAssertEqual(result2, true, "Incorrect!")
    }
    
    func testCase3() {
        // case 3
        let result3 = solution.find132pattern([-2,1,1])
        XCTAssertEqual(result3, false , "Incorrect")
    }
}


class TestObserver: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase,
                  didFailWithDescription description: String,
                  inFile filePath: String?,
                  atLine lineNumber: Int) {
        assertionFailure(description, line: UInt(lineNumber))
    }
}
let testObserver = TestObserver()
XCTestObservationCenter.shared.addTestObserver(testObserver)
SolutionTests.defaultTestSuite.run()
