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
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

import {pkga.*, pkgb.*}

main(): Int64 {
    var m1: Aoo = Aoo.Time
    var m2: Boo1 = Boo1.Time
    if (m1.a() != 1) {
        return 1
    }
    if (Boo1.Time.b1() != 1) {
        return 2
    }
    if (Boo2.b2() != 2) {
        return 3
    }
    if (foo<Boo2>() != 2) {
        return 4
    }
    return 0
}

func foo<T>() where T <: Boo2 {
    return T.b2()
}

func goo<T>() where T <: Aoo {
    return Aoo.Time.a()
}

extend Aoo {}

extend Boo1 {}
