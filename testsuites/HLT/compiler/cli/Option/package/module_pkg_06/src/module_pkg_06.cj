/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../pro1 ../pro2 ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pro1/src/xoo -o pro1/xoo.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pro1/src/yoo -o pro1/yoo.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pro2/src/zoo -o pro2/zoo.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt src/aoo -o ./aoo.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt src/boo -o ./boo.%middle
// EXEC: %compiler %cmp_opt %f pro1/xoo.%middle pro1/yoo.%middle pro2/zoo.%middle aoo.%middle boo.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import aoo
import boo
import pro1.xoo
import pro1.yoo
import pro2.zoo

main(): Int64 {
    let a = aoo.one
    let b = boo.two
    let e = xoo.x
    let f = yoo.y
    let g = zoo.z
    let res = a + b
    let res2 = e + f + g
    if (res != 3 || res2 != 75) {
        return 1
    }
    return 0
}
