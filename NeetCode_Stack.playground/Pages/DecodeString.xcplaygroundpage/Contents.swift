import Foundation
extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits
        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}

func decodeString(_ s: String) -> String {
    var stack = [String]()
    var result = ""
    for ch in s {
        if ch != "]" {
            stack.append(String(ch))
        } else {
            var subS = ""
            while stack.count > 0 && stack.last! != "[" {
                subS = String(stack.popLast()!) + subS
            }
            stack.popLast()!
            print(subS, stack)
            var multiplier = ""
            while stack.count > 0 && stack.last!.isNumber {
                multiplier = String(stack.popLast()!) + multiplier
            }
            
            print(multiplier)
            for _ in 0..<(Int(multiplier) ?? 0) {
                stack.append(subS)
            }
            
        }
    }
    return "" + stack.joined()
}


let s = "3[a2[c]]"
print(decodeString(s))
