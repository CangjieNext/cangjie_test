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

var int_16 = [Int](0...15)
var int_128 = [Int](0...127)
var int_1024 = [Int](0...1023)
var int_1048576 = [Int](0...1048575)

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListSetIndex_Int64_N16() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        int_16[8] = 123
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListSetIndex_Int64_N128() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        int_128[64] = 123
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListSetIndex_Int64_N1024() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        int_1024[512] = 123
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListSetIndex_Int64_N1048576() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        int_1048576[524288] = 123
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListSetIndex_Int64_N16: \(BenchmarkArrayListSetIndex_Int64_N16().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListSetIndex_Int64_N128: \(BenchmarkArrayListSetIndex_Int64_N128().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListSetIndex_Int64_N1024: \(BenchmarkArrayListSetIndex_Int64_N1024().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListSetIndex_Int64_N1048576: \(BenchmarkArrayListSetIndex_Int64_N1048576().formatted(decimalPoint:2))" + " ns/op")