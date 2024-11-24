
func strStr(_ haystack: String, _ needle: String) -> Int {
    guard haystack.count >= needle.count else { return -1 }
    let haystack = Array(haystack)
    let needle = Array(needle)
    for i in 0..<(haystack.count - needle.count + 1) {
        var count = 0
        for j in 0..<needle.count {
            if haystack[i + j] != needle[j] { break }
            count += 1
        }
        if count == needle.count {
            return i
        }
    }
    
    return -1
}

//let haystack = "sadbutsad"; let needle = "sad"
//let haystack = "leetcode"; let needle = "leeto"
let haystack = "hello"; let needle = "ll"
//let haystack = "a"; let needle = "a"
//let haystack = "mississippi"; let needle = "issip"
print(strStr(haystack, needle))
