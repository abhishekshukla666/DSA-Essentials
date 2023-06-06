

import Foundation

// 1001100011
func sort01(_ s: String) -> String {
    var arr = Array<Character>(s)
    
    var left = 0
    var right = s.count - 1
    
    while left <= right {
        if arr[right] == "1" {
            right -= 1
        } else if arr[left] == "0" {
            left += 1
        } else {
            arr.swapAt(left, right)
        }
    }
    return arr.map { String($0) }.joined()
}

sort01("1001100011")


func sort012(_ s: String) -> String {
    var arr = Array<Character>(s)
    
    var left = 0
    var mid = 0
    var right = s.count - 1
    
    while mid <= right {
        switch arr[mid] {
        case "0":
            arr.swapAt(left, mid)
            left += 1
            mid += 1
        case "1":
            mid += 1
        case "2":
            arr.swapAt(mid, right)
            right -= 1
        default: break
        }
    }
    return arr.map { String($0) }.joined()
}

print(sort012("120012011022"))
