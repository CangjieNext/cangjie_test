/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// CHIRVisitor：BlockGroup/嵌套 subBg 的 Stop 提前返回，以及默认 action

/* SCAN
walk stop bg early: 1
walk stop nested: 3
walk default action: 7
*/

import std.collection.*
import stdx.chir.*

class StopAtVisitor <: CHIRVisitor {
    public var count: Int64 = 0
    public let limit: Int64

    public init(limit: Int64) {
        this.limit = limit
    }

    public override func action(_: Expression): IRActionMode {
        count += 1
        if (count >= limit) {
            return IRActionMode.Stop
        }
        return IRActionMode.Continue
    }
}

class DefaultActionVisitor <: CHIRVisitor {}

class SuperActionVisitor <: CHIRVisitor {
    public var count: Int64 = 0

    public override func action(ty: Expression): IRActionMode {
        count += 1
        return super.action(ty)
    }
}

func buildSampleBody(pkg: Package): (Function, BlockGroup) {
    let i32 = IntType.getInt32()
    let fn = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "sample", "sample", pkg.name)
    fn.initBody()
    let bg = fn.body.getOrThrow()
    let bb = bg.entryBlock

    bb.appendExpr(Constant.create(IntLiteral.get(i32, 1u64)))

    let lam = Lambda.create(FuncType.get([i32], i32), "Lam", "Lam", ArrayList<GenericType>())
    bb.appendExpr(lam)
    lam.initParameters()
    lam.initBody()
    let lamAlloc = Allocate.create(i32)
    lam.body.entryBlock.appendExpr(lamAlloc)
    lam.returnValue = lamAlloc.result
    lam.body.entryBlock.appendExpr(Exit.create())

    bb.appendExpr(Constant.create(IntLiteral.get(i32, 2u64)))
    bb.appendExpr(Exit.create())

    return (fn, bg)
}

main() {
    let pkg = Package("pkg.ir.vis.stop", AccessLevel.Public)
    let (fn, bg) = buildSampleBody(pkg)

    let bb2 = bg.appendBlock()
    bb2.appendExpr(Constant.create(IntLiteral.get(IntType.getInt32(), 3u64)))

    // Stop 发生在第一个 block 后，walk(bg) 在第二个 block 前因 isStop 提前 return
    let stopBg = StopAtVisitor(1)
    stopBg.walk(bg)
    println("walk stop bg early: ${stopBg.count}")

    // Continue 进入 Lambda，在嵌套 block group 内 Stop
    let stopNested = StopAtVisitor(3)
    stopNested.walk(fn.body.getOrThrow().entryBlock)
    println("walk stop nested: ${stopNested.count}")

    let defVisitor = DefaultActionVisitor()
    defVisitor.walk(fn)
    let superVisitor = SuperActionVisitor()
    superVisitor.walk(fn)
    println("walk default action: ${superVisitor.count}")
}
