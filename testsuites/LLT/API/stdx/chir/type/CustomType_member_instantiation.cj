/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f

/* SCAN
member names size: 1
getMember x is Int32: true
inst member types 1: true
implemented ifaces: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.cmi", AccessLevel.Public)
    let st = pkg.addStruct("mP", "Point")
    st.appendInstanceMemberVar("x", IntType.getInt32())
    let sty = StructType.get(st, Array<Type>())

    println("member names size: ${sty.allMemberVarNames.size}")
    println("getMember x is Int32: ${sty.getMemberVarInstantiatedType("x") == IntType.getInt32()}")

    let inst = sty.getInstantiatedMemberVarTypes()
    println("inst member types 1: ${inst.size == 1 && inst[0] == IntType.getInt32()}")
    println("implemented ifaces: ${sty.getImplementedInterfaceTypes().size}")
}
