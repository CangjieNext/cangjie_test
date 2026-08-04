/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 1000000
var res = [Int64]()

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListInitLamda_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = [Int64](0..<32)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListInitLamda_N256() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = [Int64](0..<256)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListInitLamda_N2048() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = [Int64](0..<2048)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListInitLamda_N32: \(BenchmarkArrayListInitLamda_N32().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListInitLamda_N256: \(BenchmarkArrayListInitLamda_N256().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListInitLamda_N2048: \(BenchmarkArrayListInitLamda_N2048().formatted(decimalPoint:2))" + " ns/op")
