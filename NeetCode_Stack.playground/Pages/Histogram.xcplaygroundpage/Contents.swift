func largestRectangleArea(_ heights: [Int]) -> Int {
    var maxArea = 0
    var stack = [[Int]]() // [Height, Index]
    for (i, h) in heights.enumerated() {
        var index = i
        while !stack.isEmpty && stack.last![0] > h {
            let dict = stack.last!
            maxArea = max(maxArea, dict[0] * (i - dict[1]))
            index = dict[1]
            stack.removeLast()
        }
        stack.append([h, index])
    }
    
    print(stack, maxArea)
    while !stack.isEmpty {
        let dict = stack.last!
        maxArea = max(maxArea, dict[0] * (heights.count - dict[1]))
        stack.removeLast()
    }
    
    return maxArea
}

let heights = [2,1,5,6,2,3]
largestRectangleArea(heights)
