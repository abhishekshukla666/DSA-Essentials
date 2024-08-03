

func calculate(_ s: String) -> Int {
    var stack = [Int]()
    var sign = Character("+")
    var currNum = 0
    
    for c in s + "+" { // add + to string to take care of last num
        print("\(c) *")
        if let num = Int(String(c)) {
            
            currNum = (currNum * 10) + num
            print("\(currNum) #")
        } else if c != " " {
            switch sign {
            case "+": stack.append(currNum)
            case "-": stack.append(-currNum)
            case "*": stack.append(stack.removeLast() * currNum)
            case "/": stack.append(stack.removeLast() / currNum)
            default: continue
            }
            print("\(stack) ^")
            currNum = 0
            sign = c
        }
    }
    
    return stack.reduce(0, +)
}

func calculate_Optimal(_ s: String) -> Int {
    var currSum = 0
    var prevSum = 0
    var sign = Character("+")
    var currNum = 0
    
    for c in s + "+" { // add + to string to take care of last num
        print("\(c) *")
        if let num = Int(String(c)) {
            
            currNum = (currNum * 10) + num
            print("\(currNum) #")
        } else if c != " " {
            switch sign {
            case "+":
                currSum += prevSum
                prevSum = currNum
            case "-": 
                currNum = (-prevSum)
                prevSum = currNum
            case "/":
                prevSum /= currNum
            case "*":
                prevSum *= currNum
            default: continue
            }
            currNum = 0
            sign = c
        }
    }
    
    return currSum + prevSum
}

let input = "24/2"
calculate(input)
calculate_Optimal(input)

