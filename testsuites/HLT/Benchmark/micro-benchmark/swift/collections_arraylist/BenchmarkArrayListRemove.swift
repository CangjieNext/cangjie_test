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

func BenchmarkArrayListRemove_Int64_start() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var int_256 = [Int](0...255)
        let startTime = DispatchTime.now()
        int_256.remove(at: 0)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListRemove_Int64_mid() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var int_256 = [Int](0...255)
        let startTime = DispatchTime.now()
        int_256.remove(at: 128)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListRemove_Int64_end() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        var int_256 = [Int](0...255)
        let startTime = DispatchTime.now()
        int_256.remove(at: 255)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListRemove_Int64_start: \(BenchmarkArrayListRemove_Int64_start().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListRemove_Int64_mid: \(BenchmarkArrayListRemove_Int64_mid().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListRemove_Int64_end: \(BenchmarkArrayListRemove_Int64_end().formatted(decimalPoint:2))" + " ns/op")