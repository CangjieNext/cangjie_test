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
func BenchmarkForin_Hashset(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    var _set = Set<Int>()
    for _ in 0..<x
    {
        let num = Int.random(in: 1..<100_000)
        _set.insert(num)
    }

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for ele in _set {
            data += ele
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkForinIteratorHashset_N_32: \(BenchmarkForin_Hashset(x: 32).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinIteratorHashset_N_256: \(BenchmarkForin_Hashset(x: 256).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinIteratorHashset_N_2048: \(BenchmarkForin_Hashset(x: 2048).formatted(decimalPoint:2)) ns/op")
