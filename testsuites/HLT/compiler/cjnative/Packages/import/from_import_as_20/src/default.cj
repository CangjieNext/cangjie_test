/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../module1 ../module2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module1/src/package1/*.cj -o module1/package1.%middle 
// EXEC: %compiler %cmp_opt %compile_lib_opt ./module2/src/package1/*.cj -o module2/package1.%middle 
// EXEC: %compiler %cmp_opt %f module1/package1.%middle module2/package1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import module1.package1.a1 as m1
import module2.package1.a1 as m2

main(): Int64 {
    var res = m1 - m2
    return res
}
