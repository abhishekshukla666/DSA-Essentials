
func isPerfectSquare(_ num: Int) -> Bool {
    if num == 1 { return true }
    var left = 1
    var right = num/2
    print(left, right)
    while left <= right {
        let mid = (left + right) / 2
        let square = mid * mid
        if square < num {
            left = mid + 1
        } else if square > num {
            right = mid - 1
        } else {
            return true
        }
    }
    return false
}

isPerfectSquare(1)
