/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// StructType：isCStruct 标记与 satisfyCType

/* SCAN
cstruct satisfyC: true
plain struct satisfyC: false
cstruct toggled off: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sat.st", AccessLevel.Public)

    let cs = pkg.addStruct("mCS", "CS")
    cs.isCStruct = true
    println("cstruct satisfyC: ${StructType.get(cs, Array<Type>()).satisfyCType()}")

    let plain = pkg.addStruct("mP", "P")
    println("plain struct satisfyC: ${StructType.get(plain, Array<Type>()).satisfyCType()}")

    let toggle = pkg.addStruct("mTog", "Tog")
    toggle.isCStruct = true
    toggle.isCStruct = false
    println("cstruct toggled off: ${StructType.get(toggle, Array<Type>()).satisfyCType()}")
}
