// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan finally one.
// ASSERT: scan success.

class A <: Exception {}

main(): Int64 {
    var a = 1
    try {
        throw A();
    } catch (e: A) {
        // need change, it is empty now.
        e.printStackTrace()
    } finally {
        print("finally one.\n")
    }
    print("success.\n")
    return a - 1
}
