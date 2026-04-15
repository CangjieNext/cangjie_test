// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj %f.expect
// EXEC: %compiler %cmp_macro macro_define.cj
// EXEC: %run_macro %compiler %cmp_opt --debug-macro %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %diff %f.expect %f.macrocall

import test.*

main(): Int64 {
    var a: Foo = Foo()
    if (a.n != 1) {
        return 1
    }
    a.m = 10
    if (a.m != 2) {
        return 2
    }
    return 0
}

interface I {
    @M[1]
    mut prop m: Int64
    @M[1]
    prop n: Int64
}

class Foo {}

extend Foo <: I {
    @M[1]
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
    @M[1]
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}

@M[1]
interface Coo {
    @M[1]
    mut prop m: Int32
    @M[1]
    prop n: Int32
}
