// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan OverflowException: sub
// ASSERT: scan default::main()
// ASSERT: scan try86.cj:18

var a = UInt16(6)
var b = UInt16(158)

main(): Int64 {
    -try {
        a
    } catch (e: Exception) {
        b
    }
    return 0;
}
