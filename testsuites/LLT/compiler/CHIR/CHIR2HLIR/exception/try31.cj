// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan catch A.
// ASSERT: scan finally one.
// ASSERT: scan success.

main(): Int64 {
    var a = 1
    try {
        throw IndexOutOfBoundsException("exception")
    } catch (e: Exception) {
        print("catch A.\n")
    } finally {
        print("finally one.\n")
    }
    a += 9
    print("success.")
    return a - 10
}
