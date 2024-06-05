
/*
 Create agency list and then find if path exists
 */

/* Breadth First Search */
func undirectedPath_BFS(_ edges: [[String]], _ source: String, _ destination: String) -> Bool {
    
    let graph = buildGraph(edges)
    print(graph)
    var queue = [source]
    var set = Set<String>()
    while queue.count > 0 {
        let first = queue.removeFirst()
        if set.contains(first) { continue }
        set.insert(first)
        if first == destination { return true }
        for node in graph[first]! {
            queue.append(node)
        }
    }
    return false
}

/* Depth First Search */
func undirectedPath_DFS(_ edges: [[String]], _ source: String, _ destination: String) -> Bool {
    let graph = buildGraph(edges)
    print(graph)
    var set = Set<String>()
    return hasPath(graph, source, destination, &set)
}
func hasPath(_ graph: [String: [String]], _ source: String, _ destination: String, _ set: inout Set<String>) -> Bool {
    if source == destination { return true }
    if set.contains(source) { return false }
    set.insert(source)
    for node in graph[source]! {
        hasPath(graph, node, destination, &set)
    }
    return false
}

func buildGraph(_ edges: [[String]]) -> [String: [String]] {
    var graph = [String: [String]]()
    
    for edge in edges {
        var (a, b) = (edge[0],edge[1])
        if graph[a] == nil { graph[a] = [] }
        if graph[b] == nil { graph[b] = [] }
        graph[a]?.append(b)
        graph[b]?.append(a)
    }
    
    return graph
}

let edges: [[String]] = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["o", "n"]
]

/*
 i ----- j
 |
 |
 k ----- l
 |
 |
 m
 
 o ----- n
 */

undirectedPath_BFS(edges, "k", "j")
undirectedPath_DFS(edges, "k", "j")
