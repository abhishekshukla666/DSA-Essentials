

/*
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:
 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 
 Example 2:
 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3
 */

func numIslands(_ grid: [[Character]]) -> Int {
    var count = 0
    var visited = Set<String>()
    for r in 0..<grid.count {
        for c in 0..<grid[0].count {
            count += separateIsland(grid, r, c, &visited)
        }
    }
    return count
}

func separateIsland(_ grid: [[Character]], _ r: Int, _ c: Int, _ visited: inout Set<String>) -> Int {
    
    guard 0 <= r && r < grid.count else { return 0 }
    guard 0 <= c && c < grid[0].count else { return 0 }
    
    guard grid[r][c] != "0" else { return 0 }
    
    let pos = "\(r),\(c)"
    if visited.contains(pos) { return 0 }
    visited.insert(pos)
    
    separateIsland(grid, r-1, c, &visited)
    separateIsland(grid, r+1, c, &visited)
    separateIsland(grid, r, c-1, &visited)
    separateIsland(grid, r, c+1, &visited)
    
    return 1
}

let grid: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ]


//let grid = [
//    ["1","1","0","0","0"],
//    ["1","1","0","0","0"],
//    ["0","0","1","0","0"],
//    ["0","0","0","1","1"]
//  ]

numIslands(grid)
