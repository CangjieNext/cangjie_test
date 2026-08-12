/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let warmup = 100
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

func BenchmarkForInRangeUnClosed(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0


    for _ in 0..<warmup {
        for _ in 0..<x {
            data += 1
         }
        data = 0
    }

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for _ in 0..<x {
            data += 1
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

func BenchmarkForInRangeClosed(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    for _ in 0..<warmup {
        for _ in 0..<x {
            data += 1
         }
        data = 0
    }

    for _ in 0..<reps {
        let startTime = DispatchTime.now()

        for _ in 0...x {
            data += 1
         }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        data = 0
    }

    let perTime = totalTime / Double(reps)

    return perTime
}

print("BenchmarkForinRange_UnClosed_N_1000: \(BenchmarkForInRangeUnClosed(x: 1000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRange_UnClosed_N_1000000: \(BenchmarkForInRangeUnClosed(x: 1000_000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRange_UnClosed_N_1000000000: \(BenchmarkForInRangeUnClosed(x: 1000_000_000).formatted(decimalPoint:2)) ns/op")

print("BenchmarkForinRange_Closed_N_1000: \(BenchmarkForInRangeClosed(x: 1000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRange_Closed_N_1000000: \(BenchmarkForInRangeClosed(x: 1000_000).formatted(decimalPoint:2)) ns/op")
print("BenchmarkForinRange_Closed_N_1000000000: \(BenchmarkForInRangeClosed(x: 1000_000_000).formatted(decimalPoint:2)) ns/op")
