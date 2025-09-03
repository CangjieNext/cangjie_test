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
    if (case02() != 0) {
        return 1
    }
    if (case03() != 0) {
        return 1
    }
    if (case05() != 0) {
        return 1
    }
    return 0
}

func case02() {
    let scoreTuple = ("a", 90)
    let b = ("a", 90)
    var result: String = match (scoreTuple) {
        case ("a", 90) => "Yes"
        case (_, _) => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

func case03() {
    let scoreTuple = ("a", TimeUnit.Year(1.0))
    let b = ("a", 90)
    var result: String = match (scoreTuple) {
        case ("a", Year(y)) => "Yes"
        case (_, _) => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}

func case04() {
    let scoreTuple = ("a", TimeUnit.Year(1.0))
    let b = ("a", 90)
    var result: String = match (scoreTuple) {
        case (_, _) => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}

func case05() {
    var result: String = match (TimeUnit.Year(1.0)) {
        case Year(y) => "Yes"
        case Month(x, y) => "No"
        case _ => "None"
    }
    if (result == "Yes") {
        return 0
    }
    return 1
}
