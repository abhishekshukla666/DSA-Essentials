
import Foundation

class Codec {
    func encode(_ strs: [String]) -> String {
        if strs.isEmpty { return "#" }
        var counts = [String]()
        for str in strs {
            counts.append("\(str.count)")
        }
        let encodedString = counts.joined(separator: ",") + "#" + strs.joined()
        return encodedString
    }

    func decode(_ s: String) -> [String] {
        if s == "#" { return [] }
        let index = s.firstIndex(of: "#")!
        
        let counts = String(s[s.startIndex...s.index(before: index)]).components(separatedBy: ",")
        var sIndex = s.index(after: index)
        var decodedStrings = [String]()
        for count in counts {
            let endIndex = s.index(sIndex, offsetBy: Int(count)! - 1)
            if sIndex > endIndex {
                decodedStrings.append("")
                continue
            }
            decodedStrings.append(String(s[sIndex...endIndex]))
            sIndex = s.index(after: endIndex)
        }
        return decodedStrings
    }
}

let code = Codec()
let encoded = code.encode(["Hello World!", "this needs to be encoded"])
print(encoded)
print(code.decode(encoded))
