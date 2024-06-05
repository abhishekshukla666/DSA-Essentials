
func countPrime(_ n: Int) -> Int {
    if n < 2 { return 0 }
    var count = 0
    
    var primes = Array(repeating: true, count: n + 1)
    primes[0] = false
    primes[1] = false
    
    var i = 2
    while (i*i) < primes.count {
        debugPrint("i: \(i)")
        if primes[i] {
            var j = i * i
            while j < primes.count {
                debugPrint("j: \(j)")
                primes[j] = false
                j += i
            }
        }
        i += 1
    }
    for (index, value) in primes.enumerated() {
        if value {
            debugPrint(index, terminator: "\n")
            count += 1
        }
    }
    
    return count
    
}

func countPrimeInRootN(_ number: Int) -> Int {
    var count = 0
    for i in 2...number {
        if isPrime(i) {
            count += 1
        }
    }
    return count
}


/*
 find if number = 36 is prime or not
 
 co factors of 36
 {1,36} {2, 18} {3, 12} {4, 9} {6, 6} {9, 4} {12, 3} {18, 2} {36, 1}
 
 we find duplicates pair after the perfect square root so why we go beyond it.
 so: i*i <= n {
 if n % i == 0 { not prime }
 i += 1

 */
func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    var i = 2
    while i*i <= n {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    debugPrint("true for : \(n)")
    return true
}

countPrime(20)


