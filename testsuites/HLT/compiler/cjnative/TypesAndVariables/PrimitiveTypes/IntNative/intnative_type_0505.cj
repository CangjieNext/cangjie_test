/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var b: Array<IntNative> = [1, 2, 3]
    let al: ArrayList<IntNative> = ArrayList<IntNative>(b)
    let arr: Array<IntNative> = al.toArray()
    var sum: IntNative = 0
    for (i in arr) {
        sum = sum + i
    }
    if (sum != 6) {
        return 1
    }
    return 0
}
