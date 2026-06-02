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
    var a: UInt32 = 65535
    var aa: UInt32 = 0
    var b: UInt16 = UInt16(a)
    var bb: UInt16 = UInt16(aa)
    var c: UInt16 = 65535
    var cc: UInt16 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
