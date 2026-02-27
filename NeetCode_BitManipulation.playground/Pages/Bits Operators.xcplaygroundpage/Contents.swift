
/*
 0000 = 0
 0001 = 1
 0010 = 2
 0011 = 3
 0100 = 4
 0101 = 5
 0110 = 6
 0111 = 7
 1000 = 8
 
 1001 = 9
 1010 = 10
 1011 = 11
 1100 = 12
 1101 = 13
 1110 = 14
 1111 = 15
 10000 = 16
 */

var num = 14
num >>= 3
print(num)


print(num & 1)
print(num >> 1)
num >>= 1

print("--------")
print(num & 1)
print(num >> 1)
num >>= 1

print("--------")
print(num & 1)
print(num >> 1)
num >>= 1

print("--------")
print(num & 1)
print(num >> 1)
num >>= 1

// & Operator
print("AND Results")
print(num & 1)
/*
11 = 1011
01 = 0001
 ------------
 & = 0001 = 1
*/
print(num & 2)
/*
11 = 1011
02 = 0010
 ------------
 & = 0010 = 2
*/
print(num & 3)
/*
11 = 1011
03 = 0011
 ------------
 & = 0011 = 3
*/
print(num & 4)
/*
11 = 1011
04 = 0100
 ------------
 & = 0000 = 0
*/
print(num & 5)
/*
11 = 1011
05 = 0101
 ------------
 & = 0001 = 1
*/
print(num & 6)
print(num & 7)
print(num & 8)
print(num & 9)
print(num & 10)
print(num & 11)


// XOR Operator
print("XOR Results")
print(num ^ 1)
/*
11 = 1011
01 = 0001
 ------------
 ^ = 1010 = 10
*/
print(num ^ 2)
/*
11 = 1011
02 = 0010
 ------------
 ^ = 1001 = 9
*/
print(num ^ 3)
/*
11 = 1011
03 = 0011
 ------------
 ^ = 1000 = 8
*/
print(num ^ 4)
/*
11 = 1011
04 = 0100
 ------------
 ^ = 0000 = 0
*/
print(num ^ 5)
/*
11 = 1011
05 = 0101
 ------------
 ^ = 0001 = 1
*/
print(num ^ 6)
print(num ^ 7)
print(num ^ 8)
print(num ^ 9)
print(num ^ 10)
print(num ^ 11)

