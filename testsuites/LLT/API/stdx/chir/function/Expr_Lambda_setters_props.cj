/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Lambda：isLocalFunc / isCompileTimeValue / returnValue 替换 / paramDftValHostParam
// 以及 serialize 后 Parameter.paramDftValFunc 反向边（经 toString 文案验证）

/* SCAN
lambda setters: true true true true
param dft link: true true true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let pkg = Package("pkg.lam.set", AccessLevel.Public)
    let fn = pkg.addFunction(FuncType.get([i32], unit), "host", "host", "pkg.lam.set")
    fn.initBody()
    let bb = fn.body.getOrThrow().entryBlock
    let hostParam = fn.parameters[0]

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let a0 = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(a0)
    lam.returnValue = a0.result
    let a1 = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(a1)
    lam.returnValue = a1.result
    lam.body.entryBlock.appendExpr(Exit.create())
    lam.isLocalFunc = true
    lam.isCompileTimeValue = true

    lam.paramDftValHostParam = Some(hostParam)
    let hostComment = "paramDftValHostParam: ${fn.identifier}[${hostParam.identifier}]"
    println("lambda setters: ${lam.isLocalFunc && lam.isCompileTimeValue} ${lam.returnValue == a1.result} ${lam.paramDftValHostParam.getOrThrow() == hostParam} ${lam.toString().contains(hostComment)}")
    bb.appendExpr(Exit.create())

    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    var foundFn: ?Function = None
    for (f in pkg2.functions) {
        if (f.identifier == fn.identifier) {
            foundFn = f
            break
        }
    }
    let fn2 = foundFn.getOrThrow()
    let hostParam2 = fn2.parameters[0]
    var foundLam: ?Lambda = None
    for (e in fn2.body.getOrThrow().entryBlock.exprs) {
        if (let Some(l) <- (e as Lambda)) {
            foundLam = l
            break
        }
    }
    let lam2 = foundLam.getOrThrow()
    let hostOk = lam2.paramDftValHostParam.getOrThrow() == hostParam2
    let hostDumpOk = lam2.toString().contains("paramDftValHostParam: ${fn2.identifier}[${hostParam2.identifier}]")
    let revDumpOk = hostParam2.toString().contains("paramDftValFunc: ${lam2.result.identifier}")
    println("param dft link: ${hostOk} ${hostDumpOk} ${revDumpOk}")
}
