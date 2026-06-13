
/*
 31. Next Permutation
 Medium

 A permutation of an array of integers is an arrangement of its members into a sequence or linear order.

 For example, for arr = [1,2,3], the following are all the permutations of arr: [1,2,3], [1,3,2], [2, 1, 3], [2, 3, 1], [3,1,2], [3,2,1].
 The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).

 For example, the next permutation of arr = [1,2,3] is [1,3,2].
 Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
 While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
 Given an array of integers nums, find the next permutation of nums.

 The replacement must be in place and use only constant extra memory.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [1,3,2]
 Example 2:

 Input: nums = [3,2,1]
 Output: [1,2,3]
 Example 3:

 Input: nums = [1,1,5]
 Output: [1,5,1]
  

 Constraints:

 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 */


import XCTest

class Solution {
    func generateAllPermutations(_ nums: [Int]) -> [[Int]] {
        // nums = [3, 1, 2]
        var result = [[Int]]()
        var map = [Int]()
        var check = Array(repeating: false, count: nums.count)
        
        func dfs(_ index: Int) {
            guard index < nums.count else {
                print("map before result: \(map)")
                print("=================")
                result.append(map)
                return
            }
            
            for i in 0..<nums.count {
                if !check[i] {
                    map.append(nums[i])
                    check[i] = true
                    print("map before recursion: \(map)")
                    dfs(index + 1)
                    map.popLast()
                    check[i] = false
                    print("map after recursion: \(map)")
                } else {
                    print("Loop not ran for index: \(i), value: \(nums[i])")
                }
            }
        }
        
        dfs(0)
        return result
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        if i >= 0 {
            var j = nums.count - 1
            while nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        
        var left = i + 1
        var right = nums.count - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

class SolutionTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Solution().generateAllPermutations([3, 1, 2]), [[3, 1, 2], [3, 2, 1], [1, 3, 2], [1, 2, 3], [2, 3, 1], [2, 1, 3]])
            
    }
    
//    func testNextPermutation() {
//        var nums = [1, 2, 3]
//        Solution().nextPermutation(&nums)
//        XCTAssertEqual(nums, [1, 3, 2])
//    }
}

SolutionTests.defaultTestSuite.run()
