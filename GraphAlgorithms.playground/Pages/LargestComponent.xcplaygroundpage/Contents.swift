



func largestComponent(_ grpah: [Int: [Int]]) -> Int {
    var largest = 0
    var set: Set<Int> = .init()
    for dict in graph {
        let curr = dfs_Recursive(dict.key, graph, &set)
        largest = max(largest, curr)
    }
    
    return largest
}

func dfs_Recursive(_ source: Int, _ graph: [Int: [Int]], _ set: inout Set<Int>) -> Int {
    if set.contains(source) { return 0 }
    set.insert(source)
    var count = 1
    print(set, count)
    for neighbour in graph[source]! {
        count += dfs_Recursive(neighbour, graph, &set)
    }
    return count
}

let graph = [
    0: [5, 8, 1],
    1: [0],
    2: [4, 3],
    3: [4, 2],
    4: [2, 3],
    5: [0, 8],
    8: [0, 5]
]

let count = largestComponent(graph)
print(count)
