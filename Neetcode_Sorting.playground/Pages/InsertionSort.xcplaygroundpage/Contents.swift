
func sort<T: Comparable>(_ arr: inout [T], isOrdered: (T, T) -> Bool) -> [T] {
    for i in 1..<arr.count {
        let value = arr[i]
        var hole = i
        while hole > 0 && isOrdered(arr[hole-1], value) {
            arr.swapAt(hole, hole-1)
            hole -= 1
        }
        arr[hole] = value
    }
    return arr
}
var arr = [9,2,6,3,7,5,4,1,8]
//var arr = ["z","a","c","b","x","y"]
sort(&arr, isOrdered: <)
print(arr)


