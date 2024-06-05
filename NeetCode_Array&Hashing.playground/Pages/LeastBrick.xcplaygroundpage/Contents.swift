func leastBricks(_ wall: [[Int]]) -> Int {
    var path = [Int: Int]()
    for row in wall {
        var index = 0
        for i in 0..<row.count-1 {
            index += row[i]
            path[index, default: 0] += 1
        }
    }
    let result = wall.count - path.reduce(0){ max($0, $1.1) }
    return result
}

let wall = [[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]
leastBricks(wall)
