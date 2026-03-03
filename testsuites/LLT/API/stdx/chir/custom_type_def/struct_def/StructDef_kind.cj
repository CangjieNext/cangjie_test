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
isStruct: true
isClassLike: false
isEnum: false
ty isStructType: true
structType eq ty: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.struct.kind", AccessLevel.Public)
    let s = pkg.addStruct("mS", "Point")

    println("isStruct: ${s.isStruct()}")
    println("isClassLike: ${s.isClassLike()}")
    println("isEnum: ${s.isEnum()}")
    println("ty isStructType: ${s.ty.isStructType()}")
    println("structType eq ty: ${s.structType == s.ty}")
}
