/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 1000000
var _res: [Int:Int] = [:]

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func GenerateArray(x: Int) -> Array<(Int,Int)>
{
    var a: [(Int,Int)] = []

    for i in 0..<x {
        let num = Int.random(in: 1..<100_000_000)
    	a.append((num, i))
    }    

    return a

}

@inline(never)
func BenchmarkInitCollection(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0
    let _arr = GenerateArray(x: x)

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        _res = Dictionary(uniqueKeysWithValues: _arr)

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkHashmapInitCollection_N_32: \(BenchmarkInitCollection(x: 32).formatted(decimalPoint:2)) ns/op")
print("BenchmarkHashmapInitCollection_N_256: \(BenchmarkInitCollection(x: 256).formatted(decimalPoint:2)) ns/op")
print("BenchmarkHashmapInitCollection_N_2048: \(BenchmarkInitCollection(x: 2048).formatted(decimalPoint:2)) ns/op")