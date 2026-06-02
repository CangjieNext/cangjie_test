/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto OverflowException: in Rune(num), num is not a valid Unicode scalar value!

main(): Int64 {
    var a: UInt32 = 4294967295
    var b = Rune(a)
    var c = UInt32(b)
    if (a != c) {
        return 1
    }
    return 0
}
