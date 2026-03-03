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
enum extends default: 0
enum extends count: 3
ext0 ty is enum ty: true
ext1 ty is enum ty: true
ext2 ty is enum ty: true
ext ids all distinct: true
enumType getExtendDefs size: 3
ext0 isExtend: true
enum str has ext identifiers: true
enum extends after clear: 0
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ext", AccessLevel.Public)
    let en = pkg.addEnum("mE", "E", true)
    en.appendEnumCtorInfo("mA", "A", argTypes: Array<Type>())

    println("enum extends default: ${en.extends.size}")

    let ex1 = pkg.addExtend("extA", en.ty)
    let ex2 = pkg.addExtend("extB", en.ty)
    let ex3 = pkg.addExtend("extC", en.ty)
    en.extends = Array<ExtendDef>(3, { i =>
        if (i == 0) {
            ex1
        } else if (i == 1) {
            ex2
        } else {
            ex3
        }
    })

    println("enum extends count: ${en.extends.size}")
    println("ext0 ty is enum ty: ${en.extends[0].extendedType == en.ty}")
    println("ext1 ty is enum ty: ${en.extends[1].extendedType == en.ty}")
    println("ext2 ty is enum ty: ${en.extends[2].extendedType == en.ty}")
    let id0 = en.extends[0].identifier
    let id1 = en.extends[1].identifier
    let id2 = en.extends[2].identifier
    println("ext ids all distinct: ${id0 != id1 && id1 != id2 && id0 != id2}")
    println("enumType getExtendDefs size: ${en.enumType.getExtendDefs().size}")
    println("ext0 isExtend: ${en.extends[0].isExtend()}")

    let dump = en.toString()
    println("enum str has ext identifiers: ${dump.contains(ex1.identifier) && dump.contains(ex2.identifier) && dump.contains(ex3.identifier)}")

    en.extends = Array<ExtendDef>()
    println("enum extends after clear: ${en.extends.size}")
}
