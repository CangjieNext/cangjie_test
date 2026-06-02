/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 0) {
        return 1
    }
    if (case02() != 0) {
        return 1
    }
    if (case03() != 0) {
        return 1
    }
    if (case04() != 0) {
        return 1
    }
    return 0
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

interface equal<T> {
    operator func ==(input_b: T): Bool
}

extend TimeUnit <: equal<TimeUnit> {
    public operator func ==(input_b: TimeUnit): Bool {
        true
    }
}

let a = TimeUnit.Year(2.0)

func case01() {
    var result: String = match (TimeUnit.Year(1.0)) {
        case a => "Yes"
        case Year(y) => "Yes2"
        case _ => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}

let b = (TimeUnit.Year(2.0), TimeUnit.Month(1.0, 2.0))
let c = b[0]

func case02() {
    var result: String = match (b[0]) {
        case c => "Yes"
        case _ => "None"
    }
    if ((result) == "Yes") {
        return 0
    }
    return 1
}

func case03() {
    var result = match (b[0]) {
        case cc => "Yes"
        case _ => "None"
    }
    if ((result) == "Yes") {
        return 0
    }
    return 1
}

func case04() {
    var result = match (0) {
        case cc => "Yes"
        case _ => "None"
    }
    if ((result) == "Yes") {
        return 0
    }
    return 1
}
