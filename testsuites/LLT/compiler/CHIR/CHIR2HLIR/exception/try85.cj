// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan OutOfMemoryError

func foo(): Unit {
    let arr1 = Array<Int64>(9223372036854775806, {i => i})
}

main(): Int64 {
    var a = 1
    try {
        foo()
        0
    } catch (e: OutOfMemoryError) {
        a = 3
        e.message
        e.printStackTrace()
        0
    } finally {
        a = 5
    }
    return 1
}
