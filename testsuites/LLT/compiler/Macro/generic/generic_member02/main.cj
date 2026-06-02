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
    let a = A()
    if (a.foo<Int64>(22) != 22) {
        return 1
    }
    let b = B()
    if (b.test<Int64>(33) != 33) {
        return 2
    }
    let c = C()
    if (c.foo<Int64>(44) != 44) {
        return 3
    }
    let d = D()
    if (d.test<Int64>(55) != 55) {
        return 4
    }
    return 0
}
