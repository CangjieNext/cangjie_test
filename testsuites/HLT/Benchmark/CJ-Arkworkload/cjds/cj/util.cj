/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.sort.*
import std.time.*
 
let PERCENTILE_DIVISOR: Float64 = 100.0
let NUMBER_THOUSAND: Float64 = 1000.0

func compareNumbers(a: Float64, b: Float64): Int64 {
    if (a == b) {
        return 0
    }
    if (a < b) {
        return -1
    }
    if (a > b) {
        return 1
    }
    
    // We say that NaN is smaller than non-NaN.
    if (a == a) {
        return 1
    }
    return -1
}

func averageAbovePercentile(numbers: ArrayList<Float64>, percentile: Float64): Float64 {
  // Don't change the original array.
  // Sort in ascending order.
    numbers.sortDescending()
    
    // Now the elements we want are at the end. Keep removing them until the array size shrinks too much.
    // Examples assuming percentile = 99:
    //
    // - numbers.length starts at 100: we will remove just the worst entry and then not remove anymore,
    //   since then numbers.length / originalLength = 0.99.
    //
    // - numbers.length starts at 1000: we will remove the ten worst.
    //
    // - numbers.length starts at 10: we will remove just the worst.
    var numbersWeWant: ArrayList<Float64> = ArrayList<Float64>()
    let originalLength = numbers.size
 
    while (Float64(numbers.size) / Float64(originalLength) > percentile / PERCENTILE_DIVISOR) {
        var index = numbers.size - 1
        numbersWeWant.add(numbers[index])
        numbers.remove(at: index)
    }
    
    var sum = 0.0
    for (number in numbersWeWant) {
        sum += number
    }
    let result = sum / Float64(numbersWeWant.size)
    
    if ((numbers.size > 0) && (result < numbers[numbers.size - 1])) {
        throw Exception("Sanity check fail: the worst case result is " + "${result}" + " but we didn't take into account " + "${numbers}")
    }
    
    return result
}

var currentTime: () -> DateTime = { => Timer().getTime() }
