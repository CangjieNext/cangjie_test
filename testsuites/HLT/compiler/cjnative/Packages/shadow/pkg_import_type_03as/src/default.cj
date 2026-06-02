/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import {pkga.Aoo as alias1, pkgb as alias2, pkga.*, pkgb.*}

main(): Int64 {
    var m1: alias1 = alias1()
    var m2: alias2.Boo1 = Boo1()
    if (m1.a != 1) {
        return 1
    }
    if (alias2.Boo1().b1 != 1) {
        return 2
    }
    if (alias2.Boo2.b2 != 2) {
        return 3
    }
    if (foo<Boo2>() != 2) {
        return 4
    }
    return 0
}

func foo<T>() where T <: alias2.Boo2 {
    return T.b2
}

func goo<T>() where T <: alias1 {
    return alias1().a
}

extend alias1 {}

extend alias2.Boo1 {}
