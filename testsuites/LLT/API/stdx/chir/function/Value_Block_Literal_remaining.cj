/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Block / Lambda / Literal leftover public APIs

/* SCAN
replace: true
lambda bg: true
insert throws: true
lits eq: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let u32 = IntType.getUInt32()
    let f64 = FloatType.getFloat64()
    let unit = UnitType.get()
    let pkg = Package("pkg.val.blk.lit", AccessLevel.Public)

    let fn = pkg.addFunction(FuncType.get([i32], unit), "host", "host", pkg.name)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock
    let p0 = fn.parameters[0]
    let gv = pkg.addGlobalVar(i32, "g", "g", pkg.name)

    let c0 = Constant.create(IntLiteral.get(i32, 1u64))
    let c1 = Constant.create(IntLiteral.get(i32, 2u64))
    bb.appendExpr(c0)
    bb.appendExpr(c1)
    let add = BinaryExpression.create(BinaryExprKind.Add, c0.result, c0.result)
    bb.appendExpr(add)
    c0.result.replaceWith(c1.result)
    println("replace: ${add.operands[0] == c1.result}")

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lp = lam.parameters[0]
    lp.srcCodeName = "x"
    let lv = lam.result
    lv.srcCodeName = "lamr"
    let lamTop = lp.topLevelFunc
    let bgLam = lam.body
    let bgOwner = bgLam.topLevelFunc
    let nLamBlocks = bgLam.blocks.size
    bgLam.destroySelf()
    println("lambda bg: ${lp.srcCodeName == "x" && lv.srcCodeName == "lamr" && lamTop == fn && bgOwner == fn && nLamBlocks > 0}")

    var insertNeg = false
    try {
        bb.insertExpr(Exit.create(), -1)
    } catch (_: CHIRException) {
        insertNeg = true
    }
    var badEntry = false
    let fn2 = pkg.addFunction(FuncType.get(Array<Type>(), unit), "fn2", "fn2", pkg.name)
    fn2.initBody()
    try {
        bg.setEntryBlock(fn2.body.getOrThrow().entryBlock)
    } catch (_: CHIRException) {
        badEntry = true
    }
    let extra = bg.appendBlock()
    extra.destroySelf(removeFromOwner: false)
    bb.appendExpr(Exit.create())
    println("insert throws: ${insertNeg && badEntry}")

    let bLit = BoolLiteral.get(true)
    let bLit2: LiteralValue = bLit
    let iLit = IntLiteral.get(u32, 8u64)
    let fLit = FloatLiteral.get(f64, 1.5)
    pkg.addImportedStruct("symStr", "String", "std.core")
    let strTy = pkg.getSpecifiedStructDef("std.core", "String").getOrThrow().structType
    let sLit = StringLiteral.get(strTy, "z")
    let nLit = NullLiteral.get(i32)
    let uLit = UnitLiteral.get()
    let rLit = RuneLiteral.get(Rune(65))
    let gvEq: GlobalValue = gv
    println(
        "lits eq: ${bLit == BoolLiteral.get(true) && !(bLit == BoolLiteral.get(false)) && bLit2 == bLit2 && iLit.isSigned() == false && iLit.signedValue == 8 && fLit == fLit && sLit == sLit && nLit == nLit && uLit == uLit && rLit == rLit && gvEq == gv && p0 == p0 && lv == lv}"
    )
}
