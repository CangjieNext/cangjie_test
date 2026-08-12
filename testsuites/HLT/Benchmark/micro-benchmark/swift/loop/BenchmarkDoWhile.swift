/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 100000000
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
func BenchmarkDoWhile(x: Int) -> TimeInterval {
    var i = 0
    var totalTime: Double = 0.0

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        repeat {
            data += 1
            i += 1
        }while i < x

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkDoWhile_N_1K: \(BenchmarkDoWhile(x: 1000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkDoWhile_N_1B: \(BenchmarkDoWhile(x: 1000_000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkDoWhile_N_1M: \(BenchmarkDoWhile(x: 1000_000_000).formatted(decimalPoint:2)) ns/op")