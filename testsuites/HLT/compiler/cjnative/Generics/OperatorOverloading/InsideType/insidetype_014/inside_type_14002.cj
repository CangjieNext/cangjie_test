/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: a.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package pkg13002

import a.*

main(): Int64 {
    var a: A<Int32> = A<Int32>()
    var b: B<Int32> = B<Int32>()
    var c: C<Int32> = D<Int32>()
    if (!(a * a)) {
        return 1
    }
    if (!(b * b)) {
        return 2
    }
    if (!(c * c)) {
        return 3
    }
    return 0
}
