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
extend str has extend kw: true
extend str has Int32: true
extend str has brace: true
extend str has id comment: true
generic extend str has angle: true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.extend.str", AccessLevel.Public)
    let intTy = IntType.getInt32()
    let ext = pkg.addExtend("mExtI32", intTy)

    let es = ext.toString()
    println("extend str has extend kw: ${es.contains("extend")}")
    println("extend str has Int32: ${es.contains("Int32")}")
    println("extend str has brace: ${es.contains("{")}")
    println("extend str has id comment: ${es.contains("id:")}")

    let g = GenericType.get("geH", "H")
    let gp = Array<GenericType>(1, { _ => g })
    let gext = pkg.addExtend("gExtH", intTy, genericTypeParams: gp)
    let gs = gext.toString()
    println("generic extend str has angle: ${gs.contains("<") && gs.contains(">")}")
}
