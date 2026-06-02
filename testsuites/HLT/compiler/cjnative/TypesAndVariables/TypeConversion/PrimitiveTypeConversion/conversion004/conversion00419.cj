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
    var a: Int8 = 127
    var aa: Int8 = 0
    var b: UInt32 = UInt32(a)
    var bb: UInt32 = UInt32(aa)
    var c: UInt32 = 127
    var cc: UInt32 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
