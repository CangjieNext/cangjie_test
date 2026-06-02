/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %export cjStackSize=1MB && %run %run_opt %output %run_args | compare %f
// ASSERT:scan true

import std.runtime.*

// Objective: objs traced from stack root should not be reclaimed by GC
main(): Int64 {
    var array = Array<Array<Int64>>(5120, {i => Array<Int64>(5120, repeat: 0)}) // array is a stack root
    var i: Int64 = 0
    while (i < 5120) {
        var tmp = Array<Int64>(i + 1, repeat: i)
        array[i] = Array<Int64>(i + 1, repeat: i) // traced by stack root
        i++
    }
    GC()
    var isAlive: Bool = true
    while (i < 5120) {
        var j: Int64 = 0
        while (j <= i) {
            if (array[i][j] != i) {
                isAlive = false
            }
            j++
        }
        i++
    }
    println(isAlive.toString())
    return 0
}
