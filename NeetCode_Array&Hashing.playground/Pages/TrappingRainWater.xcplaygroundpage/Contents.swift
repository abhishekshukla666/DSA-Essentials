
/*
 
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 Example 1:
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 Input: height = [4,2,0,3,2,5]
 Output: 9
 
 */

/* Brute Force */
func trap(_ height: [Int]) -> Int {
    
    var water = 0
    
    for i in 0..<height.count {
        var j = i
        var left = 0
        var right = 0
        while j >= 0 {
            left = max(left, height[j])
            print("left: \(left)", terminator: "\t")
            j -= 1
        }
        j = i
        while j < height.count {
            right = max(right, height[j])
            print("right: \(right)", terminator: "\t")
            j += 1
        }
        print("\n")
        water += min(left, right) - height[i]
    }
    
    return water
}

//let height = [0,1,0,2,1,0,1,3,2,1,2,1]
let height = [4,2,0,3,2,5]
trap(height)
