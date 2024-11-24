import XCTest

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for num in asteroids {
            var num = num
            while stack.count > 0 && stack.last! > 0 && num < 0 {
                let diff = stack.last! + num
                if diff < 0 {
                    stack.removeLast()
                } else if diff == 0 {
                    stack.removeLast()
                    num = 0
                } else {
                    num = 0
                }
            }
            if num != 0 {
                stack.append(num)
            }
        }
        return stack
    }
}

//let asteroids = [5,10,-5]
//let asteroids = [1,2,-1,-2]
//print(asteroidCollision(asteroids))



class SolutionTest: XCTestCase {
    var solution = Solution()
    func testAsteroids() {
        solution.asteroidCollision([5,10,-5])
        XCTAssertEqual(solution.asteroidCollision([5,10,-5]), [5,10])
    }
}

SolutionTest.defaultTestSuite.run()
