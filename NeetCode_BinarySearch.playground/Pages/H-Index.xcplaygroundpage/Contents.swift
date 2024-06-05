
/*
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.

  

 Example 1:
                     0 1 2 3 4
 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 
 Example 2:
                                      0 1 2
 Input: citations = [1,3,1] =(sort)> [1,1,3]
 Output: 1
 
 Example 3:
                     0 1 2 3 4 5
 Input: citations = [0,1,2,3,7,8]

 Constraints:
 n == citations.length
 1 <= n <= 5000
 0 <= citations[i] <= 1000
 */

func hIndex(_ citations: [Int]) -> Int {
    let citations = citations.sorted()
    var left = 0
    var right = citations.count - 1
    while left <= right {
        let mid = (left + right) / 2
        let curr = citations[mid]
        
        // Case 1
        if curr == (right - mid + 1) {
            return curr
        } else if left == right {
            return curr
        } else if curr <= (right - mid + 1) { // Search Right
            left = mid + 1
        
        } else if curr > (right - mid + 1) { // Search Left
            right = mid - 1
        }
    }
    
    return 0
}

//let citations = [0,1,2,3,7,8]
//let citations = [3,0,6,1,5] 
let citations = [1,3,1]
hIndex(citations)
