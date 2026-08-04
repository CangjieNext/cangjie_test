/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 100000000
var _set_1 = Set<Int>()
var _set_2 = Set<Int>()
var res = false

let counts:[Int] = [32, 256, 2 * 1024]

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

    return a

}

@inline(never)
func Exist(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)
    let arr_2 = arr.prefix(x/2)
    let cycle = reps / x

    for _ in 0..<cycle{
        _set_1 = Set<Int>(arr)
        _set_2 = Set<Int>(arr_2)
        let startTime = DispatchTime.now()

        res = _set_2.isSubset(of: _set_1)

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(cycle)

    return perTime
}


@inline(never)
func Nonexist(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)
    let arr_2 = GenerateArray(x:x/2)
    let cycle = reps / x

    for _ in 0..<cycle{
        _set_1 = Set<Int>(arr)
        _set_2 = Set<Int>(arr_2)

        let startTime = DispatchTime.now()

        res = _set_2.isSubset(of: _set_1)

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(cycle)

    return perTime
}


for num in counts{
    print("BenchmarkSubsetOfInHashset_Exist_Int64_\(num): \(Exist(x: num).formatted(decimalPoint:2)) ns/op")
}

for num in counts{
    print("BenchmarkSubsetOfInHashset_Nonexist_Int64_\(num): \(Nonexist(x: num).formatted(decimalPoint:2)) ns/op")
}