func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dict = [Int: Int]()
    for n in nums {
        dict[n, default: 0] += 1
    }
    print(dict)
    var array2D = [[Int]](repeating: [Int](), count: nums.count + 1)
    for (key, value) in dict {
        array2D[value].append(key)
    }
    print(array2D)
    var result = [Int]()
    for i in stride(from: array2D.count-1, to: 0, by: -1) {
        for n in array2D[i] {
            result.append(n)
            if result.count == k {
                return result
            }
        }
    }
    return result
}

topKFrequent([1,2], 2)
