/*
 Graph - "Depth First Search"
 */

func depthFirstSearch(_ graph: [String: [String]], _ source: String) {
    var stack = [source]
    while stack.count > 0 {
        let last = stack.popLast()!
        debugPrint(last)
        
        for neighbor in graph[last]! {
            stack.append(neighbor)
        }
    }
}

func depthFirstSearch_Recursive(_ graph: [String: [String]], _ source: String) {
    debugPrint(source)
    for neighbor in graph[source]! {
        depthFirstSearch_Recursive(graph, neighbor)
    }
}

let graph = [
    "a": ["b", "c"],
    "b": ["d"],
    "c": ["e"],
    "d": ["f"],
    "e": [],
    "f": []
]
//depthFirstSearch(graph, "a")
depthFirstSearch_Recursive(graph, "a")

