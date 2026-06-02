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
    var a = 0
    if (case01() != 2 || match (case01()) {
        case a: Int32 => 1;
        case a: Int64 => 0;
        case _ => 2
    } != 0) {
        return 1
    }
    if (case02() != 2 || match (case02()) {
        case a: Int64 => 1;
        case a: Int32 => 0;
        case _ => 2
    } != 0) {
        return 2
    }
    if (case03(1, 2) != 2 || match (case03(2, 1)) {
        case a: Int64 => 1;
        case a: Int32 => 0;
        case _ => 2
    } != 0) {
        return 3
    }
    if (case04(1, 2) != ()) {
        return 3
    }
    return 0
}

func case01() {
    2
}

func case02() {
    Int32(2)
}

func case03(a: Int32, b: Int32) {
    if (a > b) {
        a
    } else {
        b
    }
}

func case04(a: Int32, b: Int32) {
    let intArray: Array<Int32> = [0, 1, 2, 3, 4]
    for (item in intArray where item > 3) {
        item
    }
}
