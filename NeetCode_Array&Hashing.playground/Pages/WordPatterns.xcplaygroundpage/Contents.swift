
/*
 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection 
 between a letter in pattern and a non-empty word in s.


 Example 1:

 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true
 Example 2:

 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false
 Example 3:

 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false
 
 */

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    let s = s.split(separator: " ").map { return String($0) }
    if pattern.count != s.count { return false }
    var dict = [String: Character]()
    var dict2 = [Character: String]()
    for (i, ch) in pattern.enumerated() {
        if let value = dict[s[i]], value != ch {
            return false
        }
        if let value2 = dict2[ch], value2 != s[i] {
            return false
        }
        dict[s[i]] = ch
        dict2[ch] = s[i]
    }
    return true
}

//let pattern = "abba", s = "dog cat cat dog"
//let pattern = "abba", s = "dog cat cat fish"
//let pattern = "abba", s = "dog dog dog dog"
let pattern = "aaa", s = "aa aa aa aa"
wordPattern(pattern, s)
