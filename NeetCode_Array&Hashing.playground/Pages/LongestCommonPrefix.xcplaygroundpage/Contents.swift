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

//let strs = ["flower","flow","flight"]
let strs = [""]
//let strs = ["a"]
longestCommonPrefix(strs)


