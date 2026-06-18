/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// InsertPosition Before/After 在 expr 不在 block 中时抛出 CHIRException

/* SCAN
before throws: true
after throws: true
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let pkg = Package("pkg.cb.ins", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ins", "ins", "pkg.cb.ins")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b = CHIRBuilder(bb)

    let e1 = b.createConstant(IntLiteral.get(i32, 1u64))
    e1.destroySelf()
    var beforeThrows = false
    try {
        CHIRBuilder(Before(e1))
    } catch (_: Exception) {
        beforeThrows = true
    }

    let e2 = b.createConstant(IntLiteral.get(i32, 2u64))
    e2.destroySelf()
    var afterThrows = false
    try {
        CHIRBuilder(After(e2))
    } catch (_: Exception) {
        afterThrows = true
    }

    println("before throws: ${beforeThrows}")
    println("after throws: ${afterThrows}")
}
