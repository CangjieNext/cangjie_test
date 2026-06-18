/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CHIRException 默认/带消息构造、getClassName（toString）及运行时抛出

/* SCAN
default toString: CHIRException
message toString: CHIRException: invalid chir state
catch message toString: CHIRException: invalid chir state
builder throws CHIRException: true
builder message has prefix: true
*/

import stdx.chir.*

main() {
    let defaultEx = CHIRException()
    println("default toString: ${defaultEx.toString()}")

    let msg = "invalid chir state"
    let msgEx = CHIRException(msg)
    println("message toString: ${msgEx.toString()}")

    var catchMsg = ""
    try {
        throw CHIRException(msg)
    } catch (e: CHIRException) {
        catchMsg = e.toString()
    }
    println("catch message toString: ${catchMsg}")

    let pkg = Package("pkg.chir.ex", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "ex", "ex", "pkg.chir.ex")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let b = CHIRBuilder(bb)
    let i32 = IntType.getInt32()
    let e = b.createConstant(IntLiteral.get(i32, 1u64))
    e.destroySelf()

    var builderThrows = false
    var builderMsg = ""
    try {
        CHIRBuilder(Before(e))
    } catch (ex: CHIRException) {
        builderThrows = true
        builderMsg = ex.toString()
    }
    println("builder throws CHIRException: ${builderThrows}")
    println("builder message has prefix: ${builderMsg.startsWith("CHIRException:")}")
}
