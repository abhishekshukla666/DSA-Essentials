
/*
 
 */

let weights = [1, 4, 9, 10]
let prices = [1, 4, 9, 10]
let capacity = 12


func maxWeight_R(_ weigths: [Int], _ prices: [Int], _ w: Int) -> Int {
    
    func helper(_ w: Int, _ n: Int) -> Int {
        if n == 0 || w == 0 { return 0 }
        
        
        if weigths[n - 1] <= w {
            return max(
                prices[n - 1] + helper(w - weigths[n-1], n - 1),
                helper(w, n - 1)
            )
        } else {
            return helper(w, n - 1)
        }
        
    }
    return helper(w, weights.count)
}
 

/// Recursive + Memoization
func maxWeight_RM(_ weigths: [Int], _ prices: [Int], _ w: Int) -> Int {
    

    var t = Array(repeating: Array(repeating: 0, count: prices.count + 1), count: w + 1)
    
    func helper(_ w: Int, _ n: Int) -> Int {
        if n == 0 || w == 0 { return 0 }
        
        if t[w][n] != 0 { return t[w][n] }
        if weigths[n - 1] <= w {
            t[w][n] = max(
                prices[n - 1] + helper(w - weigths[n-1], n - 1),
                helper(w, n - 1)
            )
        } else {
            t[w][n] = helper(w, n - 1)
        }
        
        return t[w][n]
    }
    
    
    let value = helper(w, weights.count)
    print(t)
    return value
}

/// Top-Down
func maxWeight_DP(_ weigths: [Int], _ prices: [Int], _ w: Int) -> Int {
    

    var n = prices.count
    var t = Array(repeating: Array(repeating: 0, count: n + 1), count: w + 1)
    
    
    for i in 0...w {
        for j in 0...n {
            if weigths[j - 1] <= i {
                t[i][j] = max(prices[j - 1] + t[i - weigths[j - 1]][j - 1], t[i][j - 1])
            } else {
                t[i][j] = t[i][j - 1]
            }
        }
    }
    return t[w][n]
}

maxWeight_DP(weights, prices, capacity)
