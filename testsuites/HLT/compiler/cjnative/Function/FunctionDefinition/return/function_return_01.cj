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
    if (case01() != 0) {
        return 1
    }
    if (case02() != 0.0) {
        return 2
    }
    if (case03() != 'a') {
        return 3
    }
    if (case04() != "a") {
        return 4
    }
    if (case05()[0] != 1) {
        return 5
    }
    if (case08()[2][0] != 1) {
        return 8
    }
    if (case10()()[2][0] != 1) {
        return 10
    }
    if (match (case11()) {
        case Year(_) => 0
        case Month(_, _) => 1
        case _ => 2
    } != 0) {
        return 11
    }
    return 0
}

func case01(): Int8 {
    let a = 0
    return Int8(a)
}

func case02(): Float16 {
    let a: Float16 = 0.0
    return a
}

func case03() {
    return 'a'
}

func case04() {
    let a = "a"
    return "${a}"
}

func case05() {
    let a = [1, 2, 3] // array
    return a
}

func case08() {
    let a = (1, 2, (1, 2, 3))
    return a
}

func case10() {
    return case08
}

func case11() {
    return Year(1.0)
}

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
}
