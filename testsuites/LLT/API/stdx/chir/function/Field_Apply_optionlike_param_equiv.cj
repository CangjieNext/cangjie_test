/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// Field：非穷尽 / 双参数 ctor 的 enum 选择器走 UInt32；Apply 多候选 Box/Nothing 等价

/* SCAN
open opt uint: true
two args uint: true
nothing match: true
boxref match: true
*/

import std.collection.*
import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()
    let pkg = Package("pkg.utils.more", AccessLevel.Public)
    let gT = GenericType.get("pkg.utils.more.T", "T")

    // 非穷尽 Option 形态 → isOptionLike false → UInt32
    let openOpt = pkg.addEnum("OpenOpt", "OpenOpt", false)
    openOpt.appendEnumCtorInfo("OpenOpt.None", "None", argTypes: Array<Type>())
    openOpt.appendEnumCtorInfo("OpenOpt.Some", "Some", argTypes: [i32])

    // 穷尽但两 ctor 都带参数 → 非 Option-like
    let pairE = pkg.addEnum("PairE", "PairE", true)
    pairE.appendEnumCtorInfo("PairE.A", "A", argTypes: [i32])
    pairE.appendEnumCtorInfo("PairE.B", "B", argTypes: [i32])

    let host = pkg.addFunction(FuncType.get(Array<Type>(), UnitType.get()), "host", "host", "pkg.utils.more")
    host.initBody()
    let bb = host.body.getOrThrow().entryBlock
    let path0 = ArrayList<UInt64>()
    path0.add(0u64)

    let a1 = Allocate.create(openOpt.enumType)
    bb.appendExpr(a1)
    let f1 = Field.create(a1.result, path0)
    bb.appendExpr(f1)
    println("open opt uint: ${f1.result.ty == IntType.getUInt32()}")

    let a2 = Allocate.create(pairE.enumType)
    bb.appendExpr(a2)
    let f2 = Field.create(a2.result, path0)
    bb.appendExpr(f2)
    println("two args uint: ${f2.result.ty == IntType.getUInt32()}")

    // 多候选父接口：Nothing / BoxRef 参数等价
    let iface = pkg.addClass("I", "I", false, genericTypeParams: [gT])
    let idf = pkg.addFunction(FuncType.get([gT], gT), "I.id", "id", "pkg.utils.more")
    iface.appendMethod(idf)
    let b = pkg.addClass("B", "B", true)
    b.implementedInterfaceTypes = [
        ClassLikeType.get(iface, [i32]),
        ClassLikeType.get(iface, [i64])
    ]
    let thisAlloc = Allocate.create(b.classType)
    bb.appendExpr(thisAlloc)

    let nothFn = pkg.addFunction(FuncType.get([NothingType.get()], UnitType.get()), "n", "n", "pkg.utils.more")
    let nothingArg = nothFn.parameters[0]
    let apN = Apply.create(idf, FuncCallContext([thisAlloc.result, nothingArg], Array<Type>(), Some(thisAlloc.result.ty)))
    bb.appendExpr(apN)
    // Nothing 可匹配任一候选；实现按遍历顺序取第一个匹配 A<Int32>
    println("nothing match: ${apN.result.ty == i32}")

    let boxRef = RefType.get(BoxType.get(i64))
    let boxFn = pkg.addFunction(FuncType.get([boxRef], UnitType.get()), "bx", "bx", "pkg.utils.more")
    let boxArg = boxFn.parameters[0]
    let apB = Apply.create(idf, FuncCallContext([thisAlloc.result, boxArg], Array<Type>(), Some(thisAlloc.result.ty)))
    bb.appendExpr(apB)
    println("boxref match: ${apB.result.ty == i64}")
}
