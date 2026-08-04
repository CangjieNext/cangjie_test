/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 10000000
var res = 0

let int_32 = [Int](0...31)
let int_256 = [Int](0...255)
let int_2048 = [Int](0...2047)

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListGet_Int64_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_32[16]
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListGet_Int64_N256() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_256[128]
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListGet_Int64_N2048() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_2048[1024]
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListGet_Int64_N32: \(BenchmarkArrayListGet_Int64_N32().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListGet_Int64_N256: \(BenchmarkArrayListGet_Int64_N256().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListGet_Int64_N2048: \(BenchmarkArrayListGet_Int64_N2048().formatted(decimalPoint:2))" + " ns/op")