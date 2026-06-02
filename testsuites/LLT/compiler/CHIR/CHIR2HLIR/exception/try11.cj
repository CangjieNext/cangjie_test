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

class B <: Exception {}

func one(): Unit {
    throw A()
}

func two() {
    one()
    0
}

func three() {
    two()
}

func four() {
    three()
}

func five() {
    four()
}

func six() {
    five()
}

func seven() {
    six()
}

func eight() {
    seven()
}

func nine() {
    eight()
}

main(): Int64 {
    var a = 1
    try {
        nine()
    } catch (e: A) {
        e.printStackTrace()
        1
    } finally {
        print("finally one.\n")
    }
    print("success.")
    return a - 1
}
