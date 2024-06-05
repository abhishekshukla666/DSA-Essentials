
func isPowerOfThree(_ n: Int) -> Bool {
    guard n > 0 else { return false }
    
    func isDivisible(_ num: Int) -> Bool {
        if num == 1 { return true }
        if num.isMultiple(of: 3) {
            return isDivisible(num / 3)
        } else { 
            return false
        }
    }
    
    return isDivisible(n)
}

isPowerOfThree(27)
