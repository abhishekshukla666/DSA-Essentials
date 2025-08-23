
/*
 Longest Common Subsequence
 */

var s1 = "abcdgh"
var s2 = "abedfh"

func lcs_memo(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    
    var memo = Array(repeating: Array(repeating: -1, count: s2.count + 1), count: s1.count + 1)
    
    func helper(_ i: Int, _ j: Int) -> Int {
        
        if memo[i][j] != -1 { return memo[i][j] }
        if i == 0 || j == 0 { return 0 }
        
        if s1[i - 1] == s2[j - 1] {
            memo[i][j] = 1 + helper(i - 1, j - 1)
        } else {
             memo[i][j] = max(helper(i - 1, j), helper(i, j - 1))
        }
        return memo[i][j]
    }
    
    return helper(s1.count, s2.count)
}

func lcs_top_down(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    
    var m = s1.count
    var n = s2.count
    
    var t = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    var lcs = ""
    
    for i in 1...m {
        for j in 1...n {
            if s1[i - 1] == s2[j - 1] {
                t[i][j] = 1 + t[i - 1][j - 1]
            } else {
                t[i][j] = max(t[i - 1][j], t[i][j - 1])
            }
        }
    }
    
    var i = m
    var j = n
    
    while i > 0 && j > 0 {
        if s1[i - 1] == s2[j - 1] {
            lcs.append(s1[i - 1])
            print(lcs)
            i -= 1
            j -= 1
        } else {
            if (t[i][j - 1] > t[i - 1][j]) {
                lcs.append(s2[j - 1])
                j -= 1
            } else {
                lcs.append(s1[i - 1])
                i -= 1
            }
        }
    }
    
    print(lcs)
    
    return t[m][n]
}

//lcs_memo(s1, s2)
lcs_top_down(s1, s2)
