

func characterReplacement(_ s: String, _ k: Int) -> Int {
    var result = 0
    let s = Array(s)
    var dict = [Character: Int]()
    var i = 0
    var j = 0
    var f = 0
    while j < s.count {
        dict[s[j], default: 0] += 1
        f = max (f, dict[s[j]]!)
        while (j - i + 1) - f > k {
            if dict[s[i]] != nil {
                dict[s[i]]! -= 1
                i += 1
            }
        }
        result = max(result, j - i + 1)
        j += 1
    }
    print(result)
    return result
}

let s = "AABAABA"; let k = 1
characterReplacement(s, k)
