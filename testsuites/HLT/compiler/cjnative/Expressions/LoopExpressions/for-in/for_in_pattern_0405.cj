/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 2.0) {
        return 1
    }
    if (case02() != 10.0) {
        return 2
    }
    if (case04() != 6.0) {
        return 4
    }
    if (case05() != 3.0) {
        return 5
    }
    return 0
}

func case01() {
    let intArray: Array<TimeUnit> = [Year(1.0), Year(2.0)]
    var a: Float32 = 0.0
    for (Year(x) in intArray) { // enum pattern contain variable pattern
        a = x
    }
    a
}

func case02() {
    let intArray: Array<TimeUnit> = [Year(1.0), Year(2.0)]
    var a: Float32 = 0.0
    for (Year(_) // enum patter contain wildcard pattern
        in intArray) {
        a = a + 5.0
    }
    a
}

func case04() {
    let intArray: Array<TimeUnit2> = [Year((1.0, 1.0)), Year((2.0, 2.0))]
    var a: Float32 = 0.0
    for (Year((x, y)) // enum patter contain value-binding pattern,contain variable pattern
        in intArray) {
        a = a + x + y
    }
    a
}

func case05() {
    let intArray: Array<TimeUnit3> = [Year(Year(1.0)), Year(Year(2.0))]
    var a: Float32 = 0.0
    for (Year(Year(x)) // enum patter contain irrefutable enum pattern
        in intArray) {
        a = a + x
    }
    a
}

enum TimeUnit {
    Year(Float32)
}

enum TimeUnit2 {
    Year((Float32, Float32))
}

enum TimeUnit3 {
    Year(TimeUnit)
}
