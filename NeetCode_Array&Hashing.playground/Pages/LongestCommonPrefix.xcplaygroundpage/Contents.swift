extension String {
    func charAt(_ at: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: at)]
    }
}


func longestCommonPrefix(_ strs: [String]) -> String {
    var res = ""
    for i in 0..<strs[0].count {
        print(i)
        for s in strs {
            if i == s.count || strs[0].charAt(i) != s.charAt(i) {
                return res
            }
            
        }
        res.append(strs[0].charAt(i))
    }
    return res
}

func longestCommonPrefix2(_ strs: [String]) -> String {
    let strs = strs.sorted()
    guard let first = strs.first, let last = strs.last else { return "" }
    
    var index = 0
    while index < first.count && index < last.count && first.charAt(index) == last.charAt(index) {
            index += 1
    }
    return String(first.prefix(index))
}

let strs = ["flower","flow","flight"]
//let strs = [""]
//let strs = ["ab", "a"]
//let strs = ["a"]
//longestCommonPrefix(strs)
longestCommonPrefix2(strs)


