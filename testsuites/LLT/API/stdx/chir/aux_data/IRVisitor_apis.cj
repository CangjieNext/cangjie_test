/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// IRActionMode、CHIRVisitor.walk(Function/BlockGroup/Block) 与 action 控制流

/* SCAN
mode continue eq: true
mode stop ne continue: true
mode skip eq: true
walk no body: 0
walk continue count: 6
walk stop count: 2
walk skip lambda: 4
walk two blocks: 7
*/

import std.collection.*
import stdx.chir.*

class CountVisitor <: CHIRVisitor {
    public var count: Int64 = 0

    public override func action(_: Expression): IRActionMode {
        count += 1
        return IRActionMode.Continue
    }
}

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

class SkipLambdaVisitor <: CHIRVisitor {
    public var count: Int64 = 0

    public override func action(ty: Expression): IRActionMode {
        count += 1
        if (ty.isLambda()) {
            return IRActionMode.Skip
        }
        return IRActionMode.Continue
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
    println("mode continue eq: ${IRActionMode.Continue == IRActionMode.Continue}")
    println("mode stop ne continue: ${IRActionMode.Stop != IRActionMode.Continue}")
    println("mode skip eq: ${IRActionMode.Skip == IRActionMode.Skip}")

    let pkg = Package("pkg.ir.vis", AccessLevel.Public)
    let (fn, bg) = buildSampleBody(pkg)

    let noBody = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "nobody", "nobody", pkg.name)
    let emptyVisitor = CountVisitor()
    emptyVisitor.walk(noBody)
    println("walk no body: ${emptyVisitor.count}")

    let contVisitor = CountVisitor()
    contVisitor.walk(fn)
    println("walk continue count: ${contVisitor.count}")

    let stopVisitor = StopAtVisitor(2)
    stopVisitor.walk(fn.body.getOrThrow().entryBlock)
    println("walk stop count: ${stopVisitor.count}")

    let skipVisitor = SkipLambdaVisitor()
    skipVisitor.walk(fn.body.getOrThrow().entryBlock)
    println("walk skip lambda: ${skipVisitor.count}")

    let bb2 = bg.appendBlock()
    bb2.appendExpr(Constant.create(IntLiteral.get(IntType.getInt32(), 3u64)))
    let bgVisitor = CountVisitor()
    bgVisitor.walk(bg)
    println("walk two blocks: ${bgVisitor.count}")
}
