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
enum isEnum: true
enum isClassLike: false
enum ty isEnumType: true
enumType matches ty: true
generic enum isGeneric: true
generic enum ty isEnumType: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.enum.ty", AccessLevel.Public)
    let ex = pkg.addEnum("mEx", "Color", true)

    println("enum isEnum: ${ex.isEnum()}")
    println("enum isClassLike: ${ex.isClassLike()}")
    println("enum ty isEnumType: ${ex.ty.isEnumType()}")
    println("enumType matches ty: ${ex.enumType == ex.ty}")

    let g = GenericType.get("pkgEnumU", "U")
    let genParams = Array<GenericType>(1, { _ => g })
    let genEnum = pkg.addEnum("GenE", "GenE", true, genericTypeParams: genParams)

    println("generic enum isGeneric: ${genEnum.isGeneric()}")
    println("generic enum ty isEnumType: ${genEnum.ty.isEnumType()}")
}
