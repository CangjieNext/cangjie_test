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

import p1.*

main(): Int64 {
    var r1: A<Int32> = A<Int32>()
    if (r1.a != 1) {
        return 1
    }
    var r2: B<Int32> = B<Int32>()
    if (B<Int32>.a != 1) {
        return 1
    }
    var r3: C<Int32> = C<Int32>(1)

    var r4: D<Int32> = D<Int32>()

    var r5: E<Int32> = E<Int32>()

    return 0
}
