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
    var a1: faterInterface1<Bool> = [true]
    var a2: MyInterface2<Bool> = [true]
    var a3: MyInterface3<Bool> = [true]
    var a4: Array<Int64> = [1]

    if (a1.foo2(a: false) && a2.foo4(a: false) && a3.foo6(a: false)) {
        if (a4.foo2(a: false) && a4.foo4(a: false) && a4.foo6(a: false)) {
            return 0
        }
    }
    return 1
}
