// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan An exception has occurred:
// ASSERT: scan at

func foo(): Unit {
    var a = 1
    var b = 2
    throw Exception("this is a Exception");
}

main(): Int64 {
    var a = 1
    try {
        a = 2
        foo()
        0
    } catch (e: Exception) {
        a = 3
        e.printStackTrace()
        0
    } finally {
        a = 5
    }
    return a - 5
}
