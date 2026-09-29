// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff all %n.cj
// RUN-EXEC-PIPE-0: %run main

open class A {
    public open func test<T>(x: Int64): Int64 {
        println("a");
        1
    }
}

open class B <: A {
    public open func test<Y>(x: Y): Y {
        println("b");
        x
    }
}

main() {
    B().test(0)
}
