/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 100000000
var _set = Set<Int>()
let counts:[Int] = [32, 256, 2 * 1024, 16 * 1024, 128 * 1024]

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

@inline(never)
func GenerateHashSet(num: Int) -> Set<Int>
{
    var hashset = Set<Int>()  

    for i in 0..<num{
        hashset.insert(i)
    }

    return hashset

}

@inline(never)
func BenchmarkAddToHashset(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let cycle = reps / x

    for _ in 0..<cycle {
        let startTime = DispatchTime.now()
        
        _set = GenerateHashSet(num: x)

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(cycle)

    return perTime
}


for num in counts{
    print("BenchmarkAddToHashset_Int64_\(num): \(BenchmarkAddToHashset(x: num).formatted(decimalPoint:2)) ns/op")
}