
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var a = nums1
    var b = nums2
    let total = nums1.count + nums2.count
    if b.count < a.count {
        a = nums2
        b = nums1
    }
    var left = 0
    var right = a.count - 1
    let half = (nums1.count + nums2.count) / 2
    while left <= right {
        let aMid = (left + right) / 2
        let bMid = half - aMid - 2
        
        // a mid value
        var aLeft = Int.min
        if aMid >= 0 {
            aLeft = a[aMid]
        }
        // a mid+1 value
        var aRight = Int.max
        if (aMid + 1) < a.count {
            aRight = a[aMid + 1]
        }
        
        // b mid value
        var bLeft = Int.min
        if bMid >= 0 {
            bLeft = b[bMid]
        }
        // b mid+1 value
        var bRight = Int.max
        if (bMid + 1) < b.count {
            bRight = b[bMid + 1]
        }
        
        print(aLeft, aRight, terminator: "\t")
        print(bLeft, bRight)
        
        // When partition is correct
        if aLeft <= bRight && bLeft <= aRight {
            // When totoa
            if total % 2 == 0 {
                let first = min(aRight, bRight)
                let second = max(aLeft, bLeft)
                let result: Double = Double(first + second) / 2.0
                return result
            } else {
                return Double(min(aRight, bRight))
            }
            // When partition is not correct
        } else if aLeft < bRight {
            left = aMid + 1
            // When partition is not correct
        } else if aLeft > bRight {
            right = aMid - 1
        }
    }
    return 0.0
}

let nums1 = [1,3]; let nums2 = [2]
findMedianSortedArrays(nums1, nums2)
