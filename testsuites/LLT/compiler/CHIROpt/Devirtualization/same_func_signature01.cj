// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableO2 %f -o %n.%suffix 2>&1
// EXEC-0:%run %run_opt %output %run_args | compare %f
// ASSERT: scan bbbb

open class A {
}

open class B <: A {
    open public func test<T>(x:T): Unit {
        println("aaaa");
    }
    open public func test<T>(x: Int64): Unit {
        println("bbbb");
    }
}

main() {
    B().test<Int64>(1)
}