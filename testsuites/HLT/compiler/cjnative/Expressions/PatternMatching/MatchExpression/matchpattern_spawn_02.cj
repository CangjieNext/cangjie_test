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
    if (case01(1, 2) != ()) {
        return 1
    }
    if (case02() != 0) {
        return 1
    }
    if (case03() != 0) {
        return 1
    }
    return 0
}

func case01(a: Int32, b: Int32) {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    for (item in intArray where item > 3) {
        item
    }
}

func case02() {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    var res = match ((a)) {
        case b => 0
        case _ => 1
    }
    res
}

func case03() {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    (a = 0)
    var res = match ((a)) {
        case b => (b)
        case _ => Int32((1))
    }
    res
}
