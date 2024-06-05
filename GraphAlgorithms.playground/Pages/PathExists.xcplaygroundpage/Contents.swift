/*
 Graph - "Depth First Search"
 */

func isPathExist_DFS(_ graph: [String: [String]], _ source: String, _ destination: String) -> Bool {
    var stack = [source]
    while stack.count > 0 {
        let last = stack.popLast()!
        if last == destination { return true }
        
        for node in graph[last]! {
            stack.append(node)
        }
    }
    return false
}

func isPathExist_DFS_Recursive(_ graph: [String: [String]], _ source: String, _ destination: String) -> Bool {
    
    if source == destination { return true }
    
    for neighbour in graph[source]! {
        if isPathExist_DFS_Recursive(graph, neighbour, destination) { return true }
    }
    
    return false
}

/*
 Breadth First Search
 */
func isPathExist_BFS(_ graph: [String: [String]], _ source: String, _ destination: String) -> Bool {
    var queue = [source]
    while queue.count > 0 {
        let first = queue.removeFirst()
        if first == destination { return true }
        for node in graph[first]! {
            queue.append(node)
        }
    }
    return false
}

/* Directed Graph */
let graph = [
    "f": ["g", "i"],
    "g": ["h"],
    "h": [],
    "i": ["g", "k"],
    "j": ["i"],
    "k": []
]

/*
 f ---> g ---> h
 |  ->
 |-
 >
 i <--- j
 |
 |
 >
 k
 */

//isPathExist_DFS(graph, "h", "k")
//isPathExist_BFS(graph, "h", "k")
isPathExist_DFS_Recursive(graph, "f", "j")
