/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: interface00119a
// EXEC: %compiler %cmp_opt %compile_lib_opt interface00119a/interface00119a.cj -o interface00119a.%middle
// EXEC: %compiler %cmp_opt %f interface00119a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import interface00119a

interface A <: interface00119a.MyInterface {}

class B <: A {}

main(): Int64 {
    var a = B()
    return 0
}
