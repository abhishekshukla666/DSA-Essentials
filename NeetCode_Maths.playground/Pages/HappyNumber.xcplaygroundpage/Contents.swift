
/*
 
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.

  

 Example 1:

 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 Example 2:

 Input: n = 2
 Output: false
 */

func isHappy(_ n: Int) -> Bool {
    var curr = n
    var set = Set<Int>()
    while !set.contains(curr) {
        set.insert(curr)
        curr = digitSquareSum(curr)
        if curr == 1 { return true }
    }
    
    return false
}

func digitSquareSum(_ n: Int) -> Int {
    var sum = 0
    var curr = n
    while curr != 0 {
        print(curr)
        let digit =  curr % 10
        sum += digit * digit
        curr = curr / 10
    }
    return sum
}

//isHappy(19)
digitSquareSum(189)
