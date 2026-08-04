/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 100000000
var res = false
var _map: [Int:Int] = [:]
var _arr: [Int] = []

let counts:[Int] = [16, 128, 1024, 8192, 65536, 1048576]

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func BeforeEach(x: Int)
{
    var a: [Int:Int] = [:]
    var b: [Int] = []

    for i in 0..<x {
    	b.append(i)
        a[i] = i
    }    

    _map = a
    _arr = b
}

@inline(never)
func BenchmarkHashMapContains(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0
    BeforeEach(x: x)

    let cycle = reps / x

    for _ in 0..<cycle {
        let startTime = DispatchTime.now()

        for k in _arr{
            res = _map.keys.contains(k)
        }

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
    }

    let perTime = totalTime / Double(cycle)

    return perTime
}

for num in counts{
    print("BenchmarkHashMapContains_Int64_\(num): \(BenchmarkHashMapContains(x: num).formatted(decimalPoint:2)) ns/op")
}