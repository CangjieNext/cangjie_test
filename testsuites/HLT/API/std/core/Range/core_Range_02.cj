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

var gv_zero = 0

main() {
    var count = 0
    var a1 = Range<Int64>(1, 3, 1, false, false, false)
    var a2 = Range<Int64>(1, 3, 1, false, false, true)
    var a3 = Range<Int64>(1, 3, -1, false, false, true)
    var b: Range<Int64> = 1..3

    if (a1 == b) {
        count += 1
    }

    if (a2 != b) {
        count += 1
    }
    if (a1.isEmpty() == false) {
        count += 1
    }

    if (a3.isEmpty() == true) {
        count += 1
    }
    try {
        var a = Range<Int64>(1, 3, gv_zero, true, true, true)
    } catch (e: IllegalArgumentException) {
        count += 1
    }

    return count - 5
}
