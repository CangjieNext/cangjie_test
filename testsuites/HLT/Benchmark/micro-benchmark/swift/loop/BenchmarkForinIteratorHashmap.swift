/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 1000000
var data = 0

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

@inline(never)
func BenchmarkForin_Hashmap(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    var _map: [Int:Int] = [:]
    for i in 0..<x
    {
        let num = Int.random(in: 1..<100_000)
        _map[num] = i
    }

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for ele in _map {
            data += ele.0
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkForinIteratorHashmap_N_32: \(BenchmarkForin_Hashmap(x: 32).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinIteratorHashmap_N_256: \(BenchmarkForin_Hashmap(x: 256).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinIteratorHashmap_N_2048: \(BenchmarkForin_Hashmap(x: 2048).formatted(decimalPoint:2)) ns/op")
