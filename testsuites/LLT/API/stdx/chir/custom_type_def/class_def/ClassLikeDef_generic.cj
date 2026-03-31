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
generic isGeneric: true
generic ty isClassLikeType: true
generic param count: 1
generic param toString: Generic-pkgClassT
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.class.generic", AccessLevel.Public)
    let g = GenericType.get("pkgClassT", "T")
    let genParams = Array<GenericType>(1, { _ => g })
    let genCls = pkg.addClass("GenCls", "GenCls", true, genericTypeParams: genParams)

    println("generic isGeneric: ${genCls.isGeneric()}")
    println("generic ty isClassLikeType: ${genCls.ty.isClassLikeType()}")
    println("generic param count: ${genCls.genericTypeParams.size}")
    println("generic param toString: ${genCls.genericTypeParams[0].toString()}")
}
