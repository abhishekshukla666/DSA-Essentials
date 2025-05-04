
//var arr = [4, 5, 3, 2, 1]
/*
 [4,5,3,2,1]
 [4,3,5,2,1]
 [3,4,5,2,1]
 */


func sort<T: Comparable>(_ arr: inout [T], _ isOrdered: (T, T) -> Bool) {
    for i in 1..<arr.count {
        var j = i
        while j > 0 && isOrdered(arr[j], arr[j-1]) {
            arr.swapAt(j, j-1)
            j -= 1
        }
    }
}

var arr = [9,2,6,3,7,5,4,1,8]
//var arr = ["z","a","c","b","x","y"]
sort(&arr, >)
print(arr)


