
let n = 6
//let edges = [[0,1],[0,2],[1,2],[3,4], [5, 5]]
let edges = [[0,1],[0,2],[1,2],[3,4],[3,5]]


func connectedComponentsCount(_ graph: [Int: [Int]]) -> Int {
    var count = 0
    var set = Set<Int>()
    for dict in graph {
        count += dfs_Recurssive(dict.key, graph, set: &set)
    }
    return count
}

func dfs_Recurssive(_ source: Int, _ graph: [Int: [Int]], set: inout Set<Int>) -> Int {
    if set.contains(source) { return 0 }
    set.insert(source)
    for node in graph[source]! {
        dfs_Recurssive(node, graph, set: &set)
    }
    return 1
}

func buildAgency(_ edges: [[Int]]) -> [Int: [Int]] {
    var agency = [Int: [Int]]()
    
    for edge in edges {
        let (first, second) = (edge[0], edge[1])
        
        if agency[first] == nil { agency[first] = [] }
        if agency[second] == nil { agency[second] = [] }
        
        agency[first]?.append(second)
        agency[second]?.append(first)
    }
    print(agency)
    return agency
}

let graph = buildAgency(edges)
connectedComponentsCount(graph)
