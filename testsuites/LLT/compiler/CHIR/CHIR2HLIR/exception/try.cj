// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan try
// ASSERT: scan catch A
// ASSERT: scan finally

class A <: Exception {}

class B <: Exception {}

func foo() {
    throw A()
}

main(): Int64 {
    try {
        print("try\n")
        foo()
    } catch (e: A) {
        print("catch A\n")
    } catch (e: B) {
        print("catch B\n")
    } finally {
        print("finally\n")
    }
    return 0
}
