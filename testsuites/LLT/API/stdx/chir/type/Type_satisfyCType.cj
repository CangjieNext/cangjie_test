/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// isEqualOrSubTypeOf 见 Type_isEqualOrSubTypeOf_*.cj

/* SCAN
i32 satisfyC: true
cstruct satisfyC: true
plain struct satisfyC: false
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    println("i32 satisfyC: ${i32.satisfyCType()}")

    let pkg = Package("pkg.sc", AccessLevel.Public)
    let cs = pkg.addStruct("mCS", "CS")
    cs.isCStruct = true
    let sty = StructType.get(cs, Array<Type>())
    println("cstruct satisfyC: ${sty.satisfyCType()}")

    let plain = pkg.addStruct("mP", "P")
    println("plain struct satisfyC: ${StructType.get(plain, Array<Type>()).satisfyCType()}")
}
