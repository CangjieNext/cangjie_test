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

var a1: IntNative = -1
var b1: UIntNative = 0

main(): Int64 {
    var c1 = Int32(a1)
    var c2 = UInt32(b1)
    var c3 = Int64(a1)
    if (c1 != -1) {
        return 1
    }
    if (c2 != 0) {
        return 1
    }
    if (c3 != -1) {
        return 1
    }
    return 0
}
