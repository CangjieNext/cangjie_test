/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p2 -o libpB.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src/p1 -o libpA.%middle %compile_lib_opt
// EXEC: %compiler %cmp_opt %pkg_opt ./mod1/src -o ./ libpA.%middle libpB.%middle
// RUN-EXEC: %run %run_opt %main %run_args

package d

import p1.*

main(): Int64 {
    var a = a1
    var b = a
    return 0
}
