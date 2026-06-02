// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan-not catch A.
// ASSERT: scan finally.
// ASSERT: scan Exception

class A <: Exception {}

func test() {
    throw A()
}

main(): Int64 {
    var a = 2
    try {
        return 0
    } catch (e: A) {
        print("catch A.\n")
    } finally {
        print("finally.\n")
        test()
    }
    print("success.\n")
    return a - 2
}
