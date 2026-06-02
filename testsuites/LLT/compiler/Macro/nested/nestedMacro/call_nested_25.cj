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

class A<T> {
    public let value = 42
}

// Entry2 can take a TokenStream whose positions are all ZERO.
// For parser for macro, this should be fine. Be aware not to use
// those position information in libast.
@Entry2 // Inner Entry generated tokens has incorrect positions.
class Demo {
    @Entry
    var c: A<Int64> = A<Int64>()
    func getC() {
        return c
    }
}

main() {
    let d = Demo()
    let v = d.getC().value
    if (v != 42) {
        return 1
    }
    0
}
