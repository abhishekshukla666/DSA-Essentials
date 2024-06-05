
/*
 Given an array nums of n integers where nums[i] is in the range [1, n], 
 return an array of all the integers in the range [1, n] that do not
 appear in nums.

  

 Example 1:

 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 Example 2:

 Input: nums = [1,1]
 Output: [2]
 
 */


func findDisappearedNumbers_ExtraSpace(_ nums: [Int]) -> [Int] {
    let range = Array(1...nums.count)
    var result = [Int]()
    for n in range {
        if !nums.contains(n) {
            result.append(n)
        }
    }
    return result
}

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    for n in nums {
        let index = n - 1
        print("n: \(n), index: \(index), nums: \(nums)")
        nums[index] = n * -1
        print(nums, "\n")
    }
    var result = [Int]()
    for (i, n) in nums.enumerated() {
        if n > 0 {
            result.append(i + 1)
        }
    }
    return result
}

let nums = [4,3,2,7,8,2,3,1]
//let nums = [1,1]
findDisappearedNumbers(nums)
