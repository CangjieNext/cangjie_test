/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 100
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
func BenchmarkForInRangeWhereUnClosed(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for j in 0..<x where j % 2 == 1{
            data += 1
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

@inline(never)
func BenchmarkForInRangeWhereClosed(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for j in 0..<x where j % 2 == 1{
            data += 1
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkForinRangeWhere_UnClosed_N_1000: \(BenchmarkForInRangeWhereUnClosed(x: 1000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRangeWhere_UnClosed_N_1000000: \(BenchmarkForInRangeWhereUnClosed(x: 1000_000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRangeWhere_UnClosed_N_1000000000: \(BenchmarkForInRangeWhereUnClosed(x: 1000_000_000).formatted(decimalPoint:2)) ns/op")

print("BenchmarkForinRangeWhere_Closed_N_1000: \(BenchmarkForInRangeWhereClosed(x: 1000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRangeWhere_Closed_N_1000000: \(BenchmarkForInRangeWhereClosed(x: 1000_000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRangeWhere_Closed_N_1000000000: \(BenchmarkForInRangeWhereClosed(x: 1000_000_000).formatted(decimalPoint:2)) ns/op")
