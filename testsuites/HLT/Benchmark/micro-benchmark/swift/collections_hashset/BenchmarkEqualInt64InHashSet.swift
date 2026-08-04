/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import Foundation

let reps = 1000_000
var _set_1 = Set<Int>()
var _set_2 = Set<Int>() 
var res = false

let counts:[Int] = [32, 256, 2 * 1024]

extension TimeInterval {
    func formatted(decimalPoint: Int) -> String {
        if (decimalPoint == 2) {
            return String(format: "%.2f", self)
        }
        return String(format: "%.3f", self)
    }
}

func GenerateArray(x: Int) -> [Int]
{
    var a: [Int] = []

    for _ in 0..<x {
        let num = Int.random(in: 1..<100_000_000)
    	a.append(num)
    }   

    return a

}

@inline(never)
func DifferentSize(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)
    let arr_2 = GenerateArray(x: x / 2)

    let cycle = reps / x

    for _ in 0..<cycle {
        _set_1 = Set<Int>(arr)
        _set_2 = Set<Int>(arr_2)

        let startTime = DispatchTime.now()

        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        _set_1.removeAll()
        _set_2.removeAll()
    }

    let perTime = totalTime / Double(cycle) / 10.0

    return perTime
}

@inline(never)
func AllEqual(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)

    let cycle = reps / x

    for _ in 0..<cycle {
        _set_1 = Set<Int>(arr)
        _set_2 = Set<Int>(arr)

        let startTime = DispatchTime.now()

        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        _set_1.removeAll()
        _set_2.removeAll()
    }

    let perTime = totalTime / Double(cycle) / 10.0

    return perTime
}



@inline(never)
func PartEqual(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)
    let arr_1 = arr.prefix(x/4)
    let arr_2 = arr.suffix(x/4)

    let cycle = reps / x

    for _ in 0..<cycle {
        _set_1 = Set<Int>(arr_1)
        _set_2 = Set<Int>(arr_2)

        let startTime = DispatchTime.now()

        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        _set_1.removeAll()
        _set_2.removeAll()
    }

    let perTime = totalTime / Double(cycle) / 10.0

    return perTime
}


@inline(never)
func UnEqual(x: Int) -> TimeInterval {
    var totalTime: Double = 0.0

    let arr = GenerateArray(x:x)
    let arr_2 = GenerateArray(x: x)

    let cycle = reps / x

    for _ in 0..<cycle {
        _set_1 = Set<Int>(arr)
        _set_2 = Set<Int>(arr_2)

        let startTime = DispatchTime.now()

        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2
        res = _set_1 == _set_2

        let endTime = DispatchTime.now()
        totalTime += Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        _set_1.removeAll()
        _set_2.removeAll()
    }

    let perTime = totalTime / Double(cycle) / 10.0

    return perTime
}

for num in counts{
    print("BenchmarkEqualInt64InHashSet_DiffSize_Int64_\(num): \(DifferentSize(x: num).formatted(decimalPoint:2)) ns/op")
}

for num in counts{
    print("BenchmarkEqualInt64InHashSet_AllEqual_Int64_\(num): \(AllEqual(x: num).formatted(decimalPoint:2)) ns/op")
}

for num in counts{
    print("BenchmarkEqualInt64InHashSet_PartEqual_Int64_\(num): \(PartEqual(x: num).formatted(decimalPoint:2)) ns/op")
}

for num in counts{
    print("BenchmarkEqualInt64InHashSet_UnEqual_Int64_\(num): \(UnEqual(x: num).formatted(decimalPoint:2)) ns/op")
}


