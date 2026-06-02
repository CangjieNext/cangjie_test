// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj pkg.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %compiler pkg.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import pkg.*

main() {
    let obja = A()
    if (obja.foo<Int64>(123) != 123) {
        return 1
    }
    let objb = B()
    if (objb.test<Int64>(234) != 234) {
        return 2
    }
    let c = C()
    if (c.foo<Int64>(345) != 345) {
        return 3
    }
    let d = D()
    if (d.test<Int64>(456) != 456) {
        return 4
    }
    let e = E()
    if (e.test<Int64>(567) != 567) {
        return 5
    }
    return 0
}
