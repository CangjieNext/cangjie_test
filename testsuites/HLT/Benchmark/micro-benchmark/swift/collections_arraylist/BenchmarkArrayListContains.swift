/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 10000000
var res = false

let arrayList_16 = [Int](0...15)
let arrayList_128 = [Int](0...127)
let arrayList_4096 = [Int](0...4095)


extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListContains_Int64_N16() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = arrayList_16.contains(8)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListContains_Int64_N128() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = arrayList_128.contains(64)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListContains_Int64_N4096() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = arrayList_4096.contains(2048)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListContains_Notexist_Int64_N16() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = arrayList_16.contains(20)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListContains_Notexist_Int64_N128() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
            res = arrayList_128.contains(130)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListContains_Notexist_Int64_N4096() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = arrayList_4096.contains(5000)
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListContains_Int64_N16: \(BenchmarkArrayListContains_Int64_N16().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListContains_Int64_N128: \(BenchmarkArrayListContains_Int64_N128().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListContains_Int64_N4096: \(BenchmarkArrayListContains_Int64_N4096().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListContains_Notexist_Int64_N16: \(BenchmarkArrayListContains_Notexist_Int64_N16().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListContains_Notexist_Int64_N128: \(BenchmarkArrayListContains_Notexist_Int64_N128().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListContains_Notexist_Int64_N4096: \(BenchmarkArrayListContains_Notexist_Int64_N4096().formatted(decimalPoint:2))" + " ns/op")
