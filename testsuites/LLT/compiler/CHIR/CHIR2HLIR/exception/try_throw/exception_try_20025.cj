// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan a = 2a = 3a = 4

open class A <: Exception {}

class B <: A {}

func test() {
    var a = 1
    try {
        a = 2
        print("a = ${a}");
        throw B()
    } catch (_: B) {
        a = 3
        print("a = ${a}")
    } finally {
        a = 4
        print("a = ${a}")
    }
}

main() {
    test()
    return 0
}
