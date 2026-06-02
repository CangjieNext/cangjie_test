/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

class C {}

extend C <: TR2<Bool> {
    public operator func [](b: Bool): Bool {
        b
    }
    public operator func **(b: Bool): Bool {
        b
    }
    public operator func *(b: Bool): Bool {
        b
    }
    public operator func /(b: Bool): Bool {
        b
    }
    public operator func %(b: Bool): Bool {
        b
    }
    public operator func +(b: Bool): Bool {
        b
    }
    public operator func -(b: Bool): Bool {
        b
    }
}

extend C <: TR1 {
    public operator func !(): Bool {
        true
    }
}

main(): Int64 {
    var a: Bool = true
    var c = C()
    if (!(c[a])) {
        return 29
    }
    if (!(c ** a)) {
        return 30
    }
    if (!(c * a)) {
        return 31
    }
    if (!(c / a)) {
        return 32
    }
    if (!(c % a)) {
        return 33
    }
    if (!(c + a)) {
        return 34
    }
    if (!(c - a)) {
        return 35
    }
    if (!(!c)) {
        return 36
    }
    return 0
}
