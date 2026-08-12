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
var res:Int? = 0

let counts:[Int] = [32, 256, 2 * 1024, 16 * 1024, 128 * 1024]

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func GenerateArray(x: Int) -> [Int]
{
    var a: [Int] = []

    for _ in 0..<x {
        let num = Int.random(in: 1..<100_000_000)
    	a.append(num)
    }   

    _set.removeAll()
    _set = Set<Int>(a)

    for _ in 0..<x {
        let num = Int.random(in: 1..<100_000_000)
    	a.append(num)
    }   

    return a

}

@inline(never)
func BenchmarkRemoveFromHashset(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)

    let cycle = reps / x

    for _ in 0..<cycle {
        let startTime = DispatchTime.now()

        for i in arr{
            res = _set.remove(i)
        }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(cycle)

    return perTime
}

for num in counts{
    print("BenchmarkRemoveFromHashset_Int64_\(num): \(BenchmarkRemoveFromHashset(x: num).formatted(decimalPoint:2)) ns/op")
}