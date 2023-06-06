
func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let m = matrix.count
    let n = matrix[0].count
    
    var left = 0
    var right = (m * n) - 1
    
    while left <= right {
        let mid = (left + right) / 2
        let element = matrix[mid / m][mid % m]
        if element < target {
            left = mid + 1
        } else if element > target {
            right = mid - 1
        } else {
            return true
        }
    }
    return false
}

let matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]]; let target = 3
searchMatrix(matrix, target)
