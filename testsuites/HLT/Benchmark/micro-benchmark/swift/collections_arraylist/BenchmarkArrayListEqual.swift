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

let int_32 = [Int](0...31)
let int_256 = [Int](0...255)
let int_2048 = [Int](0...2047)

let int_32_equal = [Int](0...31)
let int_256_equal = [Int](0...255)
let int_2048_equal = [Int](0...2047)

let compare_int_32_part = [Int](0...15)
let compare_int_256_part = [Int](0...127)
let compare_int_2048_part = [Int](0...1023)

let int_32_partequal = compare_int_32_part + compare_int_32_part
let int_256_partequal = compare_int_256_part + compare_int_256_part
let int_2048_partequal = compare_int_2048_part + compare_int_2048_part

let int_32_unequal = [Int](16...48)

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BenchmarkArrayListEqual_Int64_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_32 == int_32_equal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_Int64_N128() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_256 == int_256_equal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_Int64_N2048() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_2048 == int_2048_equal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_PartEqual_Int64_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
            res = int_32 == int_32_partequal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_PartEqual_Int64_N128() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_256 == int_256_partequal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_PartEqual_Int64_N2048() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_2048 == int_2048_partequal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

func BenchmarkArrayListEqual_Unequal_Int64_N32() ->TimeInterval {
    var totalTime: Double = 0.0
    for _ in 0..<reps {
        let startTime = DispatchTime.now()
        res = int_32 == int_32_unequal
        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }
    return totalTime / Double(reps)
}

print("BenchmarkArrayListEqual_Int64_N32: \(BenchmarkArrayListEqual_Int64_N32().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_Int64_N128: \(BenchmarkArrayListEqual_Int64_N128().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_Int64_N2048: \(BenchmarkArrayListEqual_Int64_N2048().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_PartEqual_Int64_N32: \(BenchmarkArrayListEqual_PartEqual_Int64_N32().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_PartEqual_Int64_N128: \(BenchmarkArrayListEqual_PartEqual_Int64_N128().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_PartEqual_Int64_N2048: \(BenchmarkArrayListEqual_PartEqual_Int64_N2048().formatted(decimalPoint:2))" + " ns/op")
print("BenchmarkArrayListEqual_Unequal_Int64_N32: \(BenchmarkArrayListEqual_Unequal_Int64_N32().formatted(decimalPoint:2))" + " ns/op")
