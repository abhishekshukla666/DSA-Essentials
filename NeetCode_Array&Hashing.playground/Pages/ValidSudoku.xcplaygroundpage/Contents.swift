
func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
    var cols: [Set<Character>] = Array(repeating: Set<Character>(), count: 9)
    var subBoxes: [[Set<Character>]] = Array(repeating: Array(repeating: Set<Character>(), count: 3), count: 3)
    print(rows, cols, subBoxes)
    for i in 0...8 {
        for j in 0...8 {
            let val: Character = board[i][j]
            if (val == ".") {
                continue
            }
            if (rows[i].contains(val) || cols[j].contains(val) || subBoxes[i/3][j/3].contains(val)){
                return false
            }
            rows[i].insert(val)
            cols[j].insert(val)
            subBoxes[i/3][j/3].insert(val)
        }
    }
//    print(rows)
//    print(cols)
    print(subBoxes)
    return true
}

let  board: [[Character]] =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","2","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
isValidSudoku(board)
//isValidSudoku2(board)
