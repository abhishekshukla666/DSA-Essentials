

/*
 Graph - "Breadth First Search"
 */
func breadthFirstSearch(_ graph: [String: [String]], _ source: String) {
    var queue: [String] = [source]
    while queue.count > 0 {
        let first = queue.removeFirst()
        debugPrint(first)
        for node in graph[first]! {
            queue.append(node)
        }
    }
}

func breadthFirstSearch_Recursive(_ graph: [String: [String]], _ source: String) {
    debugPrint(source)
    for node in graph[source]! {
        
    }
}


let graph = [
    "a": ["c", "b"],
    "b": ["d"],
    "c": ["e"],
    "d": ["f"],
    "e": [],
    "f": []
]
breadthFirstSearch(graph, "a")
