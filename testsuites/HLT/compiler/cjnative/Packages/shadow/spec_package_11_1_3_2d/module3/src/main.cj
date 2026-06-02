/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../module1 ../../module2 ../../module3
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module1/src/p1/*.cj -o module1/p1.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module2/src/p1/*.cj -o module2/p1.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module3/src/p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module1.p1 as A
import module2.p1 as B
import p2.foo as f2

main(): Int64 {
    A.f1()
    B.f2()
    A.f1()
    f2()
    return 0
}
