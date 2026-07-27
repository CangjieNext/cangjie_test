/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 1000000

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListInsertByLoop_Int64_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr_32 = [Int](0..<32)
        let startTime = DispatchTime.now()
        for i in 0..<32 {
            arr_32.insert(i, at: 1)
        }
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListInsertByLoop_Int64_N256() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr_256 = [Int](0..<256)
        let startTime = DispatchTime.now()
        for i in 0..<256 {
            arr_256.insert(i, at: 1)
        }
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListInsertByLoop_Int64_N2048() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr_2048 = [Int](0..<2048)
        let startTime = DispatchTime.now()
        for i in 0..<2048 {
            arr_2048.insert(i, at: 1)
        }
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListInsertByLoop_Int64_N32: \(BenchmarkArrayListInsertByLoop_Int64_N32().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListInsertByLoop_Int64_N256: \(BenchmarkArrayListInsertByLoop_Int64_N256().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListInsertByLoop_Int64_N2048: \(BenchmarkArrayListInsertByLoop_Int64_N2048().formatted(decimalPoint:2))" + " ns/op")