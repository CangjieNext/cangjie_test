// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkgA/pkgA.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgA.cj -o pkgA.%middle
// EXEC: %compiler %cmp_opt pkgA.%middle %f --fno-chir-function-inlining -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan Wrapper<T>.m = 43

import pkgA.*

func foo<T>(w: Wrapper<T>): Unit {
    println("Wrapper<T>.m = ${w.run().toString()}")
}

main(): Int64 {
    let w = Wrapper<Int64>(42, 7, { x => x + 1 })
    foo(w)
    return 0
}