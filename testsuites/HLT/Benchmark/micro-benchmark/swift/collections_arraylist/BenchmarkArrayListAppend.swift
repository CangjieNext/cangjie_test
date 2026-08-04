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

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListAppendInt64() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr:[Int] = []
        let startTime = DispatchTime.now()
        arr.append(654321)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListAppendUInt8() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr:[UInt8] = []
        let startTime = DispatchTime.now()
        arr.append(UInt8(66))
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListAppendFloat64() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr:[Float64] = []
        let startTime = DispatchTime.now()
        arr.append(Float64(3.14))
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListAppendBool() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var arr:[Bool] = []
        let startTime = DispatchTime.now()
        arr.append(true)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListAppendInt64: \(BenchmarkArrayListAppendInt64().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListAppendUInt8: \(BenchmarkArrayListAppendUInt8().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListAppendFloat64: \(BenchmarkArrayListAppendFloat64().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListAppendBool: \(BenchmarkArrayListAppendBool().formatted(decimalPoint:2))" + " ns/op")