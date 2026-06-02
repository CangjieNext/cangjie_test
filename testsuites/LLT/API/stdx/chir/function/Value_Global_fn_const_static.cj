/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// GlobalValue：setConst、setStatic（Function）

/* SCAN
fn const static: true true
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.cs", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "cs", "cs", "pkg.cs")
    fn.setConst(true)
    fn.setStatic(true)
    println("fn const static: ${fn.isConst()} ${fn.isStatic()}")
}
