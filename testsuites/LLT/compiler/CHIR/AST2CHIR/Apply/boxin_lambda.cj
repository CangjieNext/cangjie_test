// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

func call(v1: () -> Unit): Unit {
    v1()
}

interface DefaultImpl {
    func test(): Unit {
        println("Hello, World!")
    }
}

struct A <: DefaultImpl {}

main(): Unit {
    call(A().test)
}
