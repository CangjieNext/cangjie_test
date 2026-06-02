// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %diff %f.expect %f.macrocall

import test.*

@M[1]
open class Base<T> {
    init(x: T) {}
    @M[1]
    protected open func foo(x: T): String {
        return "Father"
    }
}

@M[1]
class Data<T> <: Base<T> {
    init(input: T) {
        super(input)
    }
    @M[1]
    protected override func foo(x: T): String {
        return "Child"
    }
}

@M[1]
main(): Int64 {
    var data: Data<Int32> = Data<Int32>(0)
    var res: String = data.foo(3)
    if (res == "Child") {
        return 0
    }
    return 1
}
