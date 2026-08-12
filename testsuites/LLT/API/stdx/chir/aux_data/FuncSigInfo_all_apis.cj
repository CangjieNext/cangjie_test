/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// FuncSigInfo 全部公开接口：两个 init、name / ty / genericTypeParams、toString、dump

/* SCAN
init_no_generic name: foo
init_no_generic generic empty: true
init_with_generic size: 1
prop name: myFunc
prop ty: (Int32) -> Int32
prop ty same: true
prop generic src: T
toString plain: g(Int32) -> Int32
toString generic: h<Generic-pkg:T>(Int32) -> Unit
k(Int32) -> Int32
*/

import stdx.chir.*

main() {
    let i32 = IntType.getInt32()
    let unit = UnitType.get()
    let ft = FuncType.get([i32], i32)
    let ftUnit = FuncType.get([i32], unit)

    let sigPlain = FuncSigInfo("foo", ft)
    println("init_no_generic name: ${sigPlain.name}")
    println("init_no_generic generic empty: ${sigPlain.genericTypeParams.isEmpty()}")

    let g = GenericType.get("pkg.sig:T", "T")
    let sigGeneric = FuncSigInfo("bar", ft, [g])
    println("init_with_generic size: ${sigGeneric.genericTypeParams.size}")

    let sigName = FuncSigInfo("myFunc", FuncType.get([], unit))
    println("prop name: ${sigName.name}")

    let sigTy = FuncSigInfo("f", ft)
    println("prop ty: ${sigTy.ty.toString()}")
    println("prop ty same: ${sigTy.ty == ft}")

    let sigGtp = FuncSigInfo("m", ft, [g])
    println("prop generic src: ${sigGtp.genericTypeParams[0].srcCodeName}")

    let sigStr = FuncSigInfo("g", ft)
    println("toString plain: ${sigStr.toString()}")

    let sigStrG = FuncSigInfo("h", ftUnit, [GenericType.get("pkg:T", "T")])
    println("toString generic: ${sigStrG.toString()}")

    let sigDump = FuncSigInfo("k", ft)
    sigDump.dump()
}
