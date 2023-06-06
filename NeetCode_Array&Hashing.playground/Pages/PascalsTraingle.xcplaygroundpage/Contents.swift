
func generate(_ numRows: Int) -> [[Int]] {
    var result = [[1]]
    for row in 1..<numRows {
        let temp = [0] + result[row-1] + [0]
        var col = [Int]()
        for i in 0...row {
            col.append(temp[i] + temp[i+1])
        }
        result.append(col)
    }
    return result
}

let numRows = 5
generate(numRows)
