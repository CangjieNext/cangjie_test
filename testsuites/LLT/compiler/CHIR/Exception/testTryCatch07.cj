// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan finally ThrowException.
// ASSERT: scan catch B.
// ASSERT: scan finally two.

class A <: Exception {}

class B <: Exception {}

func ThrowException(): Unit {
    try {
        throw B();
    } catch (e: A) {
        print("catch A.\n")
    } finally {
        print("finally ThrowException.\n")
    }
}

main(): Int64 {
    var a = 1
    try {
        ThrowException()
    } catch (b: B) {
        print("catch B.\n")
    } finally {
        print("finally two.\n")
    }
    return a
}