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

// Function 带 Annotation + Parameter 带 Annotation，成员函数场景

main() {
    let pkg = Package("pkg.td19", AccessLevel.Public)
    let i32 = IntType.getInt32()
    let i64 = IntType.getInt64()

    let cls = pkg.addClass("mCalculator", "Calculator", true)

    // 成员函数带 Annotation，参数也带 Annotation
    let mf = pkg.addFunction(FuncType.get([i64, i32], i64), "mCalculator.compute", "compute", "pkg.td19")
    let annoFn = Annotation("Benchmark")
    annoFn.argValues = ["warmup=3", "iterations=10"]
    mf.annotations = [annoFn]

    let p0 = mf.parameters[0]
    let annoP0 = Annotation("NonNegative")
    p0.annotations = [annoP0]

    let p1 = mf.parameters[1]
    let annoP1 = Annotation("Range")
    annoP1.argValues = ["0", "1000"]
    p1.annotations = [annoP1]

    mf.initBody()
    mf.body.getOrThrow().entryBlock.appendExpr(Exit.create())
    cls.appendMethod(mf)

    // 静态成员变量
    let sv = pkg.addGlobalVar(i32, "mCalculator.precision", "precision", "pkg.td19")
    cls.appendStaticVar(sv)

    pkg.dump()
    let (data, size) = serializePackage(pkg)
    let pkg2 = deserializePackage(data, size)
    pkg2.dump()
    if (pkg.toString() == pkg2.toString()) {
        return 0
    }
    return 1
}
