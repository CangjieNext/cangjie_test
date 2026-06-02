// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg1.*

func foo() {
    return "hello"
}

@M[1]
class A {
    @M[1]
    let s = "${@M[1](foo())} world ${@M[1](@M[1]func bar() {"42"}; bar())}" // eval M
    let t = "@M[1](hello)" // do not eval M
}

main(): Int64 {
    let a = A()
    if (a.s != "hello world 42") {
        println(a.s)
        return 1
    }
    if (a.t != "@M[1](hello)") {
        println(a.t)
        return 2
    }
    0
}
