
/*
 
 Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
  

 Example 1:

 Input: s = "cbaebabacd", p = "abc"
 Output: [0,6]
 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input: s = "abab", p = "ab"
 Output: [0,1,2]
 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 
 */


func findAnagrams(_ s: String, _ p: String) -> [Int] {
    let s = Array(s)
    var result = [Int]()
    var dictP = [Character: Int]()
    for ch in p {
        dictP[ch, default: 0] += 1
    }
    var i = 0
    var j = 0
    let k = p.count
    var dictS = [Character: Int]()
    
    while j < s.count {
        dictS[s[j], default: 0] += 1
        if (j - i + 1) == k {
            if dictS == dictP {
                result.append(i)
            }
            dictS[s[i], default: 0] -= 1
            if dictS[s[i], default: 0] <= 0 {
                dictS.removeValue(forKey: s[i])
            }
            i += 1
        }
        j += 1
    }
    
    return result
}

//let s = "cbaebabacd"; let p = "abc"
let s = "abab"; let p = "ab"
print(findAnagrams(s, p))
