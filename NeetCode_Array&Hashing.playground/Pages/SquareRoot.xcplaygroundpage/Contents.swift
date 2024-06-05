
/*
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
  

 Example 1:

 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 */

// 1 2 3 4

func mySqrt(_ x: Int) -> Int {
    guard x > 3 else { return x == 0 ? 0: 1}
    var low = 1
    var high = x/2
    
    while low < high {
        let mid = (low + high) / 2

        if mid * mid > x {
            high = mid - 1
        } else if mid * mid < x {
            low = mid + 1
        } else {
            return mid
        }
    }
    return high
}

mySqrt(8)
