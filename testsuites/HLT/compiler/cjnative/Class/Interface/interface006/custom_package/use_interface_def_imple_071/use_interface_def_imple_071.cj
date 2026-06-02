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

main() {
    var i1: fatherInterface1 = Int32(1)
    var i2: MyInterface2 = Int32(1)
    var i3: MyInterface3 = Int32(1)
    var i4: Int32 = Int32(1)

    if (i1.foo1(a: 1) == 2 && i1.b1 == 1 && i2.foo2(a: 1) == 3 && i2.b2 == 2 && i3.foo3(a: 1) == 4 && i3.b3 == 3) {
        if (i4.foo1(a: 1) == 2 && i4.b1 == 1 && i4.foo2(a: 1) == 3 && i4.b2 == 2 && i4.foo3(a: 1) == 4 && i4.b3 == 3) {
            return 0
        }
    }
    return 1
}
