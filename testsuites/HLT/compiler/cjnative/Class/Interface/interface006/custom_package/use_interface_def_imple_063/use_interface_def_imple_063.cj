/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*

enum enum2<T> {
    B(enum1)
}

extend<T> enum2<T> <: MyInterface<enum1> {
    public static func foo1(): Int8 {
        1
    }
}

var en1: enum1 = enum2<Float32>.foo2(enum1.A)
var e1 = match (en1) {
    case A => 1
}

main() {
    if (e1 == 1) {
        return 0
    } else {
        return 1
    }
}
