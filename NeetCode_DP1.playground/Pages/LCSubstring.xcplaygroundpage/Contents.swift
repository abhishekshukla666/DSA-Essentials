

let s1 = "abcdgh"
let s2 = "abxdgh"


func lcs(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    
    func helper(_ m: Int, _ n: Int, _ count: Int) -> Int {
        if m == 0 || n == 0 { return count }
        
        if s1[m - 1] == s2[n - 1] {
            return helper(m - 1, n - 1, count + 1)
        } else {
            let count1 = helper(m - 1, n, 0)
            let count2 = helper(m, n - 1, 0)
            return max(count, max(count1, count2))
        }
    }
    
    return helper(s1.count, s2.count, 0)
}

func lcs_Recursive(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    var memo = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
    
    func helper(_ m: Int, _ n: Int, _ count: Int) -> Int {
        if memo[m][n] != 0 { return memo[m][n] }
        if m == 0 || n == 0 { return count }
        
        if s1[m - 1] == s2[n - 1] {
            memo[m][n] = helper(m - 1, n - 1, count + 1)
        } else {
            memo[m][n] = max(helper(m - 1, n, count),
                             helper(m, n - 1, count))
            
        }
        print(memo)
        return memo[m][n]
    }
    
    return helper(s1.count, s2.count, 0)
}

func lcs_TopDown(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    let m  = s1.count
    let n = s2.count
    
    var memo = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    func helper() -> Int {
        
        for i in 1..<m + 1 {
            for j in 1..<n + 1 {
                if s1[i - 1] == s2[j - 1] {
                    memo[i][j] = 1 + memo[i - 1][j - 1]
                } else {
                    memo[i][j] = 0
                }
            }
        }
        
        return memo[m][n]
    }
    
    return helper()
}


lcs(s1, s2)
lcs_Recursive(s1, s2)
lcs_TopDown(s1, s2)
