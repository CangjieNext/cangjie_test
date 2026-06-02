/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.core.*

unsafe main() {
    var count = 0
    var a0 = LibC.mallocCString("A")
    var b0 = a0.subCString(1)
    LibC.free(a0)

    var a1 = LibC.mallocCString("A")
    try {
        var b1 = a1.subCString(2)
    } catch (e: IndexOutOfBoundsException) {
        count += 1
    }
    LibC.free(a1)

    var a2 = LibC.mallocCString("A")
    var b2 = a2.subCString(1, 0)
    LibC.free(a2)

    var a3 = LibC.mallocCString("A")
    try {
        var b3 = a3.subCString(2, 0)
    } catch (e: IndexOutOfBoundsException) {
        count += 1
    }
    LibC.free(a3)
    return count - 2
}
