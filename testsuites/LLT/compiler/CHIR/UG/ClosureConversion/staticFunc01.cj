// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan good

interface CA<T> {
    static func goo(): Unit
    static func foo() {
        func inner() {
            goo()
        }
        inner()
    }
}

interface CB <: CA<Bool> {
    static func goo() {
        println("good")
    }
}

main() {
    CB.foo()
    0
}
