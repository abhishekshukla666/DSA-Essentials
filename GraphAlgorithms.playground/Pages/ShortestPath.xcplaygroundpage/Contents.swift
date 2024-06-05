
/*
 
    x   y
 w          z
      v
 */


func shortestPath(_ graph: [String: [String]], _ source: String, _ dest: String) -> Int {
    
    var queue = [[String: Int]]()
    var set = Set<String>()
    queue.append([source: 0])
    while queue.count > 0 {
        let dict = queue.removeFirst()
        let prev = dict.first?.key
        set.insert(prev!)
        let lastCount = dict.first?.value
        
        if prev == dest { return lastCount! }
        
        for neighbour in graph[prev!]! {
            if set.contains(neighbour) { continue }
            queue.append([neighbour: lastCount! + 1])
        }
    }
    
    return -1
}

func buildAdjecy(_ edges: [[String]]) -> [String: [String]] {
    var graph = [String: [String]]()
    for edge in edges {
        let first = edge[0]
        let second = edge[1]
        graph[first, default: []].append(second)
        graph[second, default: []].append(first)
    }
    
    return graph
}


let edges = [
 ["w", "x"],
 ["x", "y"],
 ["z", "y"],
 ["z", "v"],
 ["w", "v"]
]

let graph = buildAdjecy(edges)
shortestPath(graph, "y", "z")
