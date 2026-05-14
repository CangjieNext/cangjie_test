/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.collection.*
import stdx.chir.*

// Branch, MultiBranch terminators
// fn1 带泛型参数 T, U；fn2 带泛型参数 V, W

main() {
    let pkg = Package("pkg.ser3", AccessLevel.Public)
    let gT = GenericType.get("pkg.ser3.T", "T")
    let gU = GenericType.get("pkg.ser3.U", "U")

    // fn1: Branch on bool param -> trueBlock / falseBlock, each Exit
    let fn1 = pkg.addFunction(FuncType.get([BoolType.get()], UnitType.get()), "fn1", "fn1", "pkg.ser3")
    fn1.genericTypeParams = [gT, gU]
    fn1.initBody()
    let bg1 = fn1.body.getOrThrow()
    let trueBlock = bg1.appendBlock()
    let falseBlock = bg1.appendBlock()
    let param = fn1.parameters[0]
    bg1.entryBlock.appendExpr(Branch.create(param, trueBlock, falseBlock))
    trueBlock.appendExpr(Exit.create())
    falseBlock.appendExpr(Exit.create())

    // fn2: MultiBranch on i32 param -> default + 2 cases, each Exit
    let i32 = IntType.getInt32()
    let gV = GenericType.get("pkg.ser3.V", "V")
    let gW = GenericType.get("pkg.ser3.W", "W")
    let fn2 = pkg.addFunction(FuncType.get([i32], UnitType.get()), "fn2", "fn2", "pkg.ser3")
    fn2.genericTypeParams = [gV, gW]
    fn2.initBody()
    let bg2 = fn2.body.getOrThrow()
    let defBlock = bg2.appendBlock()
    let case0Block = bg2.appendBlock()
    let case1Block = bg2.appendBlock()
    let targets = ArrayList<Block>()
    targets.add(case0Block)
    targets.add(case1Block)
    let cases = ArrayList<UInt64>()
    cases.add(0u64)
    cases.add(1u64)
    bg2.entryBlock.appendExpr(MultiBranch.create(fn2.parameters[0], defBlock, targets, cases))
    defBlock.appendExpr(Exit.create())
    case0Block.appendExpr(Exit.create())
    case1Block.appendExpr(Exit.create())

    
    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
