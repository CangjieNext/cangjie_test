/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Apply：只读 isSuperCall 默认值与 objType dump

/* SCAN
superscall default: true
objType dump: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.ap.super", AccessLevel.Public)
    let callee = pkg.addFunction(FuncType.get([i32], i32), "callee", "callee", "pkg.ap.super")
    callee.initBody()
    callee.body.getOrThrow().entryBlock.appendExpr(Exit.create())

    let host = pkg.addFunction(FuncType.get([i32], UnitType.get()), "host", "host", "pkg.ap.super")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let arg = Constant.create(IntLiteral.get(i32, 1u64))
    bb.appendExpr(arg)

    let fcc = FuncCallContext([arg.result], Array<Type>(), Some(i32))
    let ap = Apply.create(callee, fcc)
    bb.appendExpr(ap)
    let dump = ap.toString()
    // isSuperCall 只读，公开创建路径默认为 false；true 仅由反序列化设置
    println("superscall default: ${!ap.isSuperCall && !dump.contains("isSuperCall")}")
    println("objType dump: ${dump.contains("Int32->")}")
    bb.appendExpr(Exit.create())
}
