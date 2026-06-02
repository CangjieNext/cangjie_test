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
    var b1: fatherInterface = true
    var b2: MyInterface = true
    var b3: Bool = true

    if (b2.foo3().x == 10 && b1.foo2([B(), B()]) is B && b2.foo2([B(), B()]) is B) {
        if (b3.foo3().x == 10 && b3.foo2([B(), B()]) is B) {
            return 0
        }
    }
    return 1
}
