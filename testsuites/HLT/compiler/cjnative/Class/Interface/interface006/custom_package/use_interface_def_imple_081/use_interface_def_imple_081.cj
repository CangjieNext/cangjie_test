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
    var f1: MyInterface1 = Float64(1.0)
    var f2: MyInterface2 = Float64(1.0)
    var f3: MyInterface3 = Float64(1.0)
    var f4: Float64 = 1.0

    if (f1.foo2(r'a') == "a1" && f2.foo4(r'b') == "bb1" && f3.foo6(r'c') == "c11") {
        if (f4.foo2(r'a') == "a1" && f4.foo4(r'b') == "bb1" && f4.foo6(r'c') == "c11") {
            return 0
        }
    }
    return 1
}
