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

import {pkga, pkgb, pkga.*, pkgb.*}

main(): Int64 {
    var m1: A = Aoo()
    var m2: pkgb.B1 = Boo1()
    if (m1.a != 1) {
        return 1
    }
    if (Boo1().b1 != 1) {
        return 2
    }
    //if ( pkgb.B2.b2 != 2 ){
    //    return 3
    //}
    if (foo<B2>() != 2) {
        return 4
    }
    return 0
}

func foo<T>() where T <: pkgb.B2 {
    return T.b2
}

func goo<T>() where T <: A {
    return Aoo().a
}
