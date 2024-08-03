
struct Test {
    let highestPriority: (Int, Int) -> Bool
    
    func heighestPriorityFunc() -> Bool {
        return highestPriority(5, 4)
    }
}

let test = Test(highestPriority: <)
test.heighestPriorityFunc()

