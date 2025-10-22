// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan [Devirtualization] The function call to foo at [30,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [37,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to foo at [41,5] was optimized.

open class AA<T> {
    public open func foo() {}
}

class BB<T> <: AA<T> {
    public func foo() {}
}

open class CA<T> {
    let a: AA<T> = BB<T>()
}

class CB <: CA<Int64> {}

func test<R>() {
    let a = CA<R>()
    let b = a.a
    b.foo()
    0
}

main() {
    let a = CA<Int64>()
    let b = a.a
    b.foo()

    let cb = CB()
    let bb = cb.a
    b.foo()
}