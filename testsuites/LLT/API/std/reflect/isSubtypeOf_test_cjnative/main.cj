/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE)DEPENDENCE: pkg.cj
// (CJNATIVE)EXEC:%compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// (CJNATIVE)EXEC:%compiler %cmp_opt pkg.%middle %n.cj -o %output
// (CJNATIVE)EXEC:%run %run_opt %output %run_args
// (CJNATIVE)ASSERT: scan true\n
// (CJNATIVE)ASSERT: scan true

import std.reflect.*
import pkg.A

interface I0 {}

extend A <: I0 {}

class B <: A {}

main(): Int64 {
    let typeA = TypeInfo.of<A>()
    let typeB = TypeInfo.of<B>()
    let typeI0 = TypeInfo.of<I0>()
    println(typeA.isSubtypeOf(typeI0)) //期望true
    println(typeB.isSubtypeOf(typeI0)) //期望true
    return 0
}
