

let s1 = "abcdgh"
let s2 = "abedfh"


func lcs(_ text1: String, _ text2: String) -> Int {
    
    let s1 = Array(text1)
    let s2 = Array(text2)
    
    func helper(_ m: Int, _ n: Int, _ count: Int) -> Int {
        if m == 0 || n == 0 { return 0 }
        
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

lcs(s1, s2)
