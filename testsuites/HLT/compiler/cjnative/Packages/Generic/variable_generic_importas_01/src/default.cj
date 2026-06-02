/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.a as A

main(): Int64 {
    var r: Int32 = 0
    var m1 = foo<Int32>(A)
    for (i in A) {
        r += i
    }
    for (i in m1) {
        r += i
    }
    if (r != 12) {
        return 1
    }
    return 0
}

func foo<T>(x: Array<T>) {
    return x
}
